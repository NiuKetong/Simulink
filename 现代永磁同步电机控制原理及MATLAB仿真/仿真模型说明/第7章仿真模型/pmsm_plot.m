figure(1)
plot(Nr.time,Nr.signals.values,'k');
grid on
xlabel('Times(s)');
ylabel('电机转速（r/min）');

figure(2)
plot(Nre.time,Nre.signals.values,'k');
grid on
xlabel('Times(s)');
ylabel('电机转速估计误差（r/min）');

figure(3)
plot(Te.time,Te.signals.values,'k');
grid on
xlabel('Times(s)');
ylabel('电磁转矩（N.m）');

figure(4)
plot(Iabc.time,Iabc.signals.values);
grid on
xlabel('Times(s)');
ylabel('三相电流Iabc（A）');

figure(5)
plot(The.time,The.signals.values);
grid on
xlabel('Times(s)');
ylabel('转子位置（rad）');