function [basis,coords] = find_coords(A)
% Given a matrix A, find a basis for the column space and write the
% coordinates of all the columns in terms of these basis vectors.

% Find sizes and pivots.
[m,n] = size(A);
[R,pivots] = rref(A);
p = length(pivots);

% *Preallocate a vector of zeros to contain the basis vectors for Col(A).*
basis = zeros(m,p);
for ii = 1:p
    % *Create a random vector of weights to make a linear combination of
    % the pivot columns of A.  Store this linear combination in the current
    % column of the basis matrix.*
    basis(:,ii)= rand(m,1).*A(:,ii);
   
end

% *Preallocate a vector of zeros to contain the coordinates of the columns
% of A in terms of the new basis.*
coords = zeros(p,n);
for ii = 1:n
    % *Fill in the coords matrix with the coordinates for the columns of
    % A.*
    coords(:,ii)=basis\A(:,ii);
end


%%% PLOTTING COMMANDS (DO NOT CHANGE).
if m == 2
    figure;
    plot(0,0,'b*','LineWidth',4,'MarkerSize',12)
    hold on;
    axis equal
    all_vecs = [A basis];
    max_dim = max(max(abs(all_vecs)));
    xlim([-max_dim max_dim])
    ylim([-max_dim max_dim])
    xlabel('x1','FontSize',14)
    ylabel('x2','FontSize',14)
    title('Coordinates','FontSize',16)

    for ii = 1:p
        quiver(0,0,basis(1,ii),basis(2,ii),1.0,'LineWidth',5,'MaxHeadSize',.5,'Color',[1 0 0]);
        text(basis(1,ii),basis(2,ii),sprintf('b%d',ii),'FontSize',20);
    end
    
    for ii = 1:n
        quiver(0,0,A(1,ii),A(2,ii),1.0,'LineWidth',5,'MaxHeadSize',.5,'Color',[0 1 0]);
        if p == 2
            text(A(1,ii),A(2,ii),sprintf('(%.2f,%.2f)',coords(1,ii),coords(2,ii)),'FontSize',14);
        elseif p == 1
            text(A(1,ii),A(2,ii),sprintf('(%.2f)',coords(1,ii)),'FontSize',14);
        end
    end
end

if m == 3
    figure; hold on;
    view([-37.5,30]);
    scatter3(0,0,0,'b*','LineWidth',3);
    axis equal
    all_vecs = [A basis];
    max_dim = max(max(abs(all_vecs)));
    xlim([-max_dim max_dim])
    ylim([-max_dim max_dim])
    zlim([-max_dim max_dim])
    xlabel('x1','FontSize',14)
    ylabel('x2','FontSize',14)
    zlabel('x3','FontSize',14)
    title('Coordinates','FontSize',16)
    
    for ii = 1:p
        quiver3(0,0,0,basis(1,ii),basis(2,ii),basis(3,ii),1.0,'LineWidth',3,'MaxHeadSize',.5,'Color',[1 0 0]);
        text(basis(1,ii),basis(2,ii),basis(3,ii),sprintf('b%d',ii),'FontSize',20);
    end
    
    for ii = 1:n
        quiver3(0,0,0,A(1,ii),A(2,ii),A(3,ii),1.0,'LineWidth',5,'MaxHeadSize',.5,'Color',[0 1 0]);
        if p == 3
            text(A(1,ii),A(2,ii),A(3,ii),sprintf('(%.2f,%.2f,%.2f)',coords(1,ii),coords(2,ii),coords(3,ii)),'FontSize',14);
        elseif p == 2
            text(A(1,ii),A(2,ii),A(3,ii),sprintf('(%.2f,%.2f)',coords(1,ii),coords(2,ii)),'FontSize',14);
        elseif p == 1
            text(A(1,ii),A(2,ii),A(3,ii),sprintf('(%.2f)',coords(1,ii)),'FontSize',14);
        end
    end
end


%%%
%%% Test Cases
%%%
% 1) A = randi([-10 10],2,6);
% Dimension of Col Space is 2
% basis = 
%     4.0968    6.4204
%    -2.7486   -1.4292

% coords =
%     1.8739    1.8739    0.5426    3.4496    0.3021   -3.4477
%    -0.1055   -0.1055    1.0556   -3.1357    0.1188    1.7327

% 2) A = randi([-10 10],3,6);
% Dimension of Col Space is 3
% basis =
%     0.8282    0.6541    0.4505
%     3.0099   -6.2029    0.5029
%    -0.7889   -6.7334    2.0608

% coords =
%     3.3395   -0.0821    0.3232   -2.8874   -3.6375    1.5246
%     1.0883    1.4344   -0.6072   -2.3008   -2.2715    2.0016
%     3.3787    0.2881    2.5070   -9.1082  -12.2110    7.6088

% 3) A = [-2 -2;1 3;0 4];
%Dimension of Col Space is 2
% basis =
%    -1.8267   -1.0767
%     0.1524    2.9884
%          0    0.3127

% coords =
%     0.9279    0.4201
%     0.2841    1.1143

% 4) A = [-1 3 -1 -6 -1 1;3 -9 4 21 2 -5;2 -6 4 18 0 -6];
% Dimension of Col Space is 2
% basis =
%    -0.8687    0.7796
%     0.2533   -7.2006
%     0.7996   -2.5885

% coords =
%     0.9941   -2.9823    1.8051    8.3975    0.1831   -2.6160
%    -0.3890    1.1671   -0.5356   -2.7740   -0.2425    0.6822

% 5) A = [1 -1 3 2;2 -2 6 4];
% Dimension of Col Space is 1
% basis =
%     0.9106
%     0.3637

% coords =
%     1.7035   -1.7035    5.1106    3.4071

