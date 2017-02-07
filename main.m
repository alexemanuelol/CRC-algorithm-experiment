clc;
clf;

format LONG

insertedErrors  = 10;     % Bits to flip
error           = zeros(1,insertedErrors + 1);    % Num of recognized faulty data strings
errorPercent    = zeros(1,insertedErrors + 1);    % Errors so far
cycles          = 100000;   % cycles to iterate
dataLength      = 2000;   % Bits to send

% Create data to send
data = round(rand(1,dataLength));
% data = [0 1 1 0 1 1 0 1];

% Select polynomial  
% poly = [1 0 0 1 1]; % CRC-4
% poly = [1 1 1 0 1 0 1 0 1]; % CRC-8
% poly = [1 1 0 0 0 0 0 0 0 0 0 0 0 0 1 0 1]; % CRC-16
% poly = [1 0 0 0 0 0 1 0 0 1 1 0 0 0 0 0 1 0 0 0 1 1 1 0 1 1 0 1 1 0 1 1 1]; % CRC-32


for j=1:insertedErrors + 1
    for i=1:cycles
        % Create codeword to send through channel
        codeword = addCRC(data, poly);

        % Sending through "noisy" channel...
        if (j > 1)
            codeword = flipBits(codeword, j - 1);
        end 
        
        % Check if error occured
        recieved = calcReminder(codeword, poly);

        % Checks if any ones in vector 
        error(j) = error(j) + max(recieved); 
    end
    clc
    j
end
clc

% Prints the number of cycles, inserted errors and found errors
cycles 
polyLength = length(poly)
dataLength
insertedErrors
error'

% Calculates the percentage
for i=2:insertedErrors + 1
    errorPercent(i) = 1 - error(i)/cycles;
end
errorPercent'
errorMean = mean(errorPercent(2:insertedErrors + 1))
polyRatio = 1 / (2^(polyLength - 1)) % How many percent that the polynome should be able to handle 

% Diagram
bar(0:length(error) - 1, error)
axis([-0.5 (insertedErrors+1) cycles*3/4 (cycles+cycles/10)])