# Proteus in LUA for Disting NT

I've always loved @abluenautilus and his Proteus sequencer for VCV Rack. This is a port of some of the C++ code
to LUA for the Disting NT firmware 1.6.0 and higher (beta at the time of this writing).

Clock -> Input 1

Pitch -> Output 1
Gate -> Output 2

Or however you want to configure it.

Parameters:

Sequence Length - Changes the sequence length on the fly, 32 notes are always generated, you choose which play.
Rest Probability - The probabilty that a note will be a rest.
Sequence Probability - The probability that the sequencer will get bored and generate a new sequence.
Gate Duration - The length of the generated gates.
Base Octave - The octave of the notes.
Scale - Major, Minor, Phrygian, Major Pentatonic, Minor Pentatonic, Miyako Bushi, and Prometheus

I do not hold any rights to the name Proteus, or Disting NT, I'm just acknowledging some fine ideas.
