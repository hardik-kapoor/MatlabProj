function [X]=gausswithpivot(A,b)
    %normal checking
    As=size(A);
    bs=size(b);
    if (As(1)~=As(2))||(bs(1)~=As(1))||(bs(2)~=1)
        fprintf('cant find solution, matrix not correct\n ');
        return
    end
    C=[A b];
    if det(A)==0
        fprintf('no solution exists\n ');
        return;
    end
    n=As(1);
    flag=0;
    %forward subs
    for i=1:1:n-1
        for j=i+1:1:n
            if abs(C(j,i))>=abs(C(i,i))
                C([i,j],:)=C([j,i],:);
            end
        end
       if C(i,i)==0
            flag=1;
            break;
       end
       for j=i+1:1:n
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
        sum=0;
        for j=i+1:1:n
            sum=sum+C(i,j)*X(j);
        end
        X(i)=(C(i,n+1)-sum)/C(i,i);
    end
end