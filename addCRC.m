function [ output ] = addCRC( data, crcPoly )
% Adds n zeros to the data vector where n is the length of
% crcPoly - 1. Then concatenates the reminder of the division 
% with the zeroed data vector. 

    zeroedData = cat(2, data, zeros(1, length(crcPoly) - 1));
    rem = calcReminder(zeroedData, crcPoly);
    output = cat(2, data, rem(length(data) + 1:end));
end
