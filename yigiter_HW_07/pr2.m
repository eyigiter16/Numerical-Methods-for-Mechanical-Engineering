clc
clear all
close all

Lx = 4;
Ly = 2;
M = 41;
N = 21;
u = zeros(M,N);
u(:,1) = 100;
for i = 1:21
   u(i,i) = 50;     u(20+i,22-i) = 50; 
end
h = Lx/(M-1);
tol = 0.0001;
err = 1;
while err > tol
    uprev = u;
    for i = 2:21
        for j = 2:N-(22-i)
            u(i,j) = 0.25*(u(i,j-1)+u(i,j+1)+u(i-1,j)+u(i+1,j));
        end
    end
    for i = 22:M-1
        for j = 2:N-(i-20)
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

u(21,11)
