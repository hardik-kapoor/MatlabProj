% Matrix is real symmetric square matrix
% Jacobi Iteration method for Find Eigenvalus and eigenvector

A = input('Enter a square matrix ');
%A = [3 2 2;2 5 2; 2 2 3];
[m n]=size(A);

if m ~=n
    disp('A is not square matrix');
    return
end
%% check whether matrix is symmetric or not
sum=0;
for i=2:n
for j=1:i-1    
   sum=sum+ (A(i,j)-A(j,i));
end
end

if sum~=0
    disp('A is not symmetric matrix')
    return
end

%% To initialise rotation
iter=1;
D = A;
R = eye(n);
%% 
max_iter=input('Enter the maximum number of iterations ');% 50 

while iter<max_iter

%% To find maximum off diagonal element
i=1;
j=2;
max = abs(D(1,2));
for p=1:n
    for q=1:n
        if p~=q && max<abs(D(p,q))
                max=abs(D(p,q));
                i=p;
                j=q;
            
        end
    end
end

%% Find the rotation matrix
if D(i,i)~=D(j,j)
    theta=0.5*atan(2*max/(D(i,i)-D(j,j)));
else
    theta = pi/4;
end
R1 = eye(n);
R1(i,i) = cos(theta);
R1(i,j) = sin(theta);
R1(j,i) = -sin(theta);
R1(j,j) = cos(theta);

%% Update the solution
D = R1'*D*R1;
R = R*R1;
iter = iter+1;
end

D % Diagonal elements are Eigenvalues of Given matrix
R % Eigenvector