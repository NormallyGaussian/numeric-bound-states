function sol = weinmax1(u0)

d = 2;
R = 2.0;
R1 = 10.0;
N = 200;
N1 = 400;
dr = R/N;
dr1 = (R1-R)/N1;
r = [0:dr:R R+dr1:dr1:R1];
N = size(r,2)-1;

tol = 1e-12;

A = zeros(N+1);
A = sparse(A);
F1 = @(x)(x-r(2)).^2.*(sinh(x).^(d-1));
F2 = @(x)(x-r(1)).*(r(2)-x).*(sinh(x).^(d-1));

A(1,1) = quadl(F1,r(1),r(2),tol)/((r(2)-r(1))^2);
A(1,2) = quadl(F2,r(1),r(2),tol)/((r(2)-r(1))^2);

for j = 2:N
    F1 = @(x)(x-r(j-1)).^2.*(sinh(x).^(d-1));
    F12 = @(x)(x-r(j+1)).^2.*(sinh(x).^(d-1));
    F2 = @(x)(x-r(j-1)).*(r(j)-x).*(sinh(x).^(d-1));
    F3 = @(x)(r(j+1)-x).*(x-r(j)).*(sinh(x).^(d-1));

    A(j,j) = quadl(F1,r(j-1),r(j),tol)/((r(j)-r(j-1))^2) + quadl(F12,r(j),r(j+1),tol)/((r(j+1)-r(j))^2);
    A(j,j-1) = quadl(F2,r(j-1),r(j),tol)/((r(j)-r(j-1))^2);
    A(j,j+1) = quadl(F3,r(j),r(j+1),tol)/((r(j+1)-r(j))^2);

end
F1 = @(x)(x-r(N)).^2.*(sinh(x).^(d-1));
F12 = @(x)(x-r(N+1)-dr).^2.*(sinh(x).^(d-1));
F2 = @(x)(x-r(N)).*(r(N+1)-x).*(sinh(x).^(d-1));

A(N+1,N+1) = quadl(F1,r(N),r(N+1),tol)/((r(N+1)-r(N))^2) + quadl(F12,r(N+1),r(N+1)+dr,tol)/(dr^2);
A(N+1,N) = quadl(F2,r(N),r(N+1),tol)/((r(N+1)-r(N))^2);


    z1 = ((abs(u0).^(4/d).*u0)'*(A*u0));
    z2 = (u0'*(A*u0))^(2/d);
    sol = (z1^(-1))*z2;





