clc;
clf;

insertedErrors  = 10;    % Bits to flip
error           = zeros(1,insertedErrors + 1);    % Errors so far
cycles          = 100;  % cycles to iterate
dataLength      = 2000;
% Create data to send
data = round(rand(1,dataLength));
% data = [0 1 1 0 1 1 0 1];

% Select polynomial 
poly = [1 0 1 0 1 0 1];
% poly = [1 0 1 1]; 
% poly = hexToBinaryVector('0x19'); % 5 bit
% poly = hexToBinaryVector('0x09'); % 7 bit
% poly = hexToBinaryVector('0x1D'); % 8 bit
% poly = hexToBinaryVector('0x1021'); % 16 bit
% poly = hexToBinaryVector('0x04C11DB7'); % 32 bit
% poly = [1 0 1 1 1 0 1 0 0 0 0 0 1 1 0 1 1 1 0 0 0 1 1 0 0 1 1 0 1 0 1 1];
% poly = hexToBinaryVector('0x42F0E1EBA9EA369'); % 64 bit


for j=1:insertedErrors + 1
    for i=1:cycles
        % Create codeword to send through channel
        codeword = addCRC(data, poly);

        % Sending through "noisy" channel...
        codeword = flipBits(codeword, j - 1);

        % Check if error occured
        recieved = calcReminder(codeword, poly);

        % Checks if any ones in vector 
        error(j) = error(j) + max(recieved); 
    end
end

% Prints the number of cycles, inserted errors and found errors
cycles 
polyLength = length(poly)
dataLength
insertedErrors
error'

plot(0:length(error) - 1, error)
axis([0 (insertedErrors) 0 (cycles+ cycles/10)])