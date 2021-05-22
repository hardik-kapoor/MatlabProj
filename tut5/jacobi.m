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
    X=D\(b-(L+U)*x);    %inv(D)*(b-(L+U)*x);
    er=norm(X-x,Inf);
    x=X;
    k=k+1;
    if k>25
        fprintf('doesnt give solution after 25 iterations ');
        return;
    end
end
fprintf('the number of iteration needed are %d',k);
x