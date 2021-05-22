clc
clear all
str = input('Give an equation in x: ','s')  ;
f = inline(str,'x') ;
x0 = input('Enter a value for lower boundary x0:   ');
x1 = input('Enter a value for upper boundary x1:   ');
tol = input('Allowed tolerance   ');

if (f(x0)*f(x1) > 0 )
    disp ('Invalid values of x0 and x1.')
    return;
end
iter=1;
err=1;
i=1;

while err > tol
    
x2 = x0-((x0-x1)*f(x0))/(f(x0)-f(x1));

err=abs(f(x2));
	a1(i,1)=x0;   
    b1(i,1)=x1;   
    c1(i,1)=x2;  
    iter(i,1)=i-1; 
    error(i,1)=err;	
    
    %update x1 and x0
	if f(x0)*f(x2) < 0
		x1 = x2;
	else
		x0 = x2;
    end 
    i=i+1;
    
end
fprintf('The root of the equation is %f \n', x2)
 T =  table(iter,a1,b1,c1,error)