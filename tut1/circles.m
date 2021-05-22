function h=circles(x,y)
th = linspace(0, 2*pi, 1000).';
r=5:1:9;
xu=r.*cos(th) +x;
yu=r.*sin(th)+y;
h=plot(xu,yu)
end
