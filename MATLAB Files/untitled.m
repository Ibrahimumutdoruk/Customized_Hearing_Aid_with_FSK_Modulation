% Input: binary_data (Nx1 column vector, where N is a multiple of 16)
binary_data = [0;0;0;0;0;0;0;0;0;0;1;1;1;1;0;0;0;0;0;0;0;0;0;0;0;0;1;1;1;1;0;0;0;0;0;0;0;0;0;0;0;0;1;1;1;1;0;0;0;0;0;0;0;0;0;0;0;0;1;1;1;1;0;0;0;0;0;0;0;0;0;0;0;0;1;1;1;1;0;0;0;0;0;0;0;0;0;0;0;0;1;1;1;1;0;0;0;0;0;0;0;0;0;0;0;0;1;1;1;1;0;0]; % Example data (16x1)

% --- Step 2: Reshape into 16-bit groups (Mx16 matrix) ---
binary_matrix = reshape(binary_data, 16, [])'; % Transpose to get Mx16

% --- Step 3: Convert each 16-bit row to decimal (big-endian) ---
decimal_values = zeros(size(binary_matrix, 1), 1); % Preallocate output

for i = 1:size(binary_matrix, 1)
    % Get the 16 bits for the current sample (no flipping)
    bits = binary_matrix(i, :);
    
    % Convert binary to decimal (weights: 2^15 to 2^0)
    dec = sum(bits .* (2.^(15:-1:0)));
    
    % Optional: Handle signed 16-bit integers (if needed)
    if dec >= 32768
        dec = dec - 65536; % Convert to negative
    end
    
    decimal_values(i) = dec;
end

% --- Step 4: Output the result ---
final_output = decimal_values; % For the example, this will be [60]

disp('Decimal values:');
disp(final_output);