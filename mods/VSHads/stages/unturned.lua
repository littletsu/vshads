function onCreate()
    makeLuaSprite('stageback', 'unturnedback', 0, 0);
    setLuaSpriteScrollFactor('stageback', 0.9, 0.9);
    scaleObject('stageback', 1.3, 1.3);

    makeLuaSprite('stagefront', 'unturnedfront', -250, 800);
    setLuaSpriteScrollFactor('stagefront', 0.9, 0.9);
    scaleObject('stagefront', 1.3, 1.3);


    addLuaSprite('stageback', false);
    addLuaSprite('stagefront', false);

    close(true);
end