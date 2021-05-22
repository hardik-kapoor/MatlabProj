clc
clear
A=input('input the matrix for LU decomp ');
AS=size(A);
if(AS(1)~=AS(2))
    disp('enter correct matrix, this is not a square matrix ');
    return;
end
n=AS(1);
L=eye(n);U=A;P=eye(n);
for i=1:n-1
    for j=i+1:n
        if abs(U(j,i))>abs(U(i,i))
            U([i,j],:)=U([j,i],:);
            P([i,j],:)=P([j,i],:);
        end
    end
    if U(i,i)==0
        disp("cant find LU decomp");
        return;
    end
    L(i+1:n,i)=U(i+1:n,i)/U(i,i);
    U(i+1:n,i:n)=U(i+1:n,i:n)-L(i+1:n,i)*U(i,i:n);
end
P
L
U