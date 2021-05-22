clc
clear
A=input('input symmetric matrix ');
maxit=input('input max iterator ');
AS=size(A);
if AS(1)~=AS(2)
    disp('enter correct\n');
    return;
end
n=AS(1);
iter=1;D=A;R=eye(n);
while iter<maxit
    l=1;r=2;
    for i=1:n
        for j=1:n
            if i==j
                continue;
            end
            if abs(D(i,j))>abs(D(l,r))
                l=i;
                r=j;
            end
        end
    end
    if D(l,l)==D(r,r)
        if D(l,r)>0
            thet=pi/4;
        else
            thet=-pi/4;
        end
    else
        thet=(0.5)*atan(2*D(l,r)/(D(l,l)-D(r,r)));
    end
    Rtemp=eye(n);
    Rtemp(l,l)=cos(thet);
    Rtemp(r,r)=cos(thet);
    Rtemp(l,r)=-sin(thet);
    Rtemp(r,l)=sin(thet);
    D=Rtemp'*D*Rtemp;
    R=R*Rtemp;
    iter=iter+1;
end
D
R