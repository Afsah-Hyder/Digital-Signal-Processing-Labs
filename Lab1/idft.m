function [result] = idft(X, N)
    % Input:
    % X - DFT coefficients (frequency domain representation)
    % N - Number of points in the IDFT
    % Output:
    % result - Reconstructed signal in the time domain

    % Step 1: Initialize the result array with zeros
    result = zeros(1, N); % Preallocate array to store the time-domain signal
    N_arr = 0:N-1; % Array of indices for time samples

    % Step 2: Compute the IDFT using the summation formula
    for n = 0:N-1 % Iterate over each time index
        for k = 0:N-1 % Iterate over each frequency bin
            % Compute the contribution of each frequency component to the n-th time sample
            result(n+1) = result(n+1) + X(k+1) * exp(1i * 2 * pi * k * n / N);
        end
        % Normalize by the number of points N to complete the inverse transformation
        result(n+1) = result(n+1) / N;
    end

    % Step 3: Plot the magnitude of the reconstructed signal
    stem(N_arr, abs(result), 'filled') % Plot the magnitude of the result
    xlim([0 N-1]) % Set x-axis limits
    ylim([0 abs(max(result))]) % Set y-axis limits based on the maximum value
    xlabel("n") % Label for x-axis (time index)
    ylabel("x[n]") % Label for y-axis (magnitude of reconstructed signal)
    title("Inverse DFT") % Title of the plot
    grid on % Enable grid for better visualization

end
