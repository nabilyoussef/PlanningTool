function [cellRadius] = calCellRadius(cityArea,numCells)
cellArea = cityArea / numCells;
cellRadius = sqrt(cellArea / (1.5*sqrt(3)));
end

