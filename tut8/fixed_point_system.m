%% Fixed point iteration method
clear all
clc
syms x y;
f(x,y)=input('enter the function f=f(x,y) (x=f(x,y)): ');
g(x,y)=input('enter the function g=g(x,y) (y=g(x,y)): ');
x0= input('Enter the initial approximation ');

fx(x,y)=diff(f,x);  gx(x,y)=diff(g,x); fy(x,y)=diff(f,y);  gy(x,y)=diff(g,y); 
%% checking if valid input condition
normx=double(abs(fx(x0(1),x0(2)))+abs(fy(x0(1),x0(2))));
if normx>1
    fprintf('invalid, wont converge');
    return;
end
normx=double(abs(gx(x0(1),x0(2)))+abs(gy(x0(1),x0(2))));
if normx>1
    fprintf('invalid, wont converge');
    return;
end

%% iteration
err=1;
eps=input('enter tolerance: ');
i=1;
iter(1,1)=0;
funf(1,1)=f(x0(1),x0(2));
fung(1,1)=g(x0(1),x0(2));
ansx(1,1)=x0(1);
ansy(1,1)=x0(2);
while err>eps
    x1(1)=double(f(x0(1),x0(2)));
    x1(2)=double(g(x0(1),x0(2)));
    err= double(norm(x1-x0)/norm(x1));
    i=i+1;
    x0=x1;
    iter(i,1)=i-1;
    funf(i,1)=f(x0(1),x0(2));
    fung(i,1)=g(x0(1),x0(2));
    ansx(i,1)=x0(1);
    ansy(i,1)=x0(2);
end
%% answer
T=table(double(iter),double(ansx),double(ansy),double(funf),double(fung));
T.Properties.VariableNames={'iteration','x','y','f(x,y)','g(x,y)'};
T
fprintf('The solution is\n')
fprintf('x= %d,y=%d\n',x0(1),x0(2));
fprintf('Number of iterations required is %d. \n', i-1)