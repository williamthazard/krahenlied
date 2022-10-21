---krahenlied.
--begin by giving your poem a title using the title function (i.e., typing title followed by your title in quotes), like so:
--title "Christabel"
--this will start the clocks running and create an initial sequence
--continue by updating the sequence in druid by typing text followed by a new line of poetry in quotes — e.g.,
--text "'Tis the middle of night by the castle clock,"
--note: it's probably best to reset crow after using this script and before using another one or using this one again. Not doing so can lead to crashes
  text_string = "aaaaaa"
  function remap(ascii)
    ascii = ascii % 32 + 1
    return ascii
  end
  function processString(s)
    local tempScalar = {}
    for i = 1, #s do
      table.insert(tempScalar,remap(s:byte(i)))
    end
    return tempScalar
  end
  function jfmap(ascii)
    ascii = ascii % 5 + 1
    return ascii
  end
  function jfscaling(j)
    local tempScalar = {}
    for i = 1, #j do
     table.insert(tempScalar,jfmap(j:byte(i)))
    end
    return tempScalar
  end
  s = sequins(processString(text_string))
  j = sequins(jfscaling(text_string))
  function set()
    s:settable(processString(text_string))
    j:settable(jfscaling(text_string))
  end
  function title(str)
    text_string = str
    set()
    coro_id = clock.run(notes_event)
              clock.run(other_event)
              clock.run(jfa_event)
              clock.run(jfb_event)
              clock.run(jfc_event)
              clock.run(jfd_event)
              clock.run(jfe_event)
              clock.run(jff_event)
              clock.run(run_event)
              clock.run(quantize_event)
              clock.run(with_event)
              clock.run(rev_event)
              clock.run(looper)
  end
  function text(str)
    text_string = str
    set()
  end
  function init()
    input[1].mode('clock')
    bpm = clock.tempo  
    ii.jf.mode(1)
    ii.jf.run_mode(1)
    ii.jf.tick(bpm)
    ii.wtape.timestamp(1)
    ii.wtape.freq(0)
    ii.wtape.play(1)
  end
  function notes_event()
    while true do
      clock.sync(s()/s:step(2)())
      output[1].volts = s:step(3)()/12
      output[1].slew = s:step(4)()/300
      output[2].action = {to(5,dyn{attack=1}/20), to(3,dyn{decay=1}/20), to(3,dyn{sustain=1}/20), to(0,dyn{release=1}/20)}
      output[2].dyn.attack = s:step(6)()
      output[2].dyn.decay = s:step(7)()
      output[2].dyn.sustain = s:step(8)()
      output[2].dyn.release = s:step(9)()
      output[2]()
    end
  end
  function other_event()
    while true do
      clock.sync(s:step(10)()/s:step(11)())
      output[3].volts = s:step(12)()/12
      output[3].slew = s:step(13)()/300
      output[4].action = {to(5,dyn{attack=1}/20), to(3,dyn{decay=1}/20), to(3,dyn{sustain=1}/20), to(0,dyn{release=1}/20)}
      output[4].dyn.attack = s:step(15)()
      output[4].dyn.decay = s:step(16)()
      output[4].dyn.sustain = s:step(17)()
      output[4].dyn.release = s:step(18)()
      output[4]()
    end
  end
  function jfa_event()
    while true do
      clock.sync(s:step(19)()/s:step(20)())
      ii.jf.play_voice(1, s:step(21)()/12, j:step(22)())
    end
  end
  function jfb_event()
    while true do
      clock.sync(s:step(23)()/s:step(24)())
      ii.jf.play_voice(2, s:step(25)()/12, j:step(26)())
    end  
  end
  function jfc_event()
    while true do
      clock.sync(s:step(27)()/s:step(28)())
      ii.jf.play_voice(3, s:step(29)()/12, j:step(30)())
    end
  end
  function jfd_event()
    while true do
      clock.sync(s:step(31)()/s:step(32)())
      ii.jf.play_voice(4, s:step(33)()/12, j:step(34)())
    end
  end
  function jfe_event()
    while true do
      clock.sync(s:step(35)()/s:step(36)())
      ii.jf.play_voice(5, s:step(37)()/12, j:step(38)())
    end
  end
  function jff_event()
    while true do
      clock.sync(s:step(39)()/s:step(40)())
      ii.jf.play_voice(6, s:step(41)()/12, j:step(42)())
    end
  end
  function run_event()
    while true do
      clock.sync(s:step(43)()/s:step(44)())
      ii.jf.run(j:step(45)())
    end
  end
  function quantize_event()
    while true do
      clock.sync(s:step(46)()/s:step(47)())
      ii.jf.quantize(s:step(48)())
    end
  end
  function with_event()
    while true do
      clock.sync(s:step(49)()/s:step(50)())
      ii.wtape.speed(s:step(51)(), s:step(52)())
    end
  end
  function rev_event()
    while true do
      clock.sync(s:step(53)()/s:step(54)())
      ii.wtape.reverse()
    end
  end
  function looper()
    while true do
      clock.sync(s:step(55)()/s:step(56)())
      ii.wtape.loop_start()
      clock.sync(s:step(57)()/s:step(58)())
      ii.wtape.loop_end()
        if s:step(59)() < 17 then
          for i = 1,j:step(60)() do 
            clock.sync(s:step(61)()/s:step(62)())
            ii.wtape.loop_scale(s:step(63)()/s:step(64)())
            for i = 1,j:step(65)() do
              clock.sync(s:step(66)()/s:step(67)())
              ii.wtape.loop_next(s:step(68)()-s:step(69)())
            end 
          end
        elseif s:step(59)() >= 17 then
          for i = 1,j:step(70)() do
            clock.sync(s:step(71)()/s:step(72)())
            ii.wtape.loop_next(s:step(73)()-s:step(74)())
            for i = 1,j:step(75)() do
              clock.sync(s:step(76)()/s:step(77)())
              ii.wtape.loop_scale(s:step(78)()/s:step(79)())
            end
          end
        end
      clock.sync(s:step(80)()/s:step(81)())
      ii.wtape.loop_active(0)
        for i = 1,s:step(82)() do
          clock.sync(s:step(83)()/s:step(84)())
          ii.wtape.seek((s:step(85)()*300)-(s:step(86)()*300))
        end
        for i = 1,j:step(87)() do
          clock.sync(s:step(88)()/s:step(89)())
          ii.wtape.loop_active(1)
          if s:step(90)() < 17 then
            for i = 1,j:step(91)() do 
              clock.sync(s:step(92)()/s:step(93)())
              ii.wtape.loop_scale(s:step(94)()/s:step(95)())
              for i = 1,j:step(96)() do
                clock.sync(s:step(97)()/s:step(98)())
                ii.wtape.loop_next(s:step(99)()-s:step(100)())
              end 
            end
          elseif s:step(90)() >= 17 then
            for i = 1,j:step(101)() do
              clock.sync(s:step(102)()/s:step(103)())
              ii.wtape.loop_next(s:step(104)()-s:step(105)())
              for i = 1,j:step(106)() do
                clock.sync(s:step(107)()/s:step(108)())
                ii.wtape.loop_scale(s:step(109)()/s:step(110)())
              end
            end
          end
          clock.sync(s:step(111)()/s:step(112)())
          ii.wtape.loop_active(0)
          for i = 1,s:step(113)() do
            clock.sync(s:step(114)()/s:step(115)())
            ii.wtape.seek((s:step(116)()*300)-(s:step(117)()*300))
          end
        end
    end
  end
