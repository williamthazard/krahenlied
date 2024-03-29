# krähenlied
a poetry sequencer for monome crow &amp; druid

“What is a poet? A poet is an unhappy being whose heart is torn by secret sufferings, but whose lips are so strangely formed that when the sighs and the cries escape them, they sound like beautiful music.”<br>
-Søren Kierkegaard, Either/Or

begin by giving your poem a title using the title function (i.e., typing ```title``` followed by your title in quotes), like so

```title "Christabel"```

this will start the clocks running and create an initial sequence

continue by updating the sequence in druid by typing ```text``` followed by a new line of poetry in quotes — e.g.,

```text "'Tis the middle of night by the castle clock,"```

each new line will determine the following:

1) pitch (v/8) from crow outputs 1 & 3
2) slew time between pitches from outputs 1 & 3
3) AR envelope shapes from outputs 2 & 4
4) sequences for 6 Just Friends synth voices
5) level for each note event on Just Friends in synthesis mode
6) repeats and divisions for Just Friends geode rhythms
7) quantization value for Just Friends in geode mode
8) virtual voltages to be sent to the run jack on Just Friends
9) playback speed and direction for w/tape
10) creation, activation, and deactivation of loops on w/tape
11) playhead position on w/tape
12) clock synch divisions for all of the above

note: it's probably best to reset crow after using this script and before using another one or using this one again. Not doing so can lead to crashes.
