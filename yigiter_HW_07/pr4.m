clc
clear all
close all

Lx = 5.0;
Ly = 4.0;
h = 0.1;
M = 51;
N = 41;
u = 200*ones(M,N);
u(:,1) = 100;   u(1:11,41) = 20;    u(11:41,31) = 20;   u(41:51,41) = 20;
u(1,:) = 100;   u(11,31:41) = 20;   u(41,31:41) = 20;   u(51,:) = 100;
u(12:40,32:41) = 0;

c = 56.4*10^(-6);
r = 0.1;
dt = r*h^2/c;

unext = u;
TIME = 0;
while max(max(u))>125
    for i = 2:10
        for j = 2:N-1
            unext(i,j) = (1-4*r) * u(i,j) + r*(u(i,j+1)+u(i,j-1)+u(i+1,j)+u(i-1,j));
        end
    end
    for i = 11:41
        for j = 2:30
            unext(i,j) = (1-4*r) * u(i,j) + r*(u(i,j+1)+u(i,j-1)+u(i+1,j)+u(i-1,j));
        end
    end
    for i = 42:50
        for j = 2:N-1
            unext(i,j) = (1-4*r) * u(i,j) + r*(u(i,j+1)+u(i,j-1)+u(i+1,j)+u(i-1,j));
        end
    end
    u = unext;
    TIME = TIME + dt;
end
figure(1)
plot((1:51),u(:,2)); grid on; xlabel('x'), ylabel('u(x,2)')
u(26,21)
str = ['Time = ',num2str(TIME,'%8.1f'),' seconds'];
uphysical = u';
uphysical = uphysical(end:-1:1,:);
figure(2)
[X,Y]=meshgrid(0:h:Lx,Ly:-h:0);
[p,q]=contourf(X,Y,uphysical,[0:5:125]);
title(str)
grid on, clabel(p,q), colorbar, xlabel('x'), ylabel('y')
