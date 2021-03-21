clc;
clear all;
close all;
disp('Problem 9:');
disp('The center of the tangent circle to the rectangle needs to be between x = (2,7) and y = (2,4).');
x = input('Enter the X coordinate: ');
y = input('Enter the Y coordinate: ');
a = true;


while(a==true)
    if(x<=2 || x>=7 || y<=2 || y>=4)
        disp('The center of the tangent circle cannot be on nor outside of the rectangle. Please enter again,');
        x = input('X coordinate: ');
        y = input('Y coordinate: ');
    else
        a=false;
    end
end
d=min([abs(x-2) abs(x-7) abs(y-2) abs(y-4)]);
N = 1001;
t = linspace(0,2*pi,N);
Cx=x+d*cos(t);
Cy=y+d*sin(t);

figure(9)
plot([2 7],[2 2],'k-',[2 7],[4 4],'k-',[2 2],[2 4],'k-',[7 7],[2 4],'k-',Cx,Cy,'r-','linewidth',2);
grid on;
xlabel('X');
ylabel('Y');
axis equal;
axis([1 8 1 5]);