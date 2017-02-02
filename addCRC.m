function [ output ] = addCRC( data, crcPoly )
% 
% 
% 

    cat(2, data, zeros(1, length(crcPoly) - 1))
    rem = calcReminder(data, crcPoly);
    
    output = cat(2, data, rem(length(data):end));
end
