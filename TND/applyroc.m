function [ A ] = applyroc( D )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

A = dataset([
roc(D, fisherc);
roc(D, qdc);
roc(D, udc);
roc(D, ldc);
roc(D, parzenc);
roc(D, knnc);
roc(D, treec);
roc(D, svc);
roc(D, lmnc)
], char('fisherc', 'qdc', 'udc', 'ldc', 'parzenc', 'knnc', 'treec', 'svc', 'lmnc'));
A = setfeatlab(A, char('TFP', 'TVP', 'time'));

end

