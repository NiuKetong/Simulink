clc                             %清屏
clear                           %清除数据
 
syms s kp ki wc w0           %定义字符变量
 
m = s^2+2*wc*s+(w0)^2;       %准PR控制器的分母
 
den = m;
num = kp*m+2*ki*wc*s;         %准PR控制器的分子
 
den = collect(den,s);         %合并同类项
num = collect(num,s);
% 
% num: kp*s^2 + (2*kp*wc + 2*kr*wc)*s + kp*w0^2
% den: s^2 + (2*wc)*s + w0^2
 
kp = 1;
w0 =2*pi*8.5*6;
wc = 5;
ki = 150;
 
num = [kp,(2*kp*wc + 2*ki*wc), kp*w0^2];
den = [1,(2*wc),w0^2];
G = tf(num,den);
bode (G)                 %画波特图
grid on
