--- krahenLied.
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
  function jfscaling (j)
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
    ii.wtape.play(1)
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
        output[2].action = { to(5,dyn{attack=1}/20), to(0,dyn{release=1}/20) }
        output[2].dyn.attack = s:step(4)()
        output[2].dyn.release = s:step(5)()
        output[1].slew = s:step(6)()/300
        output[2]()
    end
  end
  function other_event()
    while true do
        clock.sync(s:step(7)()/s:step(8)())
        output[3].volts = s:step(9)()/12
        output[4].action = { to(5,dyn{attack=1}/20), to(0,dyn{release=1}/20) }
        output[4].dyn.attack = s:step(10)()
        output[4].dyn.release = s:step(11)()
        output[3].slew = s:step(12)()/300
        output[4]()
    end
  end
  function jfa_event()
    while true do
        clock.sync(s:step(13)()/s:step(14)())
        ii.jf.play_voice(1, s:step(15)()/12, j:step(16)())
    end
  end
  function jfb_event()
    while true do
        clock.sync(s:step(17)()/s:step(18)())
        ii.jf.play_voice(2, s:step(19)()/12, j:step(20)())
    end  
  end
  function jfc_event()
    while true do
        clock.sync(s:step(21)()/s:step(22)())
        ii.jf.play_voice(3, s:step(23)()/12, j:step(24)())
    end
  end
  function jfd_event()
    while true do
        clock.sync(s:step(25)()/s:step(26)())
        ii.jf.play_voice(4, s:step(27)()/12, j:step(28)())
    end
  end
  function jfe_event()
    while true do
        clock.sync(s:step(29)()/s:step(30)())
        ii.jf.play_voice(5, s:step(31)()/12, j:step(32)())
    end
  end
  function jff_event()
    while true do
        clock.sync(s:step(33)()/s:step(34)())
        ii.jf.play_voice(6, s:step(35)()/12, j:step(36)())
    end
  end
  function run_event()
    while true do
        clock.sync(s:step(37)()/s:step(38)())
        ii.jf.run(j:step(39)())
    end
  end
  function quantize_event()
    while true do
        clock.sync(s:step(40)()/s:step(41)())
        ii.jf.quantize(s:step(42)())
    end
  end
  function with_event()
    while true do
        clock.sync(s:step(43)()/s:step(44)())
        ii.wtape.speed(s:step(45)(), s:step(46)())
    end
  end
  function rev_event()
    while true do
        clock.sync(s:step(47)()/s:step(48)())
        ii.wtape.reverse()
    end
  end
  function looper()
    while true do
        clock.sync(s:step(49)()/s:step(50)())
        ii.wtape.loop_start()
        clock.sync(s:step(51)()/s:step(52)())
        ii.wtape.loop_end()
        if s:step(53)() < 17 then
          for i = 1,j:step(54)() do 
            clock.sync(s:step(55)()/s:step(56)())
            ii.wtape.loop_scale(s:step(57)()/s:step(58)())
            for i = 1,j:step(59)() do
              clock.sync(s:step(60)()/s:step(61)())
              ii.wtape.loop_next(j:step(62)()-j:step(63)())
            end 
          end
        elseif s:step(53)() >= 17 then
          for i = 1,j:step(64)() do
            clock.sync(s:step(65)()/s:step(66)())
            ii.wtape.loop_next(j:step(67)()-j:step(68)())
            for i = 1,j:step(69)() do
              clock.sync(s:step(70)()/s:step(71)())
              ii.wtape.loop_scale(s:step(72)()/s:step(73)())
            end
          end
        end
        clock.sync(s:step(74)()/s:step(75)())
        ii.wtape.loop_active(0)
        for i = 1,j:step(76)() do
          clock.sync(s:step(77)()/s:step(78)())
          ii.wtape.seek((s:step(79)()*300)-(s:step(80)()*300))
        end
        for i = 1,j:step(81)() do
          clock.sync(s:step(82)()/s:step(83)())
          ii.wtape.loop_active(1)
          if s:step(84)() < 17 then
            for i = 1,j:step(85)() do 
              clock.sync(s:step(86)()/s:step(87)())
              ii.wtape.loop_scale(s:step(88)()/s:step(89)())
              for i = 1,j:step(90)() do
                clock.sync(s:step(91)()/s:step(92)())
                ii.wtape.loop_next(j:step(93)()-j:step(94)())
              end 
            end
          elseif s:step(84)() >= 17 then
            for i = 1,j:step(95)() do
              clock.sync(s:step(96)()/s:step(97)())
              ii.wtape.loop_next(s:step(98)()-s:step(99)())
              for i = 1,j:step(100)() do
                clock.sync(s:step(101)()/s:step(102)())
                ii.wtape.loop_scale(s:step(103)()/s:step(104)())
              end
            end
          end
          clock.sync(s:step(105)()/s:step(106)())
          ii.wtape.loop_active(0)
          for i = 1,j:step(107)() do
            clock.sync(s:step(108)()/s:step(109)())
            ii.wtape.seek((s:step(110)()*300)-(s:step(111)()*300))
          end
        end
    end
  end
