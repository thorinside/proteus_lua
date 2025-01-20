# Proteus in LUA for Disting NT

I've always loved @abluenautilus and his Proteus sequencer for VCV Rack. This is a port of some of the C++ code to LUA for the Disting NT firmware 1.6.0 and higher (beta at the time of this writing).

## Routing

Clock -> Input 1

Pitch -> Output 1
Gate -> Output 2

Or however you want to configure it.

## Parameters

*Sequence Length* - Changes the sequence length on the fly, 32 notes are always generated, you choose which play.

*Rest Probability* - The probabilty that a note will be a rest.

*Sequence Probability* - The probability that the sequencer will get bored and generate a new sequence.

*Gate Duration* - The length of the generated gates.

*Base Octave* - The octave of the notes.

*Scale* - Major, Minor, Phrygian, Major Pentatonic, Minor Pentatonic, Miyako Bushi, and Prometheus. The last two are my favourite. Feel free to add a few of your own.

## Installing

Put this onto your Disting NT SD Card into the /programs/lua/ folder.

## Using

In order to use this, add a 'Lua Script' algorithm to your preset, and select 'proteus.lua'. Clock your NT, and set up the routing so that the pitch and gate go somewhere. For example, run pitch and gate out to an analog oscillator and a VCA, and play with the parameters to make different melodies. Hear one you like, set the sequence probability to 0 and jam with it.

I do not hold any rights to the name Proteus, or Disting NT, I'm just acknowledging some fine ideas.
