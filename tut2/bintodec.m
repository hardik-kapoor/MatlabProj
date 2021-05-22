A=input('input binary number ');
as=0;
pw=1;
while(A>0)
   k=rem(A,10);
   A=floor(A/10);
   as=as+k*pw;
   pw=pw*2;
end
as
