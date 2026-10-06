figure(1)
plot(Ia.time,Ia.signals.values,'k');
grid on
xlabel('Times(s)');
ylabel('A相电流（A）');

figure(2)
plot(Ic.time,Ic.signals.values,'k');
grid on
xlabel('Times(s)');
ylabel('C相电流（A）');