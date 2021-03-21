clc
clear all
close all

Lx = 5;
Ly = 4;
h = 0.1;
M = 51;
N = 41;
u = 200*ones(M,N);
u(1,:) = 0;     u(:,1) = 100;   u(:,41) = 50;

c = 56.4*10^(-6);
r = 0.1;
dt = r*h^2/c;

unext = u;
TIME = 0;
while max(max(u))>125
    for i = 2:M-1
        for j = 2:N-1
            unext(i,j) = (1-4*r) * u(i,j) + r*(u(i,j+1)+u(i,j-1)+u(i+1,j)+u(i-1,j));
        end
    end
    u = unext;
    u(51,:) = (-u(49,:) +4*u(50,:) )/3;
    TIME = TIME + dt;
end
u(26,21)
str = ['Time = ',num2str(TIME,'%8.1f'),' seconds'];
uphysical = u';
uphysical = uphysical(end:-1:1,:);
figure(1)
[X,Y]=meshgrid(0:h:Lx,Ly:-h:0);
[p,q]=contourf(X,Y,uphysical,[0:5:125]);
title(str)
grid on, clabel(p,q), colorbar, xlabel('x'), ylabel('y')
