function [yp] = dft_based_conv(x, h)
    % Input:
    % x - Input sequence
    % h - Impulse response of the system
    % Output:
    % yp - Convolved output sequence

    % Step 1: Determine lengths of input sequences
    Nx = length(x); % Length of input sequence x
    Nh = length(h); % Length of impulse response h
    Ny = Nx + Nh - 1; % Length of the convolution result

    % Step 2: Zero-padding the sequences to match the length Ny
    hp = [h zeros(1, Ny - Nh)]; % Zero-pad h to make its length Ny
    xp = [x zeros(1, Ny - Nx)]; % Zero-pad x to make its length Ny

    % Step 3: Compute the DFT (Discrete Fourier Transform) of both sequences
    Xp = fft(xp, Ny); % DFT of zero-padded x
    Hp = fft(hp, Ny); % DFT of zero-padded h

    % Step 4: Multiply the DFTs to perform the convolution in the frequency domain
    Yp = Xp .* Hp;

    % Step 5: Compute the inverse DFT to get the convolved sequence in the time domain
    yp = ifft(Yp, Ny);

    % Step 6: Plot the magnitude of the convolved output
    N_arr = 0:Ny-1; % Time indices for the output sequence
    stem(N_arr, abs(yp), 'filled') % Plot the magnitude of the output
    xlim([0 Ny]) % Set x-axis limits
    ylim([0 abs(max(yp))]) % Set y-axis limits based on the maximum value
    xlabel("n") % Label for x-axis
    ylabel("y[n]") % Label for y-axis
    title("DFT based convolution") % Title of the plot
    grid on % Display grid on the plot for better readability
end
