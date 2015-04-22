
y =[];

for mu = [ -.24 -.23 -.22 -.21 -.20]
         N = 1500
        R = 50
        
    mu
      y = [y, solit2dhypb(mu,R,N,0)]
      
end

for mu = [ -.19 -.18 -.17 -.16 -.15 -.1 -.05]
         N = 1500
        R = 20
        
    mu
      y = [y, solit2dhypb(mu,R,N,0)]
      
end

for mu = [0:.2:2]
         N = 1500
        R = 10
        
    mu
      y = [solit2dhypb(mu,R,N,0), y]
      
end


x = [ -.19 -.18 -.17 -.16 -.15 -.1 -.05 0:.25:5];
% Plot the curves
plot(x, y,'linewidth',2);
set(gca, 'fontsize',16);

% Annotate the figure
xlabel('$\mu$','Interpreter', 'Latex');
ylabel('$M(\mu)$','Interpreter', 'Latex');
lgnd = legend('$u$', '$v$');
set(lgnd,'interpreter','latex');
title('Example Figure','interpreter','latex');

% Save figure, note the argument 'epsc2', which saves color information
saveas(gcf,'fig1.eps','epsc2');