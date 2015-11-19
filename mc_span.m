% Homework Program 5 Part 1
%
% Name: Kleyner, Pavel 
% Section: 23 
% Date: 10/28/2015


function mc_span(A)

% Store the number of rows of "A" in a variable "m", and the number of 
% columns in the variable "n".
m=size(A,1);
n=size(A,2);


if m < 2 || m > 3
    % Create an error message telling the user that the vectors must be 2
    % or 3 dimensional.
    error('The vectors must be 2 or 3 dimensional')
end

num_points = 200;
% Initialize a matrix "b" of zeros with "m" rows and "num_points" columns.
b=zeros(m,num_points);

figure; hold on;
xlim([-2 2]);ylim([-2 2]);zlim([-2 2])
if m == 3
    view([-37.5,30]);
    scatter3(0,0,0,'go','LineWidth',3);
else
    plot(0,0,'go','LineWidth',3);
end
axis square
xlabel('x1');ylabel('x2');zlabel('x3')

for ii = 1:n
    if m == 3
        quiver3(0,0,0,A(1,ii),A(2,ii),A(3,ii),1.0,'LineWidth',3,'MaxHeadSize',.5,'Color',[1 0 0]);
    else
        quiver(0,0,A(1,ii),A(2,ii),1.0,'LineWidth',3,'MaxHeadSize',.5,'Color',[1 0 0]);
    end
end

ii = 1;
while ii<=num_points
    % Create a variable "r" that is a column vector of random numbers between
    % -50 and 50, with "n" entries.
    r=-50+100*rand(n,1);
    if abs(A*r) < 2*ones(m,1)
        % In the ii'th column of "b", store the linear combination of the
        % columns of "A" weighted by the values in "r".
        b(:,ii)=A*r;
        if m == 3
            scatter3(b(1,ii),b(2,ii),b(3,ii),'b*');
        else
            scatter(b(1,ii),b(2,ii),'b*');
        end
        pause(.01)
        % Increment the counter "ii" by 1.
        ii=ii+1;
    end
end



% Test Cases:
%   3D:
%   A = [1 3 2;0 0 0;-1 -2 -3]'; mc_span(A);
%   A plane in R3

%   A = [-2 2 4;-2 2 5;1 -1 -1]; mc_span(A);
%   A plane in R3

%   A = rand(3,3); mc_span(A);
%   All real numbers in R3

%   A = rand(3,2); mc_span(A);
%   A plane in R3

%   A = rand(3,1); mc_span(A);
%   A line in R3

%   r = rand(3,2); A = [r 2*r(:,1)]; mc_span(A);
%   A plane in R3
%
%   2D:
%   A = [1 -2 -1;-2 4 -1]; mc_span(A);
%   All of R2

%   A = [1 -2 .5;-2 4 -1]; mc_span(A);
%   A line in R2

%   A = rand(2,2); mc_span(A);
%   All of R2

%   A = rand(2,1); mc_span(A);
%   A line in R2

%   A = rand(2,5); mc_span(A);
%   All of R2
