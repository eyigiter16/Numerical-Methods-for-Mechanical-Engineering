clc;
clear all;
close all;
disp('Problem 2:');

i = [0,0.09,0.099,0.0999];
x = 3.9 + i;
y = sqrt(4-x).*sin(4-x)./((16-4*x).^(3/2));

fprintf('Y converges to %.4f as X gets closer to 4.\n',y(4));

for j = 1:4
    fprintf('Y= %.8f for X = %.4f\n',y(j),x(j));
end
