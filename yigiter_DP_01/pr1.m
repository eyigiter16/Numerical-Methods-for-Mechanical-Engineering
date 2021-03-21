clc
clear all
close all
a=input('Enter a domain for x, as a <= x <= b\nLower domain: '); b=input('Upper domain: ');N = 10001;x = linspace(a,b,N);
y=input('Enter a function, f(x) in that selected x domain: ');
xVals=input('Enter n number of arbitrary x = X values within the selected domain: ');


h = x(2) - x(1);
yp = zeros(1,N);
ypp = zeros(1,N);
yp(1) = (-y(3) + 4*y(2) - 3*y(1)) / (2*h);
ypp(1) = (-y(4)+4*y(3)-5*y(2)+2*y(1)) / (h^2);
yp(N) = -(-y(N-2) + 4*y(N-1) - 3*y(N)) / (2*h);
ypp(N) = (-y(N-3)+4*y(N-2)-5*y(N-1)+2*y(N)) / (h^2);
for i = 2:1:N-1
    yp(i) = (y(i+1) - y(i-1)) / (2*h);
    ypp(i) = ( y(i+1)-2*y(i)+y(i-1) ) / (h^2);
end
% figure(1)
% subplot(4,1,1),plot(x,y, 'm-','linewidth',2), grid on, xlabel('x'), ylabel('f'), axis auto
% subplot(4,1,2),plot(x,yp, 'r-','linewidth',2), grid on, xlabel('x'), ylabel('df/dx'), axis auto
% subplot(4,1,3),plot(x,ypp,'k-','linewidth',2), grid on, xlabel('x'), ylabel('d^2f/dx^2'), axis auto


for i=1:length(xVals)
    t=0:h:2*pi;
    X=xVals(i); j=find(X==x);   Y=y(j);
    R=abs((1+(yp(j))^2)^(3/2)/ypp(j)); %radius
    slope = atan(-1/yp(j));
    if (ypp(j)<0)       %concave
        xC = R*cos(slope)+X;
        yC = R*sin(slope)+Y;
    elseif (ypp(j)>0) %convex
        xC = -R*cos(slope)+X;
        yC = -R*sin(slope)+Y;
    end
    fprintf('At x=%.2f, F=%.2f, xc=%.2f, yx=%.2f, R=%.2f\n',X,Y,xC,yC,R);
    CircleX=R*cos(t)+xC;
    CircleY=R*sin(t)+yC;
%     subplot(4,1,4)
    plot(x,y,'b',X,Y,'b*',CircleX,CircleY,'.r', xC,yC,'g*',[x(j) xC],[Y yC],'m','linewidth',2), axis equal, hold on, grid on
end