function xQ = twosComplementToDecimal(binary_str)
    % binary_str is a string representing the Two's complement binary number
    B = length(binary_str); 
    MSB = str2double(binary_str(1));  % (MSB)
    
    % If MSB is 0 (positive number), calculate the quantized value directly
    if MSB == 0
        xQ = 0;  
        for i = 2:B % from 2nd index to end
            xQ = xQ + str2double(binary_str(i)) * 2^(-i+1);  
        end
    else
        % If MSB is 1 (negative number), find the Two's complement representation
        inverted_str = binary_str(2:end);
        inverted_str = char('1' - inverted_str + '0');  % Flip bits

        % Add 1 to the inverted binary string
        inverted_str_num = dec2bin(bin2dec(inverted_str) + 1)
        if length(inverted_str_num) > B-1
            inverted_str_num = inverted_str_num(2:end)
        end
        % inverted_str = dec2bin(inverted_str_num, B-1)  % Ensure the result has B-1 bits
        
        % calculate the decimal value for the negative number
        xQ = 0;
        for i = 1:B-1
            xQ = xQ + str2double(inverted_str_num(i)) * 2^(-i-1);  % Add each bit's contribution
        end
        xQ = -2 * xQ;
    end
end
