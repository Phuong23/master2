appr = dataset([1.0:10.0]', genlab(5, char('a', 'b')));
test = [1.5 2.5 3.5 4.5 5.5 6.5 7.5 8.5 9.5 10.5]';
final = dataset([appr; test], [getlab(appr); knn_labs(appr, test)]);    
