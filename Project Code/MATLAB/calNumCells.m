function [numCells] = calNumCells(Au,trafficIntensityPerCell,userDensity,cityArea)
UsersPerCell = trafficIntensityPerCell / Au; % total number users per cell
numCells = ceil((userDensity * cityArea) / UsersPerCell);
end

