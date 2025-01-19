local sequence = {}
local maxSteps = 32
local sequenceLength = 16
local restProbability = 20 -- percentage
local currentStep = 1
local gateDuration = 0.1 -- seconds
local timeSinceGate = 0
gateActive = false

local baseOctave = 4
local scale = {0, 2, 4, 5, 7, 9, 11} -- Major scale intervals
local rootNote = 0 -- C

-- Utility functions
local function generateNote()
    local scaleDegree = math.random(1, #scale)
    local octave = baseOctave + math.random(-1, 1)
    local note = rootNote + scale[scaleDegree] + octave * 12
    return note / 12 -- Convert MIDI note to volts (volt-per-octave)
end

local function generateSequence()
    for i = 1, maxSteps do
        local isRest = math.random(100) <= restProbability
        if isRest then
            sequence[i] = {pitch = 0, gate = false}
        else
            sequence[i] = {pitch = generateNote(), gate = true}
        end
    end
end

generateSequence()

return {
    name = "Generative Sequencer",
    author = "Converted",

    init = function(self)
        return {
            inputs = 0,
            outputs = 2,
            parameters = {
                {"Sequence Length", 1, maxSteps, sequenceLength, kInt},
                {"Rest Probability", 0, 100, restProbability, kPercent},
                {"Gate Duration", 0.01, 1.0, gateDuration, kSeconds},
                {"Base Octave", -2, 5, baseOctave, kInt},
            }
        }
    end,

    step = function(self, dt, inputs)
        timeSinceGate = timeSinceGate + dt

        -- Update parameters
        sequenceLength = math.floor(self.parameters[1])
        restProbability = math.floor(self.parameters[2])
        gateDuration = self.parameters[3]
        baseOctave = math.floor(self.parameters[4])

        -- Check gate status
        if gateActive and timeSinceGate >= gateDuration then
            gateActive = false
        end

        -- Move to the next step
        if not gateActive then
            currentStep = currentStep + 1
            if currentStep > sequenceLength then
                currentStep = 1
                generateSequence() -- Optionally regenerate the sequence
            end

            local stepData = sequence[currentStep]
            if stepData.gate then
                gateActive = true
                timeSinceGate = 0
            end
        end

        -- Outputs
        local pitchOut = sequence[currentStep].pitch
        local gateOut = gateActive and 5 or 0 -- 5V for gate high, 0V for low

        return {pitchOut, gateOut}
    end,

    draw = function(self)
        -- Simple representation of the sequence
        local xStart = 10
        local yStart = 10
        local stepWidth = 4
        local stepHeight = 10

        for i = 1, sequenceLength do
            local stepData = sequence[i]
            local x = xStart + (i - 1) * stepWidth
            local y = yStart

            if stepData.gate then
                drawRectangle(x, y, x + stepWidth, y + stepHeight, 1) -- Draw filled rectangle for active steps
            else
                drawRectangle(x, y, x + stepWidth, y + stepHeight, 0) -- Draw empty rectangle for rests
            end

            if i == currentStep then
                drawRectangle(x, y - 2, x + stepWidth, y - 1, 1) -- Highlight current step
            end
        end
    end
}

