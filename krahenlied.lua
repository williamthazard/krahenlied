--- krahenLied.
  text_string = "aaaaaa"
  function remap(ascii)
      local offset
      if ascii <= 32 then offset = 0
      elseif ascii > 32 and ascii <= 64 then offset = -32
      elseif ascii > 64 and ascii <= 96 then offset = -64
      elseif ascii > 96 and ascii <= 128 then offset = -96
      elseif ascii > 128 and ascii <= 160 then offset = -128
      elseif ascii > 160 and ascii <= 192 then offset = -160
      elseif ascii > 192 and ascii <= 224 then offset = -192
      elseif ascii > 224 and ascii <= 255 then offset = -224
      end
    return ascii + offset
  end
  function processString(s)
    local tempScalar = {}
    for i = 1, #s do
      table.insert(tempScalar,remap(s:byte(i)))
    end
    return tempScalar
  end
  function jfmap(ascii)
    local map
    if ascii <= 51 then map = 1
    elseif ascii > 51 and ascii <= 102 then map  = 2
    elseif ascii > 102 and ascii <= 153 then map = 3
    elseif ascii > 153 and ascii <= 204 then map = 4
    elseif ascii > 204 and ascii <= 255 then map = 5
    end
    return map
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
              clock.run(loop_scaler)
              clock.run(loop_jumper)
              clock.run(tape_seeker)
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
  end
  function notes_event()
    while true do
        local notes_pitch = s()/12
        local notes_time = s:step(2)()/s:step(3)()
        local slew = s:step(4)()/300
        local notes_slope = { to(5,dyn{attack=1}/20), to(0,dyn{release=1}/20) }
        clock.sync(notes_time)
        output[1].volts = notes_pitch
        output[2].action = notes_slope
        output[2].dyn.attack = s:step(5)()
        output[2].dyn.release = s:step(6)()
        output[1].slew = slew
        output[2]()
    end
  end
  function other_event()
    while true do
        local other_pitch = s:step(7)()/12
        local other_time = s:step(8)()/s:step(9)()
        local slew = s:step(10)()/300
        local other_slope = { to(5,dyn{attack=1}/20), to(0,dyn{release=1}/20) }
        clock.sync(other_time)
        output[3].volts = other_pitch
        output[4].action = other_slope
        output[4].dyn.attack = s:step(11)()
        output[4].dyn.release = s:step(12)()
        output[3].slew = slew
        output[4]()
    end
  end
  function jfa_event()
    while true do
        local jfa_pitch = s:step(13)()/12
        local jfa_time = s:step(14)()/s:step(15)()
        local level = j:step(16)()
        clock.sync(jfa_time)
        ii.jf.play_voice(1, jfa_pitch, level)
    end
  end
  function jfb_event()
    while true do
        local jfb_pitch = s:step(17)()/12
        local jfb_time = s:step(18)()/s:step(19)()
        local level = j:step(20)()
        clock.sync(jfb_time)
        ii.jf.play_voice(2, jfb_pitch, level)
    end  
  end
  function jfc_event()
    while true do
        local jfc_pitch = s:step(21)()/12
        local jfc_time = s:step(22)()/s:step(23)()
        local level = j:step(24)()
        clock.sync(jfc_time)
        ii.jf.play_voice(3, jfc_pitch, level)
    end
  end
  function jfd_event()
    while true do
        local jfd_pitch = s:step(25)()/12
        local jfd_time = s:step(26)()/s:step(27)()
        local level = j:step(28)()
        clock.sync(jfd_time)
        ii.jf.play_voice(4, jfd_pitch, level)
    end
  end
  function jfe_event()
    while true do
        local jfe_pitch = s:step(29)()/12
        local jfe_time = s:step(30)()/s:step(31)()
        local level = j:step(32)()
        clock.sync(jfe_time)
        ii.jf.play_voice(5, jfe_pitch, level)
    end
  end
  function jff_event()
    while true do
        local jff_pitch = s:step(33)()/12
        local jff_time = s:step(34)()/s:step(35)()
        local level = j:step(36)()
        clock.sync(jff_time)
        ii.jf.play_voice(6, jff_pitch, level)
    end
  end
  function run_event()
    while true do
        local runvolts = j:step(37)()
        local runtime = s:step(38)()/s:step(39)()
        clock.sync(runtime)
        ii.jf.run(runvolts)
    end
  end
  function quantize_event()
    while true do
        local quant = s:step(40)()
        local quantsync = s:step(41)()/s:step(42)()
        clock.sync(quantsync)
        ii.jf.quantize(quant)
    end
  end
  function with_event()
    while true do
        local with_time = s:step(43)()/s:step(44)()
        local speed_num = s:step(45)()
        local speed_denom = s:step(46)()
        clock.sync(with_time)
        ii.wtape.speed(speed_num, speed_denom)
    end
  end
  function rev_event()
    while true do
        local rev_time = s:step(47)()/s:step(48)()
        clock.sync(rev_time)
        ii.wtape.reverse()
    end
  end
  function looper()
    while true do
        local loop_starter_time = s:step(49)()/s:step(50)()
        local sleep_time = s:step(51)()
        local activator_time = s:step(52)()
        local deactivator_time = s:step(53)()
        ii.wtape.loop_start()
        clock.sleep(sleep_time)
        ii.wtape.loop_end()
        clock.sleep(activator_time)
        ii.wtape.loop_active(1)
        clock.sleep(deactivator_time)
        ii.wtape.loop_active(0)
        clock.sync(loop_starter_time)
    end
  end
  function loop_scaler()
    while true do
        local loop_scaler_time = s:step(54)()/s:step(55)()
        local scale = s:step(56)()/s:step(57)()
        clock.sync(loop_scaler_time)
        ii.wtape.loop_scale(scale)
    end
  end
  function loop_jumper()
    while true do
        local loop_jumper_time = s:step(58)()/s:step(59)()
        clock.sync(loop_jumper_time)
        ii.wtape.loop_next()
    end
  end
  function tape_seeker()
    while true do
        local seeker_time = s:step(60)()/s:step(61)()
        local seek_time = s:step(62)()*300
        local alternate_time = s:step(63)()*300
        local big_time = seek_time-alternate_time
        clock.sync(seeker_time)
        ii.wtape.seek(big_time)
    end
  end
