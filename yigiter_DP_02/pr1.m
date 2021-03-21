clear all, close all, clc

r = 0.085;
L = 0.210;
Mpiston = 0.240;

thetadot = 2000*0.10472; %% angular speed (rad/s)
period = 2*pi/thetadot; %% time to take for a cycle of driving arm
n = 360; %% number of intervals in a cycle
cycle = 2; %% number of cycles to animate
N = cycle*n+1;
t = linspace(0,cycle*period,N); % t = time
Ax = 0;
Ay = 0;
Cy = 0;

theta0 = pi/3;
THETA = thetadot*t + theta0;
THETA = mod(THETA,2*pi);

for i = 1:1:N
bx = r*cos(THETA(i));
by = r*sin(THETA(i));
cx = sqrt(L^2-by^2)+bx;
CX(i) = cx;
end

AX = zeros(size(t));
AY = zeros(size(t));
BX = r*cos(THETA);
BY = r*sin(THETA);
CX = CX;
CY = zeros(size(t));

h = t(2) - t(1);
Vel = zeros(1,N);
Acc = zeros(1,N);
Vel(1) = (-CX(3) + 4*CX(2) - 3*CX(1)) / (2*h);
Acc(1) = (-CX(4)+4*CX(3)-5*CX(2)+2*CX(1)) / (h^2);
Vel(N) = -(-CX(N-2) + 4*CX(N-1) - 3*CX(N)) / (2*h);
Acc(N) = (-CX(N-3)+4*CX(N-2)-5*CX(N-1)+2*CX(N)) / (h^2);
for i = 2:1:N-1
    Vel(i) = (CX(i+1) - CX(i-1)) / (2*h);
    Acc(i) = ( CX(i+1)-2*CX(i)+CX(i-1) ) / (h^2);
end
force = Acc*Mpiston;
power = abs(force.*Vel);

figure(1)
ratio = 228/127;
xc = -0.2;
yc = -0.2;
H = 0.8;
pause(1)
for i=1:3:N
text_plot = ['time = ',num2str(t(i),'%6.4f'),' s  Velocity = ',num2str(Vel(i),'%6.4f'),' m/s  Acceleration = ',num2str(Acc(i),'%6.4f'),' m/s^2 Force = ',num2str(force(i),'%6.4f'),' kg*m/s^2  Power = ',num2str(power(i),'%6.4f'),' kg*m^2/s^3'];
plot([AX(i) BX(i)],[AY(i) BY(i)],'r-', [BX(i) CX(i)],[BY(i) CY(i)],'g-', BX(i),BY(i),'mo', CX(i),CY(i),'ko', 'linewidth',2);
grid on, xlabel('x'), ylabel('y'), title(text_plot), axis([-0.1 0.4 -0.15 0.15])
hold on
plot(CX,CY,'k--')
pause(0.02)
hold off
end

figure(2)
plot(t,CX,'b-','linewidth',2), grid on, xlabel('Time [s]'), ylabel('Cx [m]')


figure(3)
plot(t,Vel,'r-','linewidth',2), grid on, xlabel('Time [s]'), ylabel('Velocity [m/s](dx/dt)')
figure(4) 
plot(t,Acc, 'c-','linewidth',2), grid on, xlabel('Time [s]'), ylabel('Acceleration [m/s^2] (dx^2/dt^2)')
figure(5) 
plot(t,force, 'g-','linewidth',2), grid on, xlabel('Time [s]'), ylabel('Force [kg*m/s^2] (Mpiston*dx^2/dt^2)')
figure(6) 
plot(t,power, 'm-','linewidth',2), grid on, xlabel('Time [s]'), ylabel('Power [kg*m^2/s^3] (|Mpiston*(dx^2/dt^2)*(dx/dt)|)')
