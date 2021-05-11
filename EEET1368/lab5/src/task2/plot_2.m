output_signals = transpose(out.Responses.signals.values(:,3));
time = transpose(out.Responses.time);
r_signals = transpose(out.Responses.signals.values(:,1));

signals1 = output_signals(1:find(time == 300));
signals2 = output_signals(find(time == 600):length(time));

r_signal1 = 35;
r_signal2 = 65;

y_overshoot1 = max(signals1);
y_overshoot2 = max(signals2);

overshoot1 = ((y_overshoot1 - r_signal1)/r_signal1)*100;
overshoot2 = ((y_overshoot2 - r_signal2)/r_signal2)*100;

fprintf("reference 1 = %f, y_overshoot1 = %f\n", r_signal1, y_overshoot1);
fprintf("reference 2 = %f, y_overshoot2 = %f\n", r_signal2, y_overshoot2);
fprintf("overshoot 1 = %f percent, overshoot 2 = %f percent \n",...
    overshoot1, overshoot2);
figure;
plot(time,output_signals, 'LineWidth', 2);
grid on;