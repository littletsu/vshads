local videoCountdown = false
local allowCountdown = false
function onStartCountdown()
        if not videoCountdown and isStoryMode and not seenCutscene then --Block the first countdown
                startVideo('Cinematic');
                videoCountdown = true;
                return Function_Stop;
        end
        if videoCountdown and not allowCountdown and isStoryMode and not seenCutscene then
                setProperty('inCutscene', true);
                runTimer('startDialogue', 0.1);
                allowCountdown = true;
                return Function_Stop;
        end
        if videoCountdown and allowCountdown then
                return Function_Continue
        end
end

function onTimerCompleted(tag, loops, loopsLeft)
        if tag == 'startDialogue' then -- Timer completed, play dialogue
                startDialogue('dialogue');
        end
end

-- Dialogue (When a dialogue is finished, it calls startCountdown again)
function onNextDialogue(count)
        -- triggered when the next dialogue line starts, 'line' starts with 1
end

function onSkipDialogue(count)
        -- triggered when you press Enter and skip a dialogue line that was still being typed, dialogue line starts with 1
end