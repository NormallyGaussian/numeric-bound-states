function sol = hat1dtest(mu,R,N,L)

format long;
dx = (R)/(N);
h = dx;
x = [-R:dx:R];

VN = N+1;

N = 2*N + 1;

%%%%%%%%%%%%%%
% Create potential matrix - delta function centered at zero
%%%%%%%%%%%%%%

vv1 = 0;
v1 = [];
for j = 1:N
    if j == VN
        vv1 = 1;
    end
    v1 = [v1; vv1];
    vv1 = 0;
end

V = spdiags([v1], 0, N, N)




% dd1 = 2/3*h;
% dd2 =  2/h;
% 
% %subdiagonals
% ss1 = h/6;
% ss2 =  -1/h;
% 
% d1 = [];
% s1 = [];
% 
% for j = 1:N
%     d1 = [d1 dd1];
% end
% 
% for j = 1:N
%     s1 = [s1 ss1];
% end
% %Take matrix transpose
% d1 = d1';
% s1 = s1';
% 
% % Define matrix A
% A = spdiags([s1 d1 s1], -1:1, N, N);