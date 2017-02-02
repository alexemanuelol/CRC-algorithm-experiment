function [ data ] = calcReminder( data, crcPoly )
%CALCREMINDER Summary of this function goes here
%   Detailed explanation goes here


for i=1:length(data)-(length(crcPoly)-1)
    if data(i) == 1
        for j=1:length(crcPoly)
            if crcPoly(j) == 1
                data(i+j-1) = xor(data(i+j-1), 1);
            end
        end
    end
end


end

