

function sol = solit(mu,R,N,L)

format long;
dx = R/N;

x = [-R:dx:R];

N1 = size(x,2);

xi = [1:N1];

xifreq0 = floor(N1/2+1);

xi = xi - xifreq0;

% k
absXIsquared = pi^2*xi.^2/R^2;

% Initial guess for u_0
u0 = indat(x,L);

% sets V
V = dwp(x,L,N1);

uhat0 = fftshift(fft(u0));

%Error for Newton's Method
% err = eps;

lambda0 = 1;

what0 = uhat0/lambda0;

% Note: use nonlin1 (resp. dnonlin1) to include lambda,
% nonlin (resp. dnonlin) to not include lambda.
for k = 1:100

    %Now we do Newton's Method:
% for nonlin1 and dnonlin1:

    for j = 1:10

        lambda = lambda0 + ((sum((absXIsquared + mu).^(-1).*fftshift(fft(dnonlin1(ifft(ifftshift(what0)),lambda0))).*conj(what0)))^(-1))* ...
            (sum((abs(what0).^2)) - sum((fftshift(fft(ifft(ifftshift(what0)).*V))).*(absXIsquared+mu).^(-1).*conj(what0)) - ...
            sum((absXIsquared + mu).^(-1).*fftshift(fft(nonlin1(ifft(ifftshift(what0)),lambda0))).*conj(what0)));

        lambda0 = lambda;

    end
    
    % for nonlin and dnonlin:
%       for j = 1:10
% 
%         lambda = lambda0 + ((sum((absXIsquared + mu).^(-1).*fftshift(fft(dnonlin(ifft(ifftshift(what0))))).*conj(what0)))^(-1))* ...
%             (sum((abs(what0).^2)) - sum((fftshift(fft(ifft(ifftshift(what0)).*V))).*(absXIsquared+mu).^(-1).*conj(what0)) - ...
%             sum((absXIsquared + mu).^(-1).*fftshift(fft(nonlin(ifft(ifftshift(what0))))).*conj(what0)));
% 
%         lambda0 = lambda;
% 
%     end

% for nonlin1:

% (10)
    what = (fftshift(fft((ifft(ifftshift(what0))).*V)))./(absXIsquared+mu) + (fftshift(fft(nonlin1(ifft(ifftshift(what0)),lambda0))))./(absXIsquared+mu);

    
    % for nonlin:
%     what = (fftshift(fft((ifft(ifftshift(what0))).*V)))./(absXIsquared+mu) + (fftshift(fft(nonlin(ifft(ifftshift(what0))))))./(absXIsquared+mu);

    
    what0 = what;

    u1 = abs(ifft(ifftshift(lambda0*what0)));

    % z measures the difference between u(n+1) and u(n), telling us whether
    % this sequence is convergent (z small => convergent).
    z = max(abs(u1-u0));
    
    u0 = u1;

end

z
%Plot results in two figures
% figure(1); clf;
% plot(x,real(u0))
% ylabel('|u|')
% xlabel('x')
% 
% figure(2); clf;
% plot(x,V)
% ylabel('|V|')
% xlabel('x')

% this is output as ans
% this sums dx (which is determined by the above) *|u_0|^2
sol = sum(dx*abs(u0).^2);



% Initial guess for u_0
function f = indat(X,L)

f = exp(-X.^2);

% f = (.5)*exp(-(X-L).^2/4)/sqrt(4*pi) + exp(-(X+L).^2/4)/sqrt(4*pi);


% ---------------------------------------
% This V tests whether L-1.5 \leq abs(X(j)) \leq L+1.5
% If the jth coordinate of X is in this range, then the array
% Vit is set to -.1425, otherwise it is 0.
% ---------------------------------------


function V = dwp(X,L,N)

Vit = 0*X;
for j = 1:N
    if ((abs(X(j)) >= L-1.5) && (abs(X(j)) <= L+1.5))
        Vit(j) = -.1425;
    end
end
V = Vit;

% function V = dwp(X,L,sigma)
% 
% V1 = exp(-(X-L).^2/(4*sigma^2))/sqrt(4*pi*sigma^2) + exp(-(X+L).^2/(4*sigma^2))/sqrt(4*pi*sigma^2);
% V = V1;



% --------------------------------
% Non-linearity (includes lambda)

function f = nonlin1(z,lambda)

f = ((abs(lambda*z).^6)./((1+.5*abs(lambda*z).^4))).*z;

%f = ((abs(lambda*z).^4)./((1+abs(lambda*z).^2))).*z;

%f = abs(lambda*z).^6.*z;

%f = abs(lambda*z).^4.*z;

%f = abs(lambda*z).^2.*z;



% --------------------------------
% Non-linearity (does not include lambda)

function f = nonlin(z) 

%f = ((abs(z).^6)./((1+.5*abs(z).^4)));

%f = ((abs(z).^4)./((1+abs(z).^2)));

%f = abs(z).^6;

%f = abs(z).^4;

f = abs(z).^2;





% --------------------------------
% Derivative of non-linearity (includes lambda)

function f = dnonlin1(z,lambda)

f = ((abs(lambda*z).^4.*(.5*abs(lambda*z).^4+3))./((1+.5*abs(lambda*z).^4).^2)).*((2*lambda*abs(z).^2).*z);

%f = ((abs(lambda*z).^2.*(abs(lambda*z).^2+2))./((1+abs(lambda*z).^2).^2)).*((2*lambda*abs(z).^2).*z);

%f = (6*lambda^5*abs(z).^6).*z;

%f = (4*lambda^3*abs(z).^4).*z;

%f = (2*lambda*abs(z).^2).*z;


% --------------------------------
% Derivative of non-linearity (does not include lambda)

function f = dnonlin(z) 

%f = ((abs(z).^4.*(.5*abs(z).^4+3))./((1+.5*abs(z).^4).^2)).*((2*abs(z).^2));

%f = ((abs(z).^2.*(abs(z).^2+2))./((1+abs(z).^2).^2)).*((2*abs(z).^2));

%f = 6*abs(z).^6;

%f = 4*abs(z).^4;

f = 2*abs(z).^2;



