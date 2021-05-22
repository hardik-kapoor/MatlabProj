clc
clear
f=inline('sin(x)-exp(-x)','x');
a0=input('input a0 ');
b0=input('input b0 ');
i=1;
if f(a0)*f(b0)<0
    c0=(a0+b0)/2;
else
    disp('enter valid\n');
    return;
end
while abs(f(c0))>1e-4
    a1(i,1)=a0;b1(i,1)=b0;c1(i,1)=c0;iter(i,1)=i-1;
    if f(a0)*f(c0)>0
        a0=c0;
    else
        b0=c0;
    end
    c0=(a0+b0)/2;
    %c0=(a0*f(b0)-b0*f(a0))/(f(b0)-f(a0));
    %in regula falsi
    i=i+1;
end
T=table(iter,a1,b1,c1)