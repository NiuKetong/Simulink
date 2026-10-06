figure(1)
plot(V.time,V.signals.values,'k');
grid on
xlabel('Times(s)');
ylabel('参考电压的幅值（V）');

figure(2)
plot(Va.time,Va.signals.values,'k');
grid on
xlabel('Times(s)');
ylabel('相电压Va（V）');

figure(3)
plot(Vb.time,Vb.signals.values,'k');
grid on
xlabel('Times(s)');
ylabel('相电压Vb（V）');

figure(4)
plot(Vc.time,Vc.signals.values,'k');
grid on
xlabel('Times(s)');
ylabel('相电压Vc（V）');