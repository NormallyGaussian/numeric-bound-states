
% Sigma currently set at 1 (change Newton's method)

function sol = shift2d(mu,R,N,L)

format long;
dx = R/N;

% Shift mu over by ((d-1)^2)/4
mu = .25 + mu;

x = [-R+.001:dx:R+.001];

y = [-R+.001:dx:R+.001];
[X,Y] = meshgrid(x,y);
% Define r = |x|
r = abs(X);

N1 = size(x,2);

xi = [1:N1];

xifreq0 = floor(N1/2+1);

xi = xi - xifreq0;
[XI1,XI2] = meshgrid(xi);
% k
absXIsquared = pi^2*XI1.^2/R^2 +  pi^2*XI2.^2/R^2;

% Initial guess for u_0
u0 = indat(X,Y,L);

% sets V
V = dwp(X,Y,L,N1);

uhat0 = fftshift(fftn(u0));

lambda0 = 1;

what0 = uhat0/lambda0;

% Note: use nonlin1 (resp. dnonlin1) to include lambda,
% nonlin (resp. dnonlin) to not include lambda.
for k = 1:100

    %Now we do Newton's Method:
    for j = 1:10

        lambda = lambda0 + ((sum(sum((absXIsquared + mu).^(-1).*fftshift(fftn(dnonlin1(ifftn(ifftshift(what0)),lambda0,X,1))).*conj(what0)))).^(-1))* ...
            (sum(sum((abs(what0).^2))) - sum(sum((fftshift(fftn(ifftn(ifftshift(what0)).*V))).*(absXIsquared+mu).^(-1).*conj(what0))) - ...
            sum(sum((absXIsquared + mu).^(-1).*fftshift(fftn(nonlin1(ifftn(ifftshift(what0)),lambda0,X,1))).*conj(what0))));
        
     

        lambda0 = lambda;

    end


% (10) from Albowitz
    what = (fftshift(fftn((ifftn(ifftshift(what0))).*V)))./(absXIsquared+mu) + (fftshift(fftn(nonlin1(ifftn(ifftshift(what0)),lambda0,X,1))))./(absXIsquared+mu);

    what0 = what;

    u1 = abs(ifftn(ifftshift(lambda0*what0)));

    % z measures the difference between u(n+1) and u(n), telling us whether
    % this sequence is convergent (z small => convergent).
    z = max(abs(u1-u0));
    
    u0 = u1;

end

% Plots error term
z;


%Plot results in two figures
% figure(1); clf;
% waterfall(X,Y,real(u0))
% zlabel('|u|')
% ylabel('y')
% xlabel('x')
% grid on
% 
% figure(2); clf;
% mesh(X,Y,V)
% zlabel('|V|')
% ylabel('y')
% xlabel('x')
% grid on
% 
% figure(3); clf;
% surf(X,Y,real(u0))
% shading interp
% zlabel('|u|')
% ylabel('y')
% xlabel('x')
% grid on

% Compute the L2 norm of bound state:
sol = sum(sum(dx^2*abs(u0).^2));



% Initial guess for u_0 (indat = initial data??)
function f = indat(X,Y,L)

% f = exp(-X.^2);

f = (.5)*exp(-((X-L).^2+(Y-L).^2)/4)/sqrt(4*pi);

% Potential: V_2(r) = -1/4 \tilde(V)
function V = dwp(x,Y,L,N)

r = abs(x);
% Replace r = 0 values (create singularity) with r = .0001
%r( r==0) = .0001;
V = (-1/4)*(((r.^2)-(sinh(r)).^2)./((r.^2).*(sinh(r)).^2));

% --------------------------------
% Non-linearity (includes lambda)

function f = nonlin1(z,lambda,x,sigma)
r = abs(x);
% Replace r = 0 values (create singularity) with r = .0001
r( r==0) = .0001;

f = (r./(sinh(r))).*((abs(lambda*z).^2)./(1+sigma*abs(lambda*z).^2)).*z;

% f = (r./(sinh(r))).*abs(lambda*z).^2.*z;


% --------------------------------
% Derivative of non-linearity (includes lambda)

function f = dnonlin1(z,lambda,x,sigma)
r = abs(x);
% Replace r = 0 values (create singularity) with r = .0001
r( r==0) = .0001;

f = (r./(sinh(r))).*((1+sigma*abs(lambda*z).^2).*(2*lambda*abs(z).^2)-(abs(lambda*z).^2).*(2*lambda*abs(z).^2) ./(1+sigma*abs(lambda*z).^2).^2).*z;

% f = (r./(sinh(r))).*(2*lambda*abs(z).^2).*z;



