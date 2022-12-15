local hadsNotes = {}
local strumTimes = {}

function onCreate()
    --Iterate over all notes
    for i = 0, getProperty('unspawnNotes.length')-1 do
            --Check if the note is an Hads Note
            if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Hads Note' then
                    setPropertyFromGroup('unspawnNotes', i, 'texture', 'HADSNOTE_assets'); --Change texture
                    setPropertyFromGroup('unspawnNotes', i, 'hitHealth', '0'); --Default value is: 0.023, health gained on hit
                    setPropertyFromGroup('unspawnNotes', i, 'missHealth', '0.5'); --Default value is: 0.0475, health lost on miss
                    setPropertyFromGroup('unspawnNotes', i, 'hitCausesMiss', true);
                    table.insert(hadsNotes, getPropertyFromGroup('unspawnNotes', i, 'noteData'))
                    table.insert(strumTimes, getPropertyFromGroup('unspawnNotes', i, 'strumTime'))
                    if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
                            setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true); --Miss has no penalties
                    end
            end
    end
    --debugPrint('Script started!')
end

local NOTE_DIRECTION = {
    [0] = "LEFT",
    [1] = "DOWN",
    [2] = "UP",
    [3] = "RIGHT"
}

function onStepHit()
    --debugPrint("Step")
    for k,v in pairs(strumTimes) do 
        local notePos = (v - getPropertyFromClass("Conductor", "songPosition"))
        if notePos <= 0 and (notePos > -200) then 
            --debugPrint(notePos)
            triggerEvent("Change Character", 1, "hadsdrunfel-transformation")
            
            characterPlayAnim("dad", "sing" .. NOTE_DIRECTION[hadsNotes[k]])
        end
        -- if notePos <= -200 and notePos >= -300  then 
        --     --triggerEvent("Change Character", 1, "hadsdrunfel-afraid")
        -- end
    end
end
