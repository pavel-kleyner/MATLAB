% Homework Program 1
%
% Name:      Kleyner, Pavel
% Section:   21
% Date:      9/27/2015


%Number one
fprintf('\nProblem %i:\n',1);
n=input('Please enter a size "n"');
p=input('Please enter a probability "p"');

%Number two
fprintf('\nProblem %i:\n',2);
adj_matrix=rand(n,n)<p & ~eye(n)

%Number three
fprintf('\nProblem %i:\n',3);
link_sums_matrix=repmat(sum(adj_matrix'),n,1);
hyperlink=adj_matrix./link_sums_matrix
hyperlink(isnan(hyperlink)|isinf(hyperlink))=0

%Number four
fprintf('\nProblem %i:\n',4)
d=0.9
%Identity Matrix
I=eye(n,n);
r=(I-d*hyperlink)\((1-d)*ones(n,1));
fprintf('Page %i: rank = %f\n',sortrows([(1:n)' r],-2)')

%Number five
fprintf('\nProblem %i\n',5)

fprintf('\nChanging d sometimes changes the rank order.\n')

% Problem 1:
% Please enter a size "n"6
% Please enter a probability "p"0.7
% 
% Problem 2:
% 
% adj_matrix =
% 
%      0     1     0     0     1     0
%      0     0     1     0     0     1
%      1     0     0     1     0     1
%      0     0     1     0     1     1
%      1     1     1     0     0     1
%      1     0     0     0     1     0
% 
% 
% Problem 3:
% 
% hyperlink =
% 
%          0    0.5000         0         0    0.2500         0
%          0         0    0.3333         0         0    0.5000
%     0.5000         0         0    0.3333         0    0.5000
%          0         0    0.3333         0    0.2500    0.5000
%     0.5000    0.5000    0.3333         0         0    0.5000
%     0.5000         0         0         0    0.2500         0
% 
% 
% hyperlink =
% 
%          0    0.5000         0         0    0.2500         0
%          0         0    0.3333         0         0    0.5000
%     0.5000         0         0    0.3333         0    0.5000
%          0         0    0.3333         0    0.2500    0.5000
%     0.5000    0.5000    0.3333         0         0    0.5000
%     0.5000         0         0         0    0.2500         0
% 
% 
% Problem 4:
% 
% d =
% 
%     0.9000
% 
% Page 5: rank = 1.591451
% Page 3: rank = 1.210097
% Page 4: rank = 1.196392
% Page 2: rank = 0.838316
% Page 1: rank = 0.835318
% Page 6: rank = 0.833970
% 
% Problem 5
% 
% Changing d sometimes changes the rank order.