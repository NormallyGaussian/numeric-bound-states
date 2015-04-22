% test R = 10, 50, 100, 500
% for each R, N = 250, 500, 1000, 2000, 5000

y =[];

for mu = [ -.19 -.18 -.17 -.16 -.15 -.1 -.05]
         N = 100
        R = 20
        
    mu
      y = [y, solit2dhypb(mu,R,N,0)]
      
end

for mu = [0:.25:5]
         N = 250
        R = 10
        
    mu
      y = [solit2dhypb(mu,R,N,0), y]
      
end


x = [ -.19 -.18 -.17 -.16 -.1:.05:5]
