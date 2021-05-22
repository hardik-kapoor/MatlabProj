% solving a system of non-linear equation by Newton_Rapshon method
%%input
clc
clear
syms x y
f(x,y) = input('enter the function f=f(x,y):   ');
g(x,y) = input('enter the function g=g(x,y):   ');
x0= input('Enter the initial approximation    ');
%% derivatives
fx(x,y)=diff(f,x);  gx(x,y)=diff(g,x);  
fy(x,y)=diff(f,y);  gy(x,y)=diff(g,y);  
f=inline(f,'x','y');

g=inline(g,'x','y');
fx=inline(fx,'x','y');
fy=inline(fy,'x','y');
gx=inline(gx,'x','y');
gy=inline(gy,'x','y');


%% iteration
err=1; %error in each iterartion
tolerance=input('Allowed tolerance :   ');
i=1; %to count no. of iteration

while err > tolerance

    F=[f(x0(1),x0(2));  g(x0(1),x0(2))]; %evaluate function value

    %evaluate jacobian
    J=[fx(x0(1),x0(2)) gx(x0(1),x0(2)); fy(x0(1),x0(2)) gy(x0(1),x0(2))]; 

    x1= x0 - J\F;%Newton Raphson iteration

    err= double(norm(x1-x0)/norm(x1));
    %simplify(err)
    i=i+1;
    x0=x1; % update the approximation
    %storing the current values of f,g,error,iteration no.
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