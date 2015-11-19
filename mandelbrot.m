% Homework Program 4
%
% Name: Kleyner, Pavel 
% Section: 23 
% Date: 10/20/2015

function [EscTime,Image]=mandelbrot(limits,nx,ny,max_esctime)

%Sets default variable values
if ~exist('limits','var')||isempty(limits)
    limits=[-2.0 0.5 -1.2 1.2];
end

if ~exist('nx','var')||isempty(nx)
    nx=1000;
end

if ~exist('ny','var')||isempty(ny)
    ny=1000;
end

if ~exist('max_esctime','var')||isempty(max_esctime)
    max_esctime=1000;    
end

%Create array of C values
x=linspace(limits(1),limits(2),nx);
y=linspace(limits(4),limits(3),ny);
[X,Y]=meshgrid(x,y);
C=X+1i*Y;

%Initialize EscTime
EscTime=zeros(ny,nx);

%Creates done array
done=false(ny,nx);

new=zeros(ny,nx);

%loop variable
k=1:max_esctime;

Z=zeros(size(C));

for ii=k
    Z=Z.^2+C;
    
    logic=abs(Z)>2;
    new(logic)=1;
    
    new_logical=logical(new)&~logical(done);
    EscTime(new_logical)=ii;
    
    done(new_logical)=1;
end
EscTime(EscTime==0)=max_esctime;
%histogram method for assigning colors to escape times
%
cdf=cumsum(hist(EscTime(:),1:max_esctime));
color_map=jet(ny*nx);
color_map(end,:)=0;
Image=zeros(ny,nx,3);
for ii=1:ny
    for jj=1:nx
        Image(ii,jj,:)=color_map(cdf(EscTime(ii,jj)),:);
    end
end
imshow(Image,'XData',x,'YData',y);
set(gca,'YDir','normal');
axis on;