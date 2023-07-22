%% 	3)	At ?????? = 14?? & user density= 1400 ?????/??2 
%% (i)	Plot the number of cells versus GOS (1% to 30%). 
%% (ii)	Plot the traffic intensity per cell versus GOS (1% to 30%).
clear;
clc;
userDensity=1400;
cityArea=100;
SIRmin=14;
Au=0.025;
n=4;
S=340;
GOS = 0.01:0.01:0.3;
[N1] = calClusterSize(6,SIRmin,n);
[N2] = calClusterSize(2,SIRmin,n);
[N3] = calClusterSize(1,SIRmin,n); 
k=1;
for i=0.01:0.01:0.3
    [trafficIntensityPerSector1(k),trafficIntensityPerCell1(k)] = calTrafficIntensity(S,N1,i,1);
    [trafficIntensityPerSector2(k),trafficIntensityPerCell2(k)] = calTrafficIntensity(S,N2,i,3);
    [trafficIntensityPerSector3(k),trafficIntensityPerCell3(k)] = calTrafficIntensity(S,N3,i,6);
    k = k + 1;
end
for i=1:length(GOS)
    [numCells1(i)] = calNumCells(Au,trafficIntensityPerCell1(i),userDensity,cityArea);
    [numCells2(i)] = calNumCells(Au,trafficIntensityPerCell2(i),userDensity,cityArea);
    [numCells3(i)] = calNumCells(Au,trafficIntensityPerCell3(i),userDensity,cityArea);
end
figure
plot(GOS,numCells1,GOS,numCells2,GOS,numCells3)
title('number of cells VS GOS ( with SIRmin=14 dB) ');
legend('omnidirectional','3-sector','6-sector')
xlabel("GOS");
ylabel("number of cell");
figure
plot(GOS,trafficIntensityPerCell1,GOS,trafficIntensityPerCell2,GOS,trafficIntensityPerCell3)
title('Traffic Intenisty per cell VS GOS ( with SIRmin=14 dB) ');
legend('omnidirectional','3-sector','6-sector')
xlabel("GOS");
ylabel("Traffic Intenisty per cell");