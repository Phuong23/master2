irisSet = importData('iris.data', 5);
sum = [0;0;0];
for i = 1 : 100
    a = dataset(irisSet, kmoyenne(irisSet.data, 3));
    a
    sum = sum + [getsize(seldat(a, 1), 1); getsize(seldat(a, 2), 1);  getsize(seldat(a, 3), 1)];
end
sum / 100
% kmoyenne([0; 1; 2; 3; 4; 5], 2);