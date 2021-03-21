clc;
clear all;
close all;

c = -5:0.0001:5;
r = [6 3 2 1]';

for i = 1:length(c)
   A = [5 3 2 1;
       -1 c(i) 5 0;
       0 1 4 3;
       4 1 0 2];
   M = A\r;
   detA(i) = det(A);
   if(det(A)<=0.002 && det(A)>=-0.002)
       nonUniq = c(i);
   end
end

fprintf('Except c = %.4f, for all the values of c there are unique solution.\n',nonUniq);
fprintf('For c = %.4f there are infinitely many roots.\n',nonUniq);