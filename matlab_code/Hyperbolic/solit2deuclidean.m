% Cubic nonlinearity

function sol = solit2deuclidean(mu,R,N,L)

format long;
dx = R/N;

x = [-R:dx:R];
y = [-R:dx:R];
[X,Y] = meshgrid(x,y);

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
tic
for k = 1:100

    %Now we do Newton's Method:
% for nonlin1 and dnonlin1:

    for j = 1:10

       lambda = lambda0 + ((sum(sum((absXIsquared + mu).^(-1).*fftshift(fftn(dnonlin1(ifftn(ifftshift(what0)),lambda0))).*conj(what0)))).^(-1))* ...
            (sum(sum((abs(what0).^2))) - sum(sum((fftshift(fftn(ifftn(ifftshift(what0)).*V))).*(absXIsquared+mu).^(-1).*conj(what0))) - ...
            sum(sum((absXIsquared + mu).^(-1).*fftshift(fftn(nonlin1(ifftn(ifftshift(what0)),lambda0))).*conj(what0))));
        
        lambda0 = lambda;

    end
        
        


% (10) from Albowitz
    what = (fftshift(fftn((ifftn(ifftshift(what0))).*V)))./(absXIsquared+mu) + (fftshift(fftn(nonlin1(ifftn(ifftshift(what0)),lambda0))))./(absXIsquared+mu);

    what0 = what;

    u1 = abs(ifftn(ifftshift(lambda0*what0)));

    % z measures the difference between u(n+1) and u(n), telling us whether
    % this sequence is convergent (z small => convergent).
    z = max(max(abs(u1-u0)));
    
    u0 = u1;

end
toc
% Plots error term
z


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

% f = (.5)*exp(-(X-L).^2/4)/sqrt(4*pi) + exp(-(X+L).^2/4)/sqrt(4*pi);


% ---------------------------------------
% This V tests whether L-1.5 \leq abs(X(j)) \leq L+1.5
% If the jth coordinate of X is in this range, then the array
% Vit is set to -.1425, otherwise it is 0.
% ---------------------------------------


% Note: for 2d case needs to be a 21x21 matrix
function V = dwp(X,Y,L,N)

% Vit = 0*X;
% for j = 1:N*N
%     if ((abs(X(j)) >= L-1.5) && (abs(X(j)) <= L+1.5) && (abs(Y(j)) >= L-1.5) && (abs(Y(j)) <= L+1.5))
%         Vit(j) = -.1425;
%     end
% end
% V = Vit;

V = 0*X;

% function V = dwp(X,Y,L,sigma)
% 
% V1 = exp(-(X-L).^2/(4*sigma^2))/sqrt(4*pi*sigma^2) + exp(-(X+L).^2/(4*sigma^2))/sqrt(4*pi*sigma^2) + exp(-(Y-L).^2/(4*sigma^2))/sqrt(4*pi*sigma^2) + exp(-(Y+L).^2/(4*sigma^2))/sqrt(4*pi*sigma^2);
% V = V1;



% --------------------------------
% Non-linearity (includes lambda)

function f = nonlin1(z,lambda,sigma)


f = (abs(lambda*z).^2).*z;



% --------------------------------
% Derivative of non-linearity (includes lambda)

function f = dnonlin1(z,lambda,sigma)


f = (2*lambda*abs(z).^2).*z;

