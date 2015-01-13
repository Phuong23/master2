function [ M ] = importData( dataPath, colLabels )
    data = load(dataPath);
    l = colLabels;
    c = size(data, 2);
    randData = data( randperm(size(data, 1)), :);
    M = dataset(randData(:, [1:l-1; l+1:c]), randData(:, l));
    [M];
end

