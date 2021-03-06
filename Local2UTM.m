addpath(genpath('D:\Scodato_SSF_2018\Source Code'))
addpath(genpath('D:\Scodato_SSF_2018\Source Code\UAV-Processing-Toolbox'))
addpath(genpath('D:\Scodato_SSF_2018\Source Code\Support-Routines'))


%%
%Enter the theta you are rotating your image
theta= -98.124752;

%x and y locations in local coordinates that you are converting to UTM
%coordinates
x=  [48.1] % -17.4 0.4 11.6 32.5 48.1]; 
y= [205.8] %112.1 135.5 150.1 179.6 205.8]; 

%Camera location in local coordinates
xo=0 ;
yo= 0;

%Calculate the offset based on the UTM camera coordinates 
E0 = 376523.828; %origin, E
N0= 4625139.430;  %origin, N

%Rotation and translation
A = [cosd(theta) sind(theta); -sind(theta) cosd(theta)];
%cos_example= cosd(theta)
%sin_example=sind(theta)
%sin_example2=sind(theta)*-1
out= [x(:)-xo y(:)-yo]*A;
E= E0+ out(1)
N= N0+out(2)

%  
% for i= 1:length(x)
%     out = [x(:)-xo y(:)-yo]*A
%     E(i, :)= E0+ out(1);
%     N(i, :)= N0+out(2);
% end
% 
% disp(E)
% disp(N)
