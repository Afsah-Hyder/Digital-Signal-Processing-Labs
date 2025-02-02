function bitTable = activty4(xQ, B)
    % Initialize the output matrix for bit patterns
    bitpatterns = zeros(length(xQ), B);
    
    for k = 1:length(xQ)  % Loop over each quantized value
        realNumber = abs(xQ(k));  
        b = zeros(1, B);  % Initialize bit array for this value

        % Convert to binary representation
        for i = 2:B  % Start from index 2
            realNumber = 2 * realNumber;
            if realNumber >= 1
                realNumber = realNumber - 1;
                b(i) = 1;
            else
                b(i) = 0;
            end
        end

        % Handle negative values (two's complement approach)
        if xQ(k) < 0
            b = not(b);  % Invert bits
            b(1) = 1;    % Set the first bit to indicate negativity
        end
        
        % Store the bit pattern
        bitpatterns(k, :) = b;
    end

    % Convert binary patterns to string format
    binaryStrings = arrayfun(@(row) sprintf('%d', bitpatterns(row, :)), 1:size(bitpatterns, 1), 'UniformOutput', false);

    % Create a table
    bitTable = table(xQ(:), binaryStrings(:), 'VariableNames', {'Quantized_Value', 'Binary_Bits'});

    % Display the table
    % disp(bitTable);
end
