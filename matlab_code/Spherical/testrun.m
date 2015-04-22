% test R = 10, 50, 100, 500
% for each R, N = 250, 500, 1000, 2000, 5000
clear;
zs = [];
mus = [];

for mu = [.26 .3 .4 .5 .75 1 1.5 2 3 4 5 6 7]
         N = 50
       
        
    mu
      solit2dsph(mu,N,0)
      
      zs = [zs, ans];
    mus = [mus mu];
    
end



plot(mus,zs);
