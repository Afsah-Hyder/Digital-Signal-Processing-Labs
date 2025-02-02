function bitpattern = decimalToTwosComplement(x, Nint, Nfrac)
    % Ensure x fits within the given bit allocation
    B = Nint + Nfrac; 

    % Step 1: Convert Integer Part (Two's Complement Handling)
    if x>0
        intPart = floor(x);  % Extract integer part
        fracPart = abs(x - intPart);  % Extract fractional part
    else
        intPart = ceil(x);  % Extract integer part
        fracPart = abs(x - intPart);  % Extract fractional part
    end

    % Convert integer part to binary (two's complement for negatives)
    if intPart < 0
        intBinary = dec2bin(mod(intPart, 2^Nint), Nint); % Handle negative numbers
    else
        intBinary = dec2bin(intPart, Nint);
    end

    % Step 2: Convert Fractional Part using repeated multiplication
    fracBinary = repmat('0', 1, Nfrac); % Preallocate for efficiency
    for i = 1:Nfrac
        fracPart = fracPart * 2;
        if fracPart >= 1
            fracBinary(i) = '1';
            fracPart = fracPart - 1;
        end
    end

    % Step 3: Combine Integer and Fractional Parts (No Decimal Point)
    bitpattern = strcat(intBinary, fracBinary);
end

