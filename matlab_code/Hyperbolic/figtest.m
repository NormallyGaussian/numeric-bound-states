% Construct two curves
x = linspace(0,4);
u = exp(-x.^2);
v = sin(x);

% Plot the curves
plot(x, u, x, v,'linewidth',2);
set(gca, 'fontsize',16);

% Annotate the figure
xlabel('$x$','Interpreter', 'Latex');
lgnd = legend('$u$', '$v$');
set(lgnd,'interpreter','latex');
title('Example Figure','interpreter','latex');

% Save figure, note the argument 'epsc2', which saves color information
saveas(gcf,'fig1.eps','epsc2');