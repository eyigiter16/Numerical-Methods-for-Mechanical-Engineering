clc
clear all
close all

pr2 = load('pr2.dat');
t = pr2(:,1); alpha = pr2(:,2); beta = pr2(:,3);
a = 500; 
x = a*tand(beta)./(tand(beta) - tand(alpha));  N=length(x);
y = a*tand(alpha).*tand(beta)./(tand(beta) - tand(alpha));


h = t(2) - t(1);
xp = zeros(1,N);    xpp = zeros(1,N);
xp(1) = (-x(3) + 4*x(2) - 3*x(1)) / (2*h);
xpp(1) = (-x(4)+4*x(3)-5*x(2)+2*x(1)) / (h^2);
xp(N) = -(-x(N-2) + 4*x(N-1) - 3*x(N)) / (2*h);
xpp(N) = (-x(N-3)+4*x(N-2)-5*x(N-1)+2*x(N)) / (h^2);

yp = zeros(1,N);    ypp = zeros(1,N);
yp(1) = (-y(3) + 4*y(2) - 3*y(1)) / (2*h);
ypp(1) = (-y(4)+4*y(3)-5*y(2)+2*y(1)) / (h^2);
yp(N) = -(-y(N-2) + 4*y(N-1) - 3*y(N)) / (2*h);
ypp(N) = (-y(N-3)+4*y(N-2)-5*y(N-1)+2*y(N)) / (h^2);

for i = 2:1:N-1
    xp(i) = (x(i+1) - x(i-1)) / (2*h);  xpp(i) = ( x(i+1)-2*x(i)+x(i-1) ) / (h^2);
    yp(i) = (y(i+1) - y(i-1)) / (2*h);  ypp(i) = ( y(i+1)-2*y(i)+y(i-1) ) / (h^2);
end
vel = sqrt(xp.^2+yp.^2);
acc = sqrt(xpp.^2+ypp.^2);

yp1 = zeros(1,N);     %climb angle dy/dx
yp1(1) = (-y(3) + 4*y(2) - 3*y(1)) / (2*(x(2)-x(1)));
yp1(N) = -(-y(N-2) + 4*y(N-1) - 3*y(N)) / (2*(x(N)-x(N-1)));
for i = 2:1:N-1
    yp1(i) = (y(i+1) - y(i-1)) / (2*(x(i+1)-x(i)));
end

figure(1)
L = 100; %length of the plane
xi = x+L*cos(yp1)'; yi = y+L*sin(yp1)'; %plane
for i=1:1:N
text_plot = ['time = ',num2str(t(i),'%6.4f'),' s  Velocity = ',num2str(vel(i),'%6.4f'),' m/s  Acceleration = ',num2str(acc(i),'%6.4f'),' m/s^2 Climb Angle = ',num2str(yp1(i),'%6.4f'),' degrees'];

plot([x(i) xi(i)],[y(i) yi(i)],'r-', 'linewidth',5);
grid on, xlabel('x'), ylabel('y'), title(text_plot), axis([0 6000 700 1600])
hold on
pause(1)
hold off
end

figure(2)
subplot(4,1,1),plot(x,y, 'm-','linewidth',2), grid on, xlabel('x [m]'), ylabel('y [m]'), axis auto
subplot(4,1,2),plot(t,vel, 'r-','linewidth',2), grid on, xlabel('Time [s]'), ylabel('Velocity [m/s]'), axis auto
subplot(4,1,3),plot(t,acc, 'k-','linewidth',2), grid on, xlabel('Time [s]'), ylabel('Acceleration [m/s^2]'), axis auto
subplot(4,1,4),plot(t,yp1, 'b-','linewidth',2), grid on, xlabel('Time [s]'), ylabel('Climb angle [o])'), axis auto

