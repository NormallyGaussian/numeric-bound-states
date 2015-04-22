N= 50;
R = 10;
mu = 1;

dx = R/N;

x = [-R:dx:R];
y = [-R:dx:R];
[X,Y] = meshgrid(x,y);

u0 = solit2dhypb_graph(mu,R,N,0);

maxXrow = max(X.^2,[],1);
maxX = max(maxXrow);
maxYrow = max(Y.^2,[],1);
maxY = max(maxYrow);

RR = sqrt(maxX+maxY);

r = [1:N^2];
u = [1:N^2];
flag = 0;
for i = 1:N
    for j = 1:N
        flag = flag + 1;
        r(flag) = sqrt(X(i,j).^2 + Y(i,j).^2);
        u(flag) = abs(u0(i,j));
    end
end

plot(r,u);
% r1 = linspace(0,RR);
% u1 = spline(r,u,r1);

% plot(r1,u1);

