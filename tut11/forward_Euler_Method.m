%solving a IVP of a ODE by forward Euler method
clc
clear all
syms x y ;
str = input('enter the function f=f(x,y):   '); %dy/dx=f(x,y)
f=inline(str,'x','y');
%IVP conditions
x0=input('Enter the initial point') ;
y0=input('Enter the value given at initial point');

h=input('Enter the value of h - ');%step length
t=input('Enter the point at which value need to be calculated - ');
x(1)=x0;
y(1)=y0;
i=1;
while x(i) <t
    
    i=i+1;
    x(i)=x(i-1)+h;
    y(i)=y(i-1)+h*f(x(i-1),y(i-1));
    
end

fprintf('The value of y at point m is %f',y(i))
% tspan = [0 5];
% y0 = 0;
% [x,y] = ode45(@(x,y) str, tspan, y0);