%diagonal matrix reached and used
clc
clear
A=input('enter coefficient matrix ');     %sample input: [1 2 3 ; 3 1 2 ; 2 3 1]
b=input('enter b vector ');               %sample input: [0 3 2]'
%normal checking
As=size(A);
bs=size(b);
if (As(1)~=As(2))||(bs(1)~=As(1))||(bs(2)~=1)
    fprintf('cant find solution, matrix dimensions are incorrect.\n ');
    return
end
C=[A b];
if det(A)==0
    fprintf('no solution exists\n ');
    return;
end
n=As(1);
flag=0;
%forward subsitution
for i=1:1:n
   if C(i,i)==0
        flag=1;
        break;
   end
   for j=i+1:1:n
       Y=C(j,i)/C(i,i);
       C(j,:)=C(j,:)-Y.*C(i,:);
   end
   for j=i-1:-1:1
       Y=C(j,i)/C(i,i);
       C(j,:)=C(j,:)-Y.*C(i,:);
   end
end
if flag
    fprintf('No solution exists\n ');
    return;
end
%back subsitution
X=zeros(n,1);
X(n)=C(n,n+1)/C(n,n);
for i=n-1:-1:1
    X(i)=C(i,n+1)/C(i,i);
end
X'