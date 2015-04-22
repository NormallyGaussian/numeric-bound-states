% testing matrix stuff


% How to solve the problem Ax = b

A = [1 0; 0 2]
b = [2; 8]
x = A \ b


% Make A into sparse matrix (only store nonnegative values)
B = spdiags(A)

%A = sparse(A)

c = 1:2

D = diag(x)

C = spdiags(A,c)


%create sparse diagonal matrix

mu = 1;
R = 1;
N = 10;
dx = (2*R)/(N-1);
h = dx;

x = [-R:dx:R];

%Diagonal
d = -2/3*mu*h - 2/h

%subdiagonals
s = -mu*h/6 + 1/h


d1 = [];
s1 = [];

for j = 1:N

    d1 = [d1 d];
end

for j = 1:N
s1 = [s1 s];
end
%Take matrix transpose
d1 = d1';
s1 = s1';



A = spdiags([s1 d1 s1], -1:1, N, N);

%Now for the matrix M corresponding to the Laplacian

%M = spdiags(

A1 = inv(A);

Ainv=sparse(A1)








% M Diagonal
dm = - 2/h

% M subdiagonals
sm = 1/h


d1m = [];
s1m = [];

for j = 1:N

    d1m = [d1m dm];
end

for j = 1:N
s1m = [s1m sm];
end
%Take matrix transpose
d1m = d1m';
s1m = s1m';



M = spdiags([s1m d1m s1m], -1:1, N, N)









%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Program goes here
%%%%%%%%%%%%%%%%%%%%%%%%%%%




u0 = exp(-x.^2);
lambda0 = 1;
w0 = u0/lambda0;



%%%%%%% Newton's Method stuff


lambda = lambda0 + w0*(M*(w0')) - ((1/lambda0)*((w0)*(M*(Ainv*(abs(lambda0*(w0')).^2.*(w0'))))))...
    *(((1/lambda0)^2)*((((w0)*(M*(Ainv*(abs(lambda0*(w0')).^2.*(w0'))))))-((lambda0)*((w0)*(M*(Ainv*((2*lambda0*abs((w0')).^2.*(w0')))))))))




