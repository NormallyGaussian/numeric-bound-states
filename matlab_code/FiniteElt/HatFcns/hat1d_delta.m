
function sol = hat1d_delta(mu,R,N,L)

%%%%%%%%% This code uses 2N+1 nodes

format long;
dx = (R)/(N);
h = dx;
x = [-R:dx:R];

VN = N+1;

N = 2*N + 1;

V = pot(VN,N);

%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%Define matrix A
%%%%%%%%%%%%%%%%%%%%%%%

%Identity
ee = ones(N,1);
Id = spdiags([ee], 0, N, N);

%Diagonals
dd1 = 2/3*h;
dd2 =  2/h;

%subdiagonals
ss1 = h/6;
ss2 =  -1/h;

d1 = [];
s1 = [];

for j = 1:N
    d1 = [d1 dd1];
end

for j = 1:N
    s1 = [s1 ss1];
end
%Take matrix transpose
d1 = d1';
s1 = s1';

% Define matrix A
A = spdiags([s1 d1 s1], -1:1, N, N);

%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%Define matrix M
%%%%%%%%%%%%%%%%%%%%%%%

% M Diagonal
dm = 2/h;

% M subdiagonals
sm = -1/h;

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

%Define matrix M
M = spdiags([s1m d1m s1m], -1:1, N, N);

%Define matrix Binv
B1 = inv(M+mu*A-V);
Binv=sparse(B1);

%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%

% Initial guess for u_0
u0 = indat(x,L);

%%%%%%%%%%%%%%%%%%%%%%%%
%%% Initialize, define w
%%%%%%%%%%%%%%%%%%%%%%%

lambda0 = 1;
w0 = u0/lambda0;

tic
for k = 1:100
    
    %Newton's method:
    for j = 1:15
          lambda = lambda0 + ((conj(w0)*(A*w0') - (conj(w0)*(A*(Binv*(nonlin1(A,w0',lambda0))))))...
     ./(( (conj(w0)*(A*(Binv*(dnonlin1(A,w0',lambda0))))))));
      
        lambda0 = lambda;
    end

    w = (Binv*nonlin1(A,w0',lambda0));
    w0 = w';
    u1 = abs(lambda0*w0);

% z measures the difference between u(n+1) and u(n), telling us whether
% this sequence is convergent (z small => convergent).
  z = max(abs(u1-u0));
    
    u0 = u1;
end
toc

% Plots error term
%z;

 plot(x,real(u0))

% Compute the L2 norm of bound state:
sol = sum(dx*abs(u0).^2);

%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%

% Potential
function V = pot(VN,N)

%%%%%%%%%%%%%%
% Create potential matrix V - delta function centered at zero
%%%%%%%%%%%%%%

vv1 = 0;
v1 = [];
for j = 1:N
    if j == VN
        vv1 = 1;
    end
    v1 = [v1; vv1];
    vv1 = 0;
end

V = spdiags([v1], 0, N, N);




% Initial guess for u_0 (indat = initial data??)
function f = indat(X,L)

% f = exp(-X.^2);

f = (.5)*exp(-(X-L).^2/4)/sqrt(4*pi) + exp(-(X+L).^2/4)/sqrt(4*pi);


%%%%%%%%%%%%%%%%%%%%%%%
% Non-linearity 

function f = nonlin1(D,z,lambda)
    f = D*(abs(lambda*z).^2.*z);

%%%%%%%%%%%%%%%%%%%%%%%
% Derivative of non-linearity 

function f = dnonlin1(D,z,lambda)
    f = D*((2*lambda*abs(z).^2).*z);



