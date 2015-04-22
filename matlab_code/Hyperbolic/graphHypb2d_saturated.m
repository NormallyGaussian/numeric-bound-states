N= 200;

% 
% R = 50;
% dx = R/N;
% 
% x = [-R:dx:R];
% y = [-R:dx:R];
% [X,Y] = meshgrid(x,y);
% 
% 
% u = solit2dhypb_saturated_graph(-.20,R,N,0,.50);
% % v = solit1d(5,R,N,0);
% 
% M = 2*N+1;
% A = floor(M/4);
% B = floor(3*M/4);
% % A = 1;
% % B = M;
% 
% % Plot the curves
% mesh(X(A:B,A:B), Y(A:B,A:B), u(A:B,A:B));
% shading interp;
% xlim([-25,25]);
% ylim([-25,25]);
% set(gca, 'fontsize',16);
% 
% % Annotate the figure
% xlabel('x','Interpreter', 'Latex');
% ylabel('y','Interpreter', 'Latex');
% zlabel('u','Interpreter', 'Latex');
% %lgnd = legend('Finite Element', 'FFT');
% %set(lgnd,'interpreter','latex');
% title('Hyperbolic Soliton: $\mu = -0.20$, $ \sigma = .50$','interpreter','latex');
% 
% % Save figure, note the argument 'epsc2', which saves color information
% saveas(gcf,'hypb2d_mu_negpoint20_sat_sig_point50_N2000_R50.eps','epsc2');
% 
% 
% 
% 
% 
% R = 50;
% dx = R/N;
% 
% x = [-R:dx:R];
% y = [-R:dx:R];
% [X,Y] = meshgrid(x,y);
% 
% 
% u = solit2dhypb_saturated_graph(-.20,R,N,0,2);
% % v = solit1d(5,R,N,0);
% 
% M = 2*N+1;
% A = floor(M/4);
% B = floor(3*M/4);
% % A = 1;
% % B = M;
% 
% % Plot the curves
% mesh(X(A:B,A:B), Y(A:B,A:B), u(A:B,A:B));
% shading interp;
% xlim([-25,25]);
% ylim([-25,25]);
% set(gca, 'fontsize',16);
% 
% % Annotate the figure
% xlabel('x','Interpreter', 'Latex');
% ylabel('y','Interpreter', 'Latex');
% zlabel('u','Interpreter', 'Latex');
% %lgnd = legend('Finite Element', 'FFT');
% %set(lgnd,'interpreter','latex');
% title('Hyperbolic Soliton: $\mu = -0.20$, $ \sigma = 2.0$','interpreter','latex');
% 
% % Save figure, note the argument 'epsc2', which saves color information
% saveas(gcf,'hypb2d_mu_negpoint20_sat_sig_2_N2000_R50.eps','epsc2');
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% R = 20;
% dx = R/N;
% 
% x = [-R:dx:R];
% y = [-R:dx:R];
% [X,Y] = meshgrid(x,y);
% 
% 
% u = solit2dhypb_saturated_graph(.50,R,N,0,.03);
% % v = solit1d(5,R,N,0);
% 
% M = 2*N+1;
% A = floor(M/3);
% B = floor(2*M/3);
% % A = 1;
% % B = M;
% 
% % Plot the curves
% mesh(X(A:B,A:B), Y(A:B,A:B), u(A:B,A:B));
% shading interp;
% xlim([-7,7]);
% ylim([-7,7]);
% set(gca, 'fontsize',16);
% 
% % Annotate the figure
% xlabel('x','Interpreter', 'Latex');
% ylabel('y','Interpreter', 'Latex');
% zlabel('u','Interpreter', 'Latex');
% %lgnd = legend('Finite Element', 'FFT');
% %set(lgnd,'interpreter','latex');
% title('Hyperbolic Soliton: $\mu = 0.50$, $ \sigma = .03$','interpreter','latex');
% 
% % Save figure, note the argument 'epsc2', which saves color information
% saveas(gcf,'hypb2d_mu_point50_sat_sig_point03_N2000_R50.eps','epsc2');
% 
% 
% 
% 
% 
% 
% 
% 
% R = 20;
% dx = R/N;
% 
% x = [-R:dx:R];
% y = [-R:dx:R];
% [X,Y] = meshgrid(x,y);
% 
% 
% u = solit2dhypb_saturated_graph(.50,R,N,0,.5);
% % v = solit1d(5,R,N,0);
% 
% M = 2*N+1;
% A = floor(M/3);
% B = floor(2*M/3);
% % A = 1;
% % B = M;
% 
% % Plot the curves
% mesh(X(A:B,A:B), Y(A:B,A:B), u(A:B,A:B));
% shading interp;
% xlim([-7,7]);
% ylim([-7,7]);
% set(gca, 'fontsize',16);
% 
% % Annotate the figure
% xlabel('x','Interpreter', 'Latex');
% ylabel('y','Interpreter', 'Latex');
% zlabel('u','Interpreter', 'Latex');
% %lgnd = legend('Finite Element', 'FFT');
% %set(lgnd,'interpreter','latex');
% title('Hyperbolic Soliton: $\mu = 0.50$, $ \sigma = .50$','interpreter','latex');
% 
% % Save figure, note the argument 'epsc2', which saves color information
% saveas(gcf,'hypb2d_mu_point50_sat_sig_point50_N2000_R50.eps','epsc2');
% 






R = 50;
dx = R/N;

x = [-R:dx:R];
y = [-R:dx:R];
[X,Y] = meshgrid(x,y);


u = solit2dhypb_saturated_graph(.50,R,N,0,2);
% v = solit1d(5,R,N,0);

M = 2*N+1;
A = floor(M/3);
B = floor(2*M/3);
% A = 1;
% B = M;

% Plot the curves
mesh(X(A:B,A:B), Y(A:B,A:B), u(A:B,A:B));
shading interp;
xlim([-7,7]);
ylim([-7,7]);
set(gca, 'fontsize',16);

% Annotate the figure
xlabel('x','Interpreter', 'Latex');
ylabel('y','Interpreter', 'Latex');
zlabel('u','Interpreter', 'Latex');
%lgnd = legend('Finite Element', 'FFT');
%set(lgnd,'interpreter','latex');
title('Hyperbolic Soliton: $\mu = 0.50$, $ \sigma = 2.0$','interpreter','latex');

% Save figure, note the argument 'epsc2', which saves color information
% saveas(gcf,'hypb2d_mu_point50_sat_sig_2_N2000_R50.eps','epsc2');
% 
