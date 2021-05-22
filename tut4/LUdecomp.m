clc
clear
A=input('input the matrix for LU decomp ');
AS=size(A);
if(AS(1)~=AS(2))
    disp('enter correct matrix, this is not a square matrix ');
    return;
end
n=AS(1);
for i=1:1:n
    if A(i,i)==0
        disp('pivoting required, enter correct matrix ');
        return;
    end
end
L=eye(n);
U=A;
for i=1:1:n-1
    if(U(i,i)==0)
        disp('pivoting required,enter correct matrix ');
        return;
    end
    L(i+1:n,i)=U(i+1:n,i)/U(i,i);
    for j=i+1:n
        U(j,i:n)=U(j,i:n)-L(j,i)*U(i,i:n);
    end
end
%U(k+1:n,k:n) = U(k+1:n,k:n)-L(k+1:n,k)*U(k,k:n);
%%%%%%%%%%%%%%%%%%%solving
%forward subs
y = zeros(length(b),1);
y(1)=b(1)/L(1,1);
for i = 2:n
    sum = 0;
    for j = 1:i-1
        sum = sum+(L(i,j)*y(j));
    end
    y(i)=(b(i)-sum)/L(i,i) ;
end
% Solving Ux=y by backward substitution

x = zeros(length(b),1);
x(n)=y(n)/U(n,n);

for i =n-1:-1:1
    sum=0;
    for j = i+1:n
        sum=sum+(U(i,j)*x(j));
    end
    x(i)=(y(i)-sum)/U(i,i) ;
end


