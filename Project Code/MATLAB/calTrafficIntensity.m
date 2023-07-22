function [trafficIntensityPerSector,trafficIntensityPerCell] = calTrafficIntensity(S,clusterSize,GOS,numSectors)
K =floor ( S / clusterSize); % numChannelsPerCell 28
C =floor( K / numSectors) ; % channels per sector 14
% to get Pr close value to GOS
for A=1:1000
    Pr= (A^C/factorial(C))/sum(A.^([0:C])./cumprod([0,0:C-1]+1));
%The probability of blocking is calculated using the Erlang B formula.
    if GOS<=Pr
     break
    end
end
Erlang = @(A1) (A1^C/factorial(C))/sum(A1.^([0:C])./cumprod([0,0:C-1]+1));
trafficIntensityPerSector = fzero(@(A1) Erlang(A1)-GOS, A);
%{
to find the value of A that minimizes the difference between the Erlang probability of blocking and the GOS.
 The value of A that is returned is the traffic intensity per sector.
%}
trafficIntensityPerCell=trafficIntensityPerSector*numSectors;

end

