clc
clear all
close all



syms x;
f(x) = cos(x)-(x*exp(x));
df(x) = diff(f,x);

N_max = 5; % Maximum no. of iterations
tol = 0.001
x0 = 1;   % Initial Approximation
i=1;
p=10;
while i <= N_max
     x1 = x0 - (f(x0)/df(x0));
   
      
      p=abs(x1-x0);
      if abs(x1-x0) < tol
         break
      else 
      end
   
       k(i,1)=i  ; app_root(i,1)=x1; d(i,1)=p; f1(i,1)=f(x1);

     
     x0=x1; 
     i = i+1; 
end


T = table(double(k),double(app_root),double(d),double(f1))
  T.Properties.VariableNames = {'k','x_k','x_k-(x_k-1)','f(x_k)'}
