% solving a system of non-linear equation by Fixed point method
%%input
clc
clear
syms x y
f(x,y) = input('enter the function f=f(x,y):   ');
g(x,y) = input('enter the function g=g(x,y):   ');
x0= input('Enter the initial approximation    ');
%% differentiation
fx(x,y)=diff(f,x);  gx(x,y)=diff(g,x);  
fy(x,y)=diff(f,y);  gy(x,y)=diff(g,y);  
f=inline(f,'x','y');

g=inline(g,'x','y');
fx=inline(fx,'x','y');
fy=inline(fy,'x','y');
gx=inline(gx,'x','y');
gy=inline(gy,'x','y');

norm1 = double(abs(fx(x0(1),x0(2))) + abs(fy(x0(1),x0(2))));
norm2 = double(abs(gx(x0(1),x0(2))) + abs(gy(x0(1),x0(2))));

if norm1 > 1 || norm2 > 1 
 disp('Iterations will not be converged')
    return;
end

%% iteration
err=1; %error in each iterartion
tolerance=input('Allowed tolerance :   ');
i=1; %to count no. of iteration
iter(1,1)=0;
fun_f(1,1)=f(x0(1),x0(2));
fun_g(1,1)=g(x0(1),x0(2));
ans_x(1,1)=x0(1);
ans_y(1,1)=x0(2);
while err > tolerance
    
    x1=[f(x0(1),x0(2));  g(x0(1),x0(2))];
    err=norm(x1-x0);
    i=i+1;
    x0=x1;
    
    iter(i,1)=i-1;
    fun_f(i,1)=f(x0(1),x0(2));
    fun_g(i,1)=g(x0(1),x0(2));
    ans_x(i,1)=x0(1);
    ans_y(i,1)=x0(2);
    
end
%% output
T=table(double(iter),double(ans_x),double(ans_y),double(fun_f),double(fun_g));
T.Properties.VariableNames={'iteration','x','y','f(x,y)','g(x,y)'};
T
fprintf('The solution is\n')
fprintf('x= %d,y=%d\n',x0(1),x0(2));
fprintf('Number of iterations required is %d. \n', i-1)
