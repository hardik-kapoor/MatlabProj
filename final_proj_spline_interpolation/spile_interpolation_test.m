clear
clc
%% inputs
ff=@(x)sin(x);
for i=1:10
    X(i)=(i);
end
for i=1:20
    y(i)=ff((i));
end
ntemp=size(X);
n=ntemp(2);
ntemp2=size(y);
n2=ntemp2(2);
if ( (n~=n2) || n==1)
    fprintf('enter valid set of points ');
end
n=n-1;
%% creating matrix to solve for M
Meq=zeros(n-1);
beq=zeros(n-1,1);
for i=1:n-1
    if i==1
        Meq(i,i)=(X(1,i+2)-X(1,i))/3;
        Meq(i,i+1)=(X(1,i+2)-X(1,i+1))/6;
        beq(i,1)=(y(1,i+2)-y(1,i+1))/(X(i+2)-X(i))-(y(1,i+1)-y(1,i))/(X(i+1)-X(1));
    elseif i==n-1
        Meq(i,i-1)=(X(1,i+1)-X(1,i))/6;
        Meq(i,i)=(X(1,i+2)-X(1,i))/3;
        beq(i,1)=(y(1,i+2)-y(1,i+1))/(X(i+2)-X(i))-(y(1,i+1)-y(1,i))/(X(i+1)-X(1));
    else
        Meq(i,i-1)=(X(1,i+1)-X(1,i))/6;
        Meq(i,i)=(X(1,i+2)-X(1,i))/3;
        Meq(i,i+1)=(X(1,i+2)-X(1,i+1))/6;
        beq(i,1)=(y(1,i+2)-y(1,i+1))/(X(i+2)-X(i))-(y(1,i+1)-y(1,i))/(X(i+1)-X(1));
    end
end
%% applying gauss elimnation
MVal=gausswithpivot(Meq,beq);

%% making the piecewise functions
for i=1:n
    if i==1
        s{i}=@(x)((((x-X(1,i)).^3)*MVal(i,1))/(6*(X(1,i+1)-X(1,i)))+((X(1,i+1)-x)*y(1,i)+(x-X(1,i))*y(1,i+1))/(X(1,i+1)-X(1,i))-((X(1,i+1)-X(1,i))/6)*((x-X(1,i))*MVal(i,1)));
    elseif i==n
        s{i}=@(x)((((X(1,i+1)-x).^3)*MVal(i-1,1))/(6*(X(1,i+1)-X(1,i)))+((X(1,i+1)-x)*y(1,i)+(x-X(1,i))*y(1,i+1))/(X(1,i+1)-X(1,i))-((X(1,i+1)-X(1,i))/6)*((X(1,i+1)-x)*MVal(i-1,1)));
    else
        s{i}=@(x)((((X(1,i+1)-x).^3)*MVal(i-1,1)+((x-X(1,i)).^3)*MVal(i,1))/(6*(X(1,i+1)-X(1,i)))+((X(1,i+1)-x)*y(1,i)+(x-X(1,i))*y(1,i+1))/(X(1,i+1)-X(1,i))-((X(1,i+1)-X(1,i))/6)*((X(1,i+1)-x)*MVal(i-1,1)+(x-X(1,i))*MVal(i,1)));
    end
end

%% plots
hold on
fplot(0,[X(1,1) X(1,n+1)]);

for i=1:n
    fplot(s{i},[X(1,i) X(1,i+1)]);
end

hold off

%% extrapolation
fprintf('enter extrapolating value between %d and %d',X(1,1),X(1,n+1))
inp=input(' ');
nown=size(inp);
mn=nown(2);
for i=1:mn
    pt=-1;
    for j=1:n
        if ((inp(1,i)>=X(1,j))&&(inp(1,i)<=X(1,j+1)))
            pt=j;
            break;
        end
    end
    if pt==-1
        fprintf('invalid value\n')
        continue;
    end
    fprintf('value at %d is %d with error %d\n',inp(1,i),s{pt}(inp(1,i)),abs(s{pt}(inp(1,i))-ff(inp(1,i)))/abs(ff(inp(1,i))))
end
