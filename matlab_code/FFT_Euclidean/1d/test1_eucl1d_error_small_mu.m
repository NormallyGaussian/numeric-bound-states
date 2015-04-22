% test R = 10, 20, 50, 100
% for each R, N = 100, 250, 500, 1000, 2000

q = [-.249, -.245, -.24, -.23, -.22, -.21];
q = q + .25

for mu = [.001, .005]

   
    for R = [200,300]
        for N = [10000]
    
        R
        N
        mu
        solit1d_eucl(mu,R,N,0)
        
        end
    end
      
end
