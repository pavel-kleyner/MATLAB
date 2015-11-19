%Homework Program 7
%
%Name: Kleyner, Pavel
%Section:23
%Date: 11/10/2015

function Vnew= transform_mesh(A,V,T,C)

% TRANSFORM_MESH Applies transformation to shape.
%   A transformation, given by matrix A, is applied to shape 
%   denoted by corresponding vertices and triangles matrices
%   Optional argument matrix C denotes color map


%Checks if A is valid
if ismatrix(A)==0 && size(A,1)~=3 && size(A,2)~=3
    error('A is invalid')
end

%Checks if V is valid
if ismatrix(V)==0 && size(V,2)~=3
    error('V is invalid')
end

%Checks if T is valid
if ismatrix(T)==0 && (size(T,2)~=3 || size(T,2)~=4)
    error('T is invalid')
end

if nargin==4
    %Checks if C is valid
    if ismatrix(C)==0 && size(C,2)~=3
        error('C is invalid')
    end
end

%Applies transformation given by A to each vertex in V
for ii=1:size(V,1)
    vertex=V(ii,:)';
    
    new_vertex=A*vertex;
    
    Vnew(ii,:)=new_vertex;
end

%Plot the new and original meshes
if nargin <4
    %User did not provide specific colors
    trisurf(T(:,1:3),Vnew(:,1),Vnew(:,2),Vnew(:,3));
    hold on
    trisurf(T(:,1:3),V(:,1),V(:,2),V(:,3), ...
        'EdgeColor','none','FaceAlpha',0.2);
    hold off
else
    %User provided specific colors
    trisurf(T(:,1:3),Vnew(:,1),Vnew(:,2),Vnew(:,3),T(:,4));
    hold on
    trisurf(T(:,1:3),V(:,1),V(:,2),V(:,3),T(:,4),...
        'EdgeColor','none','FaceAlpha',0.2);
    hold off
    colormap(C);
end


    

    
end

%Transformation Matrix Outputs
% A_rot =
% 
%     0.8047   -0.3106    0.5059
%     0.5059    0.8047   -0.3106
%    -0.3106    0.5059    0.8047
% 
% A_proj =
% 
%      1     0     0
%      0     1     0
%      0     0     0
% 
% A_refl =
% 
%     -1     0     0
%      0     1     0
%      0     0     1

% A =
% 
%    -0.8047    0.3106   -0.5059
%     0.5059    0.8047   -0.3106
%          0         0         0
% 
% B =
% 
%    -0.8047   -0.3106         0
%    -0.5059    0.8047         0
%     0.3106    0.5059         0









    
    
    
    
    

