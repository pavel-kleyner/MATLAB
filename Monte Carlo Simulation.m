% Homework Program 2
%
% Name:      Kleyner, Pavel
% Section:   23
% Date:      9/27/2015

%Get Inputs
d=input('Please input a "d" value: ');
s=input('Please input a "s" value: ');
n=input('Please input a "n" value: ');


%Create Matrix A
A=randi(s,n,d);

rolls_first_col=A(:,1);

%Create Matrix B
B=A(:,2:d);

%Create Matrix C
C=repmat(rolls_first_col,1,d-1);

%Calculate Matrix D
D=B-C;

%Make Matrix E
E=zeros(size(D));
z=size(D);
length=z(1)*z(2);

%If the value of subtracted is zero, makes another matrix where the
%corresponding value is one
for index=1:length
   if D(index)==0
       E(index)=1;
   else
       E(index)=0;
   end
end

%Create Vector F
F=sum(E,2);

%Create tally and reps
[tally,reps]=hist(F,0:d-1);

%Find desired probabilities
probs=tally/n;

%Plot bar graph of results
bar(probs);
title(sprintf('%u Dice, %u Sides, %u Trials', d,s,n))
xlabel('Number of repititions')
ylabel('Probabilities')
ylim([0 1])

%Create a results matrix
results=[reps; probs]'

%Step 10
%         0    0.1339
%     1.0000    0.2847
%     2.0000    0.2841
%     3.0000    0.1863
%     4.0000    0.0748
%     5.0000    0.0273
%     6.0000    0.0076
%     7.0000    0.0013
%     8.0000         0
%     9.0000         0
%    10.0000         0
%    11.0000         0
%    12.0000         0
%    13.0000         0
%    14.0000         0
%    15.0000         0
%    16.0000         0
%    17.0000         0
%    18.0000         0
%    19.0000         0

% Step 11
%          0    0.1931
%     1.0000    0.3488
%     2.0000    0.2792
%     3.0000    0.1312
%     4.0000    0.0388
%     5.0000    0.0078
%     6.0000    0.0011
%     7.0000    0.0001
%     8.0000    0.0000
%     9.0000    0.0000