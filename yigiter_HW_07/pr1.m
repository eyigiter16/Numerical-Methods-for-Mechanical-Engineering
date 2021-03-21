clc
clear all
close all

Lx = 5;
Ly = 4;
M = 51;
N = 41;
u = zeros(M,N);
u(:,1) = 100;   u(1:11,41) = 20;    u(11:41,31) = 20;   u(41:51,41) = 20;
u(1,:) = 100;   u(11,31:41) = 20;   u(41,31:41) = 20;   u(51,:) = 100;

h = Lx/(M-1);
tol = 0.0001;
err = 1;
while err > tol
    uprev = u;
    for i = 2:10
        for j = 2:N-1
            u(i,j) = 0.25*(u(i,j-1)+u(i,j+1)+u(i-1,j)+u(i+1,j));
        end
    end
    for i = 11:41
        for j = 2:30
            u(i,j) = 0.25*(u(i,j-1)+u(i,j+1)+u(i-1,j)+u(i+1,j));
        end
    end
    for i = 42:50
        for j = 2:N-1
            u(i,j) = 0.25*(u(i,j-1)+u(i,j+1)+u(i-1,j)+u(i+1,j));
        end
    end
    err = norm(u-uprev);
    uprev = u;
end
u;
Uphysical = u';
Uphysical = Uphysical(end:-1:1,:);
figure(1)
[X,Y] = meshgrid(0:h:Lx,Ly:-h:0);
[p,q] = contourf(X,Y,Uphysical,[0:5:100]);
grid on, clabel(p,q), colorbar, xlabel('x'), ylabel('y')

u(26,21)
