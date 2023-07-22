function [clusterSize]=calClusterSize(i,SIRmin,n)
N=(1/3)*((i*10^(SIRmin/10))^(1/n)+1)^2; 
testValues =[1,3,4,7,9,12,13,16,19,21,25,27,28,31,36,37,39];
% check if N is acceptable value 
for i= 1:length(testValues)
    if testValues(i)> N
        clusterSize = testValues(i);
        break
    end
end
end