N= 2000;


R = 50;
dx = R/N;

x = [-R:dx:R];
u = hat1d_nodelta(.05,R,N,0);
v = solit1d(.05,R,N,0);

% Plot the curves
plot(x, u,'b',x, v,'--g','linewidth',2);
set(gca, 'fontsize',16);

% Annotate the figure
xlabel('x','Interpreter', 'Latex');
ylabel('u','Interpreter', 'Latex');
lgnd = legend('Finite Element', 'FFT');
set(lgnd,'interpreter','latex');
title('Comparison of Fourier and Finite Element Methods: $\mu = 0.05$','interpreter','latex');

% Save figure, note the argument 'epsc2', which saves color information
saveas(gcf,'compare_FFT_FinElt_mu_point05_N2000_R50.eps','epsc2');



R = 10;
dx = R/N;

x = [-R:dx:R];
u = hat1d_nodelta(1,R,N,0);
v = solit1d(1,R,N,0);

% Plot the curves
plot(x, u,'b',x, v,'--g','linewidth',2);
set(gca, 'fontsize',16);

% Annotate the figure
xlabel('x','Interpreter', 'Latex');
ylabel('u','Interpreter', 'Latex');
lgnd = legend('Finite Element', 'FFT');
set(lgnd,'interpreter','latex');
title('Comparison of Fourier and Finite Element Methods: $\mu = 1$','interpreter','latex');

% Save figure, note the argument 'epsc2', which saves color information
saveas(gcf,'compare_FFT_FinElt_mu_1_N2000_R10.eps','epsc2');



R = 5;
dx = R/N;

x = [-R:dx:R];
u = hat1d_nodelta(5,R,N,0);
v = solit1d(5,R,N,0);

% Plot the curves
plot(x, u,'b',x, v,'--g','linewidth',2);
set(gca, 'fontsize',16);

% Annotate the figure
xlabel('x','Interpreter', 'Latex');
ylabel('u','Interpreter', 'Latex');
lgnd = legend('Finite Element', 'FFT');
set(lgnd,'interpreter','latex');
title('Comparison of Fourier and Finite Element Methods: $\mu = 5$','interpreter','latex');

% Save figure, note the argument 'epsc2', which saves color information
saveas(gcf,'compare_FFT_FinElt_mu_5_N2000_R5.eps','epsc2');



