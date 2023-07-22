%% 4)	At ?????? = 19?? & GOS= 2%,
%% (i)	Plot the number of cells versus user density (100 to 2000 ?????/??2 ). 
%% (ii)	Plot the cell radius versus user density (100 to 2000 ?????/??2 ).
clear;
clc;
userDensity=100:100:2000;
cityArea=100;
SIRmin=19;
Au=0.025;
n=4;
S=340;
GOS = 0.02;
[N1] = calClusterSize(6,SIRmin,n);
[N2] = calClusterSize(2,SIRmin,n);
[N3] = calClusterSize(1,SIRmin,n); 
[trafficIntensityPerSector1,trafficIntensityPerCell1] = calTrafficIntensity(S,N1,GOS,1);
[trafficIntensityPerSector2,trafficIntensityPerCell2] = calTrafficIntensity(S,N2,GOS,3);
[trafficIntensityPerSector3,trafficIntensityPerCell3] = calTrafficIntensity(S,N3,GOS,6);
k=1;
for i=100:100:2000
    [numCells1(k)] = calNumCells(Au,trafficIntensityPerCell1,i,cityArea);
    [numCells2(k)] = calNumCells(Au,trafficIntensityPerCell2,i,cityArea);
    [numCells3(k)] = calNumCells(Au,trafficIntensityPerCell3,i,cityArea);
    k = k + 1;
end
for i= 1:length(userDensity)
[cellRadius1(i)] = calCellRadius(cityArea,numCells1(i));
[cellRadius2(i)] = calCellRadius(cityArea,numCells2(i));
[cellRadius3(i)] = calCellRadius(cityArea,numCells3(i));
end
figure
plot(userDensity,numCells1,userDensity,numCells2,userDensity,numCells3)
title('the number of cells  VS user Density  ');
legend('omnidirectional','3-sector','6-sector')
xlabel("user Density");
ylabel("the number of cells");
figure
plot(userDensity,cellRadius1,userDensity,cellRadius2,userDensity,cellRadius3)
title('the cell radius  VS user Density  ');
legend('omnidirectional','3-sector','6-sector')
xlabel("user Density");
ylabel("the cell radius");