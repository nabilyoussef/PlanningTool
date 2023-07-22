clear;
clc;
%% Get the input parameters
GOS = input('Enter the GOS(in decimal): ');
cityArea = input('Enter the city area (in km^2): ');
userDensity = input('Enter the user density (in users/km^2): ');
SIRmin = input('Enter the SIRmin (in dB): ');
sectorizationMethod = input('Enter the sectorization method (1 for omnidirectional, 2 for 3-sector, 3 for 6-sector): ');
if sectorizationMethod == 1
	i = 6; % numInterferers
    numSectors=1;
elseif sectorizationMethod == 2
	i = 2;
    numSectors=3;
elseif sectorizationMethod == 3
	i = 1;
    numSectors=6;
else disp('Wrong')
end
%% Givens
S = 340; %numChannels
f = 900; % band 900 MHz
BS = 20; % heightBaseStation
MS = 1.5; % heightMobileStation
Au = 0.025; %  the traffic intensity per user equals 0.025 Erlang
n = 4; %  the path loss exponent equals 4
MS_Sensitivity = -95; % MS sensitivity equals -95 dBm
%% Calculate the cluster size (N)
clusterSize =calClusterSize(i,SIRmin,n);
%% Calculate Traffic  intensity of Cell & Sector
[trafficIntensityPerSector,trafficIntensityPerCell] = calTrafficIntensity(S,clusterSize,GOS,numSectors);
%% Calculate the number of cells
[numCells] = calNumCells(Au,trafficIntensityPerCell,userDensity,cityArea);
%% Calculate the cell radius (R)
[cellRadius] = calCellRadius(cityArea,numCells);
%% Calculate the base station transmitted power
HataCh = 0.8+(((1.1*log10(f))-0.7)*MS - 1.56*log10(f)) ;
pathLoss = 69.55+(26.16*log10(f))-(13.82*log10(BS))-HataCh+((44.9-6.55*log10(BS))*log10(cellRadius)) ; % power loss
Ptx = MS_Sensitivity + pathLoss ;            %in dBm
%% Plot the MS received power in dBm versus the receiver distance from the BS
figure;
distance = cellRadius/100:0.01:cellRadius;
pathLoss2 = 69.55+(26.16*log10(f))-(13.82*log10(BS))-HataCh+((44.9-6.55*log10(BS))*log10(distance)) ;
receivedPower = Ptx - pathLoss2; % Prx dBm 
plot(distance, receivedPower, 'b')
xlabel('Receiver distance (Km)');
ylabel('Received power (dBm)');
title('MS received power versus receiver distance');
%% Display the results
fprintf('The cluster size is %d\n',clusterSize);
fprintf('The number of cells is %4.2f\n',numCells);
fprintf('The cell radius is %4.2f km\n',cellRadius);
fprintf('The traffic intensity per cell is %4.2f Erlang\n',trafficIntensityPerCell);
fprintf('The traffic intensity per sector is %4.2f Erlang\n',trafficIntensityPerSector);
fprintf('The Base station transmitted power is %4.2f dBm\n',Ptx);