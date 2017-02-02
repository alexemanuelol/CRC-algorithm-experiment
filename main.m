clc;
clf;
clear all;
% data = round(rand(1,1000));
data = [1 0 0 1 1 0 1 1]

polynome = [ 1 0 1 1 ]

codeword = cat(2, data, zeros(1, length(polynome) - 1))

