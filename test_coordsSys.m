
clear all
close all

load('D:\Scodato_SSF_2018\Projects\SandwichBeachCam\extrinsic_calibration\gcp_surveys\2016-03-30_webcam_extrinsic_calibration\EastingNorthing_GCP_mat\gcpSandwich2016_master.mat')
addpath(genpath('D:\Scodato_SSF_2018\Source Code\Coordinate-System-Code'))

E=[gcp.x];
N=[gcp.y];


for ii= 1 : length(gcp)
    [gcp(ii).x, gcp(ii).y]=coordSys_sandwich(E(ii),N(ii));
end


save('D:\Scodato_SSF_2018\Projects\SandwichBeachCam\extrinsic_calibration\gcp_surveys\2016-03-30_webcam_extrinsic_calibration\gcpSandwich2016_masterLocal98_CP6.mat')

return

E= [376483.17, 376817.58]';

N= [4625188.57, 4624932.25]';

[X(1),Y(1)]=coordSys_sandwich(E(1),N(1))
[X(2),Y(2)]=coordSys_sandwich(E(2),N(2))

figure(1)
subplot(2,1,1)
hold on

plot(E, N)
 
subplot(2,1,2)

plot(X,Y, 'r')
hold on
axis([-50 50 0 400])


return
for theta=[95:1:100]
    
%theta = (90-16);% = mean([theta_c1,theta_c2]);
%theta=0+90;
%***origin determined as mean (RTK) camera position measured 4/19/18
E0 = 376523.828; %origin, E   
N0 = 4625139.430; %origin, N

[X,Y] = xyRotate(E,N,theta);


figure(10)
subplot(2,1,1)
hold on

plot(E, N)
 
subplot(2,1,2)

plot(X,Y, 'r')
hold on

end

%[X,Y] = xyRotate([-10:10],[-10:10],45,0,0);
%}
