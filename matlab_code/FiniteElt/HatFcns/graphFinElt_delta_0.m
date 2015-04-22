N= 2000;

R = 50;
dx = R/N;

x = [-R:dx:R];

u = hat1d_delta_graph(.05,R,N,0);
% v = solit1d(5,R,N,0);

plot(x, u,'linewidth',2);
set(gca, 'fontsize',16);

% Annotate the figure
xlabel('$x$','Interpreter', 'Latex');
ylabel('$u$','Interpreter', 'Latex');
title('Finite Element Method, Euclidean Soliton: $\mu = 0.05$','interpreter','latex');

% Save figure, note the argument 'epsc2', which saves color information
saveas(gcf,'hat1d_mu_point05_N2000_R50.eps','epsc2');



