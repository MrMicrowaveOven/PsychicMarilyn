# Psychic Marilyn

This is a fun little app that I made just for myself.  The image of Marilyn changes based on whether I should:

1. Leave for Bart now,
2. Be ready to leave in 2-4 minutes, OR
3. Chill for a bit, and be ready to leave in 5+ minutes.

This is selfishly based on the fact that 90% of my Bart usage is taking it into San Francisco from my place in Oakland, and that the City Center Station is about a 7 minute walk from my house.

I think it's inefficient to:
1. Look at the clock to see what time it is.
2. Look at the Bart schedule to see when the next bart is (using #1 + however long it takes to get to Bart).
3. Figure out how long you have to go (#2 - #1 - however long it takes to get to Bart).

With my app, I simply ask Marilyn and she tells me whether or not it's time to leave.

# The Picture of Marilyn Monroe

This was the first step towards an IoT version of Psychic Marilyn.  I now have a portrait of Marilyn Monroe in my living room that changes color (Phillips Hue lightbulb) based on whether or not I should leave for Bart from my house.  This way I can simply look at Ms. Marilyn to see how long until I need to leave.

While this could have been done using this Rails version, I chose to access the Hue bulbs from a Raspberry Pi running inside the house.  This avoided creating a Hue Bridge, or giving too many permissions to ITTT.  The Python version of this app can be found [here](https://github.com/MrMicrowaveOven/PsychicMarilynPython).
