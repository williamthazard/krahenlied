# krahenlied
a poetry sequencer for monome crow &amp; druid

update the sequence in druid by typing ```text``` followed by a new line of poetry in quotes — e.g.,

```text "'Tis the middle of night by the castle clock,"```

your new line will determine the following:

1) pitch (v/8) from crow outputs 1 & 3
2) slew time between pitches from outputs 1 & 3
3) envelope shapes from outputs 2 & 4
4) sequences for 4 Just Friends synth voices
5) level for each note event on Just Friends
6) playback speed and direction for w/tape
7) creation, activation, and deactivation of loops on w/tape
8) playhead position on w/tape
9) clock synch divisions for all of the above

note: it's probably best to reset crow after using this script and before using another one or using this one again. Not doing so can lead to crashes.
