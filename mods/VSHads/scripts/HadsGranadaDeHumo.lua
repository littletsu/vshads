function onTimerCompleted(tag, loops, loopsLeft) 
    --debugPrint("die")
    if tag == 'hadsgranada' then 
        removeLuaSprite("smoke_grenade")
        addLuaSprite('smoke', true);
        objectPlayAnimation('smoke', 'launch')
    end
end


function onCreate()
    

    makeAnimatedLuaSprite('smoke_grenade', 'smoke_grenade', 0, 300);
    addAnimationByPrefix('smoke_grenade', 'launch', 'Granada de Humo', 48, false)

    makeAnimatedLuaSprite('smoke', 'smoke', -800, 0);
    addAnimationByPrefix('smoke', 'launch', 'Humo', 24, false)
    scaleObject('smoke', 1, 1);
    setObjectOrder('smoke', 10000)
end

function onEvent(name, value1, value2)
    if name == 'Granada de Humo' then 
        --debugPrint("trasnform")
        addLuaSprite('smoke_grenade', true);
        objectPlayAnimation('smoke_grenade', 'launch')
        -- (1000ms/24fps)*59frames
        runTimer("hadsgranada", ((1000/60)*59)/1000)
    end
end