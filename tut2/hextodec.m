lookup(['0':'9','A':'F'])=0:15;
num=input('input number ','s');
sum=0;
n=size(num);
for i=1:n(2)
    sum=sum+lookup(num(i))*16.^(n(2)-i);
end
sum