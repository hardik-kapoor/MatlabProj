%% Newton Forward Difference Method code 
clc;
format short
syms z 
x=input("Input xi's - ");%xi's must be equally spaced
y=input("Input yi's - ");
%input example
% x=[ 0.1 0.2 0.3 0.4 0.5];
% y=[ 1.40 1.56 1.76 2.00 2.28 ]; 
[m,n]=size(x);
h=x(2)-x(1);%step length

%% Calculate Forward Differance Table
for i=1:n %zeroth divided difference coloumn
    diff(i,1)=y(i);%ith entry in the column
end
for j=2:n %j-1th divided difference coloumn
    for i=1:n-j+1
        diff(i,j)=diff(i+1,j-1)-diff(i,j-1);
    end
end
ta=diff(1,:); %all the divided difference of form f[x0,x1,...xi],i=0,1,...n

%%
sum= @(x)(y(1));%%initial condition
u = (z-x(1))/h; %x=x(1)+uh
for i=1:n-1%calculating n terms of polynomial
        ter=1;
    for j=1:i %cal coefficients of each term--> u(u-1)....(u-j+1)/j!
       ter=ter*(u-j+1)/j;
    end

    sum=sum+ter*double(ta(i+1));%finally added them 
end

 %%      
polynomial=simplify(sum)

inp=input("Enter the value of z");
double(subs(polynomial,inp))