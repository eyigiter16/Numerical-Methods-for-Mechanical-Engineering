clc
clear all
close all

Lx = 4;
Ly = 2;
h = 0.1;
M = 41;
N = 21;
u = zeros(M,N);
u(:,1) = 100;
for i = 2:21
    for j = 2:N-(22-i)
        u(i,j) = 200;
    end
end
for i = 22:M-1
    for j = 2:N-(i-20)
        u(i,j) = 200;
    end
end

c = 56.4*10^(-6);
r = 0.1;
dt = r*h^2/c;

unext = u;
TIME = 0;
while max(max(u))>125
    for i = 2:21
        for j = 2:N-(22-i)
            unext(i,j) = (1-4*r) * u(i,j) + r*(u(i,j+1)+u(i,j-1)+u(i+1,j)+u(i-1,j));
        end
    end
    for i = 22:M-1
        for j = 2:N-(i-20)
            unext(i,j) = (1-4*r) * u(i,j) + r*(u(i,j+1)+u(i,j-1)+u(i+1,j)+u(i-1,j));
        end
    end
    u = unext;
    TIME = TIME + dt;
end
figure(1)
plot((1:21),u(21,:)); grid on; xlabel('y'), ylabel('u(2,y)')
u(21,11)
str = ['Time = ',num2str(TIME,'%8.1f'),' seconds'];
uphysical = u';
uphysical = uphysical(end:-1:1,:);
figure(2)
[X,Y]=meshgrid(0:h:Lx,Ly:-h:0);
[p,q]=contourf(X,Y,uphysical,[0:5:125]);
title(str)
grid on, clabel(p,q), colorbar, xlabel('x'), ylabel('y')