clc;
clf;


error           = 0;    % Errors so far
insertedErrors  = 1;    % Bits to flip
cycles          = 100;  % cycles to iterate

% Create data to send
data = round(rand(1,5000));
% data = [0 1 1 0 1 1 0 1];

% Select polynomial 
% poly = [1 0 1 1]; 
% poly = hexToBinaryVector('0x19') % 5 bit
% poly = hexToBinaryVector('0x09') % 7 bit
% poly = hexToBinaryVector('0x1D') % 8 bit
% poly = hexToBinaryVector('0x1021') % 16 bit
% poly = hexToBinaryVector('0x04C11DB7'); % 32 bit
% poly = [1 0 1 1 1 0 1 0 0 0 0 0 1 1 0 1 1 1 0 0 0 1 1 0 0 1 1 0 1 0 1 1];
poly = hexToBinaryVector('0x42F0E1EBA9EA369'); % 64 bit

for i=1:cycles
    % Create codeword to send through channel
    codeword = addCRC(data, poly);

    % Sending through channel...
    codeword = flipBits(codeword, insertedErrors);

    % Check if error occured
    recieved = calcReminder(codeword, poly);
    
    % Checks if any ones in vector 
    error = error + max(recieved); 
end


% Prints the number of cycles, inserted errors and found errors
cycles 
polyLength = length(poly)
dataLength = length(data)
insertedErrors
error