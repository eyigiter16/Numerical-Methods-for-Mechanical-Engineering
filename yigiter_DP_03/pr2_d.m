clc
clear all
close all

dt = 0.0001;
t = 0:dt:10;
m = 1;
k = 12;
L0 = 1;
g = 9.81;

x(1) = 0;
xp(1) = 0;

y(1) = -1.8175;
yp(1) = 0;


for i = 1:length(t)-1
    xpp = ( -k*(sqrt((x(i))^2 + (y(i))^2) - L0)*(x(i) / sqrt((x(i))^2 + (y(i))^2)) ) / m;
    xp(i+1)= xp(i) + xpp*dt;
    x(i+1)= x(i) + xp(i)*dt;
    
    ypp = ( -m*g - k*(sqrt((x(i))^2 + (y(i))^2) - L0)*y(i) / sqrt((x(i))^2 + (y(i))^2) ) / m;
    yp(i+1) = yp(i) + ypp*dt;
    y(i+1) = y(i) + yp(i)*dt;
end

figure
M = max(abs(y));
n = 0.5*M;
plot(t,x,t,y);legend('X','Y');
grid on;

figure
for i = 1:100:length(t)
    str = ['Time = ',num2str(t(i),3),'  y(t) = ',num2str(y(i),4)];
    X = [0 x(i)];
    Y = [0 y(i)];
    
    plot( X,Y,'k-', x(i),y(i),'ro', 'linewidth',2)
    grid on, title(str), xlabel('x, [m]'), ylabel('y [m]'), axis([-2*n 2*n -3*n n])
    pause(0.001)
end
