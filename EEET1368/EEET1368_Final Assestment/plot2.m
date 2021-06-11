t = ans.tout;
y = ans.Data.signals.values();

plot(t, y);
grid on

[x,y] = ginput(2);
