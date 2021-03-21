clc
clear all
close all

dt = 0.0001;
t = 0:dt:10;
L = 0.3;       %%length between yo - y1 and y1 - y2
m1 = 14;
m2 = 380;
k1 = 110;
k2 = 520;
c2 = 500;
y0 = 0.12*sin(4*t);

y1(1) = 0;      %%initial displacement of y1
yp1(1) = 0;     %%initial vel 1

y2(1) = 0;      %%initial displacement of y2
yp2(1) = 0;     %%initial vel 2


for i = 1:length(t)-1
    ypp1 =  ( k1*y0(i) - c2*(yp1(i) - yp2(i))-k2*(y1(i)-y2(i)) - k1*y1(i) )/m1;
    yp1(i+1) = yp1(i) + ypp1*dt;
    y1(i+1) = y1(i) + yp1(i)*dt;
    
    ypp2 = ( c2*(yp1(i) - yp2(i)) + k2*(y1(i) - y2(i)) ) / m2;
    yp2(i+1) = yp2(i) + ypp2*dt;
    y2(i+1) = y2(i) + yp2(i)*dt;
end

figure
plot (t,y1,t,y2); legend('y1','y2'); grid on; xlabel('t [s]'), ylabel('y [m]')

y1 = y1 + L ;
y2 = y2 + 2*L ;

figure
M = max(abs(y2));

n = M*0.04;
m1 = M*0.1;
xcorners1 =[-m1  m1   m1   -m1  -m1];
ycorners1 =[-m1/2  -m1/2  m1/2   m1/2  -m1/2];
m2 = M*0.075;
xcorners2 = [-m2  m2   m2   -m2  -m2];
ycorners2 = [-m2/2  -m2/2  m2/2   m2/2  -m2/2];

for i = 1:100:length(t)
    str = ['Time = ',num2str(t(i),3),'  y0(t) = ',num2str(y0(i),3),'  ChassisY(t) = ',num2str(y2(i),3)];
    X = [0 0 n -n n -n n -n n -n n -n 0 0];
    Y1 = linspace(y0(i),y1(i),14);      Y2= linspace(y1(i),y2(i),14);
    plot(xcorners1,ycorners1+y2(i), xcorners2,ycorners2+y1(i), 0,y0(i),'ro', X,Y1,'b-', 0,y1(i),'mo', X,Y2,'k-', 0,y2(i),'g*', 'linewidth',2)
    grid on, xlabel('x [m]'), ylabel('y [m]'), title(str), axis([-M/3 M/3 -2*M/3 4*M/3])
    pause(0.001)
end