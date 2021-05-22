function p=plot3D()
t=linspace(0,2*pi,500);
x=sin(t.^2);
y=cos(1/t);
z=t;
p=plot(x,y,z);
end