function onCreate()
    makeLuaSprite('stageback', 'unturnedpoliceback', 0, 0);
    setLuaSpriteScrollFactor('stageback', 0.9, 0.9);
    scaleObject('stageback', 1.3, 1.3);

    makeLuaSprite('stagefront', 'unturnedfront', -250, 800);
    setLuaSpriteScrollFactor('stagefront', 0.9, 0.9);
    scaleObject('stagefront', 1.3, 1.3);

    makeAnimatedLuaSprite('police', 'Polices_Mans', -230, -50);
    addAnimationByPrefix('police', 'idle', 'Polis')
    scaleObject('police', 1.5, 1.5);
    objectPlayAnimation('police', 'idle')

    addLuaSprite('stageback', false);
    addLuaSprite('stagefront', false);
    addLuaSprite('police', false);
    close(true);
end