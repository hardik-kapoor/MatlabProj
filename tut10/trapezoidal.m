%calculating integration by composite trapezoidal rule
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
for i=1:n-1
    
        sum= sum+ (f(x(i)) + f(x(i+1)))*(h/2);%updating the sum by each sub_interval trapezoidal approximation
    
end

val=int(str,a,b);
sum

fprintf("True answer is %d\n",val)
