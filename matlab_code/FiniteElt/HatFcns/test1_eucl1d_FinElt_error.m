% test R = 10, 20, 50, 100
% for each R, N = 100, 250, 500, 1000, 2000

for mu = [ .001, .005]

   
    for R = [200, 300]
        for N = [100, 250, 500, 1000, 2000]
    
        R
        N
        mu
        solit1d_eucl(mu,R,N,0)
        
        end
    end
      
end

for mu = [ .05, .25, .75, 1.25, 3.25, 5.25]

   
    for R = [10, 20, 50, 100]
        for N = [100, 250, 500, 1000, 2000]
    
        R
        N
        mu
        solit1d_eucl(mu,R,N,0)
        
        end
    end
      
end
