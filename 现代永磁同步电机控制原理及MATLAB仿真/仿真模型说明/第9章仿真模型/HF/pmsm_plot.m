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
plot(Thee.time,Thee.signals.values);
grid on
xlabel('Times(s)');
ylabel('转子估计误差（rad）');


