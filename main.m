clc;
clf;

% Create data to send
% data = round(rand(1,1000));
data = [0 1 1 0 1 1 0 1];

% Select polynomial 
% poly = [1 0 1 1]; 
% poly = hexToBinaryVector('0x19'); % 5 bit
% poly = hexToBinaryVector('0x1D'); % 8 bit
% poly = hexToBinaryVector('0x1021'); % 16 bit
poly = hexToBinaryVector('0x04C11DB7'); % 32 bit

% Create codeword to send through channel
codeword = addCRC(data, poly);

% Sending through channel...

% Check if error occured
recieved = calcReminder(codeword, poly);
error = max(recieved) % Checks if any ones in vector
