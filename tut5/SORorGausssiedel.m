clc
clear
A=input('enter square matrix A ');
b=input('enter matrix b ');
x=input('enter initial condition ');
AS=size(A);
if(AS(1)~=AS(2))
    disp('enter square matrix ');
    return;
end
L=zeros(AS);D=zeros(AS);U=zeros(AS);
n=AS(1);
for i=1:n
    for j=1:n
        if i==j
            D(i,j)=A(i,j);
        elseif i>j
            L(i,j)=A(i,j);
        else
            U(i,j)=A(i,j);
        end
    end
end
epsilon=1e-5;
er=norm(b-A*x,Inf);
k=0;
while er>epsilon
    X=(L+D)\(b-U*x);
    %(D+L.*w)\(b.*w-(U.*w-(1-w).*D)*x)
    %w is the relaxation parameter
    x=X;
    er=norm(b-A*x,Inf);
    k=k+1;
end
k