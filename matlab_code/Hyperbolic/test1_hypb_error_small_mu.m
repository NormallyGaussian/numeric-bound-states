% test R = 10, 20, 50, 100
% for each R, N = 100, 250, 500, 1000, 2000

for mu = [-.249, -.245, -.24, -.23, -.22, -.21]
   
    for R = [ 50, 100]
        for N = [100, 250, 500, 1000, 2000]
    
        R
        N
        mu
        solit2dhypb(mu,R,N,0)
        
        end
    end
      
end
