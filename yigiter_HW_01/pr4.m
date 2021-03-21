clc;
clear all;
close all;
disp('Problem 4:');

sum = 0;
i=0;
while(sum<25000)
    i = i + 1;
    f = (i^2+4*i+1)/(i+1);
    sum = sum + f;
end
N = i;
if (sum>25000)
    N = N - 1;
end

fprintf('Maximum value of N = %d\n',N);