%calculating integration by composite simpson rule
clc 
clear all
syms x;
format long
str = input('enter the function f=f(x):   ');
f=inline(str,'x');
a=input('enter the lower limit of the integral  ');
b=input('enter the upper limit of the integral  ');
h=input('enter the value of h ');
x=[a:h:b];
sum=0;
n=length(x);
i=1;
while i<=n-2
        sum= sum+ (f(x(i)) + 4*f(x(i+1)) + f(x(i+2)))*(h/3); %updating the sum by each sub_interval simpson approximation
        i=i+2;
end

val=int(str,a,b);
sum

fprintf("True answer is %d\n",val)
