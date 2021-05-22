%% solving Non linear equations using N-R
clear all
%% inputs
syms x y;
f(x,y)=input('enter the function f=f(x,y): ');
g(x,y)=input('enter the function g=g(x,y): ');
x0= input('Enter the initial approximation ');

fx(x,y)=diff(f,x);  gx(x,y)=diff(g,x); fy(x,y)=diff(f,y);  gy(x,y)=diff(g,y);  
%% iterative step

err=1;
eps=input('enter tolerance: ');
i=1;
iter(1,1)=0;
funf(1,1)=f(x0(1),x0(2));
fung(1,1)=g(x0(1),x0(2));
ansx(1,1)=x0(1);
ansy(1,1)=x0(2);
while err>eps
    F=[f(x0(1),x0(2));g(x0(1),x0(2))];
    J=[fx(x0(1),x0(2)) fy(x0(1),x0(2)); gx(x0(1),x0(2)) gy(x0(1),x0(2))];
    x1= x0-J\F;
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