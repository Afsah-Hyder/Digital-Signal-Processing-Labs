function [result] = fdft(x, N)
    % Input:
    % x - Input sequence
    % N - Number of points in the DFT
    % Output:
    % result - DFT of the input sequence x

    % Step 1: Initialize the result array with zeros
    result = zeros(1, N); % Preallocate array to store DFT results
    N_arr = 0:N-1; % Array of indices for frequency components

    % Step 2: Compute the DFT using the summation formula
    for k = 0:N-1 % Iterate over each frequency bin
        for n = 0:N-1 % Iterate over each time index
            % Compute the contribution of each sample to the k-th frequency component
            result(k+1) = result(k+1) + x(n+1) * exp(-1i * 2 * pi * k * n / N);
        end
    end

    % Step 3: Plot the magnitude of the DFT result
    stem(N_arr, abs(result), 'filled') % Plot the magnitude of the result
    xlim([0 N-1]) % Set x-axis limits
    ylim([0 abs(max(result))]) % Set y-axis limits based on the maximum value
    xlabel("k") % Label for x-axis (frequency bin index)
    ylabel("X[k]") % Label for y-axis (magnitude of DFT result)
    title("Forward DFT") % Title of the plot
    grid on % Enable grid for better visualization
end
