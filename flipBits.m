function [ data ] = flipBits( data, n )
% flipBits flips n number of bits in a binary vector.
    for i=1:n
        randBit = randi([1 length(data)],1,1);
        data(randBit) = xor(data(randBit), 1);
    end
end

