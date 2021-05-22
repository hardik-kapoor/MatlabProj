%% Fixed point iteration to approximate the solution to the equation x=f(x)
%%
clc
clear
str = input('Give an equation in x: ','s')  ;
f = inline(str,'x') ;
eps=input('Allowed tolerance :   ');
x0= input('Enter the initial approximation:   ');
err=1;
i=1;
while err > eps
    x1=f(x0);
    err= abs(x1-x0);
    a1(i,1)=x0;   
    b1(i,1)=x1;   
    iter(i,1)=i; 
    error(i,1)=err;	
    i=i+1;
    x0=x1;
end
fprintf('The fixed point is %f \n', x1)
fprintf('Number of iterations required is %d. \n', i-1)
T =  table(iter,a1,b1,error)
