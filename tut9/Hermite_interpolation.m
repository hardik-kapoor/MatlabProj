jt%% Interpolating by the Hermite interpolation method
clc
clear
syms x;
%% Input
X=input("input the values of xi - ");
Y=input("input the values of f(xi) - ");
Y1=input("input the values of f'(xi) - ");
u=input("input the value at which you want to evalute interpolating polynomial - ");
%% iteration
n=length(Y);
H=0;
for i=1:n
    %finding larange's  polynomial L and L^2
    L=1;
    L2=1;%L^2
    for t=1:n
        if t~=i
            L=L*((x-X(t))/(X(i)-X(t)));
            L2=L2*((x-X(t))/(X(i)-X(t)))^2;
            
        end
    end
    
    DL=diff(L,x);%derivative of lagrange polynomial
    DL1=inline(DL,'x'); 
    
    A=(1-2*(x-X(i))*DL1(X(i)))*L2;  %coefficient of f(xi)
    B=(x-X(i))*L2;     %coefficient of f'(xi)
    
    H=H+A*Y(i)+B*Y1(i); %adding the term calculated in the ith iteration to final polynomial
    
    
end
% H=simplify(H);
H=inline(H,'x');
H
output=H(u);
fprintf("Required value is %f\n",output);

