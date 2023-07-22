%% PART B
%% 1)Plot the cluster size versus ?????? with range from 1?? ?? 30 ??.
clear;
clc;
SIRmin = 1:1:30;
n=4;
for i=1:1:30
    [N1(i)]=calClusterSize(6,i,n);
    [N2(i)]=calClusterSize(2,i,n);
    [N3(i)]=calClusterSize(1,i,n);
end
plot(SIRmin,N1,SIRmin,N2,SIRmin,N3) 
title('Cluster size VS SIRmin');
xlabel("SIR IN dB");
legend('omnidirectional','3-sector','6-sector')
ylabel("cluster size");