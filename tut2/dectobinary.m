num=input('enter num ');
if(num==0)
    fprintf("0\n");
    return
end
as='';
while num>0
    y=rem(num,2);
    num=floor(num/2);
    as=[as num2str(y)];
end
as=flip(as);
as