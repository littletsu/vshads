function onTimerCompleted(tag, loops, loopsLeft) 
    --debugPrint("die")
    if tag == 'hadsdie' then 
        triggerEvent("Play Animation", "dead", "dad")
    end
end



function onEvent(name, value1, value2)
    if name == 'Matar Hads' then 
        --debugPrint("trasnform")
        runTimer("hadsdie", ((1000/24)*44)/1000)
        triggerEvent("Play Animation", "dies", "dad")
        -- (1000ms/24fps)*44frames
        
    end
end