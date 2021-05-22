num=input('enter number ');
if(num==0)
    fprintf('0');
    return;
end
hn='';
helper='ABCDEF';
while num>0
    yy=rem(num,16);
    num=floor(num/16);
    if(yy>=10)
        hn=[hn helper(yy-10+1)];
    else
        hn=[hn num2str(yy)];
    end
end
hn=flip(hn);
hn
    