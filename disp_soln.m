% Homework Program 5 Part 2
%
% Name: Kleyner, Pavel 
% Section: 23 
% Date: 10/28/2015


function disp_soln(A,b)
% This function displays the solution set of the system of equations Ax=b

% Check that b is a column vector. If not, make it one.
if size(b,1)==1
    b=b';
end
% Create augmented matrix.
aug_matrix=[A b];
% Find reduced form and pivot positions.
pivots=zeros(size(A,2));
[R,pivots]=rref(aug_matrix);
% Check that system is consistent.
if pivots(end)==size(aug_matrix,2);
    error('System is not consistent')
end
% Go through each basic variable, and display it in terms of the free
% variables and constants.

for ii=1:length(pivots)
    fprintf('x%i = %.2f',pivots(ii),R(ii,end))
    for jj=(1+pivots(ii)):size(A,2)
        if R(ii,jj) ~= 0
            fprintf(' + %.2fx%i',-R(ii,jj), jj)
        end
    end
    fprintf('\n')

end
% Test Cases:
%   1) A = randi(10,4,6); b = randi(10,4,1); disp_soln(A,b);
%   2) A = randi(10,6,4); b = randi(10,6,1); disp_soln(A,b);
%   3) A = [1 3 9 -12 -2 5;-3 -8 -24 33 4 -12;-2 -8 -24 30 9 -17];
%      b = [2;-11;10];
%      disp_soln(A,b);
% Solution to Test Case 3
% x1 = 1.00 + 3.00x4
% x2 = 3.00 + -3.00x3 + 3.00x4 + -1.00x6
% x5 = 4.00 + 1.00x6