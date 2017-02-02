function [ data ] = calcReminder( data, crcPoly )
% This function divides data with cecPoly.
% Returns the reminder of the division.
% Both data and crc Poly are polynomials.


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

