% Homework Program 6
%
% Name: Kleyner, Pavel 
% Section: 23 
% Date: 11/3/2015

function lin_combo(A)


%Check that matrix is not empty or just has one column
if size(A,2)<2
    error('This matrix is invalid')
end

[R,pivots]=rref(A);

if pivots==size(A,2)
    fprintf('Columns of A are linearly independent')
end

n=size(A,2);

for ii=1:n
    %makes copy of matrix A for functionality
    copy_A=A;
            
    %variable test_col holds column whose linear dependency is being tested
    test_col=copy_A(:,ii);

    %erases test_col from matrix A
    copy_A(:,ii)=[];

    aug_matrix=[copy_A test_col];

    indexes=[1:ii-1 ii+1:n ii];   

    [Row_red,pivot]=rref(aug_matrix);
    
    %Linear Independence check for Matrix with two columns
    if size(A,2)==2 && size(A,1)>size(A,2)
        if Row_red(2,end)==1&&Row_red(1,end)==0
            fprintf('a%i is not a linear combination of the rest\n',ii);
        else
            break
        end
    else
        %Check for linear independence of Matrix with more than two columns
    if Row_red(end,end)==1
        fprintf('a%i is not a linear combination of the rest\n',ii);

    else
        actual_pivots=indexes(pivot);

        fprintf('a%i = %.4f a%i',ii,Row_red(1,end),actual_pivots(1));

        for jj=2:length(actual_pivots)
            fprintf('+ %.4f a%i',Row_red(jj,end),actual_pivots(jj));
        end
    fprintf('\n')

    end
    end

    

    end
end


% Test Case 1
    % A=[1 2 3; 0 2 2; 1 4 5]';
    % lin_combo(A)
    % a1 = -1.0000 a2+ 1.0000 a3
    % a2 = -1.0000 a1+ 1.0000 a3
    % a3 = 1.0000 a1+ 1.0000 a2

% Test Case 2
    %A=[1 1 2 4 1; -2 -7 1 2 -2; 3 8 -4 -3 -2];
    % lin_combo(A)
    % a1 = 0.3333 a2+ -0.3333 a3+ 0.3333 a4
    % a2 = 3.0000 a1+ 1.0000 a3+ -1.0000 a4
    % a3 is not a linear combination of the rest
    % a4 is not a linear combination of the rest
    % a5 is not a linear combination of the rest
    
    %Two Different Subsets of Three Linearly Independent Columns:
    %First: a1 a3 a5
    %Second:a2 a4 a5
    


% Test Case 3
    % A=[1 0 1 -3 -2.5;2 0 5 -2 -1;-2 0 5 0 -1];
    % lin_combo(A)
    % a1 = 0.0000 a3+ -2.0000 a4+ 2.0000 a5
    % a2 = 0.0000 a1+ 0.0000 a3+ 0.0000 a4
    % a3 is not a linear combination of the rest
    % a4 is not a linear combination of the rest
    % a5 is not a linear combination of the rest

% Test Case 4
    % A=rand(5,2);
    % lin_combo(A)
    % a1 is not a linear combination of the rest
    % a2 is not a linear combination of the rest


% Test Case 5
    % A=rand(2,5);
    % lin_combo(A)
    % a1 = -1.1376 a2+ 1.5189 a3
    % a2 = -0.8791 a1+ 1.3352 a3
    % a3 = 0.6584 a1+ 0.7489 a2
    % a4 = 0.4839 a1+ 0.6166 a2
    % a5 = 1.1424 a1+ 0.0696 a2


