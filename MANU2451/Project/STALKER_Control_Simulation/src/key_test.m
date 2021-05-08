

clear
clc
close all

fprintf('\nDo you want to start the simulation? Press Enter to process or Escape to cancel\n') ;
val = getkey;
key = val ;
start = 0;
isPressed = 0;
if(val == 13)
    start = 1;
    val = 0;
    fprintf("Simulation has started\n");
end
keypress = 0;

UP = 82;
DOWN = 81; 
RIGHT = 79;
LEFT = 80;
while start
    [keyIsDown, secs, keyCode, deltaSecs] = KbCheck(-1);
    keyIndex = find(keyCode==1);
    if(keyIndex == 41) 
        start = 0;
    end

    
    fprintf("is down = %d, keyCode = %d\n", keyIsDown, find(keyCode==1));
    
end
