
% Parameters
Fs = 22050;                 % Sampling frequency (Hz)
duration = 1;               % Duration in seconds
tones = [50 100 200 500 800 1000 1600 2000 4000 6000 10000 12000 16000]; % Frequencies

%% 1. Generate multi-tone signal
t = 0:1/Fs:duration-1/Fs;   % Time vector
signal = zeros(size(t));

% Sum all tone signals
for f = tones
    signal = signal + sin(2*pi*f*t);
end

% Normalize to 16-bit signed integer range [-32768, 32767]
signal = signal/max(abs(signal)) * 32767;
audioData = int16(signal');

%% 2. Compute FFT
N = length(audioData);
fft_result = fft(double(audioData))/N;
fft_magnitude = abs(fft_result(1:N/2+1));
fft_magnitude(2:end-1) = 2*fft_magnitude(2:end-1); % Single-sided spectrum
frequencies = linspace(0, Fs/2, N/2+1);

%% 3. Plot time domain and frequency domain signals
figure;

% Time domain plot (first 200 samples)
subplot(2,1,1);
plot(t(1:200), audioData(1:200));
title('Time Domain Signal (First 200 Samples)');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% Frequency domain plot (0-20 kHz)
subplot(2,1,2);
plot(frequencies, fft_magnitude);
xlim([0 20000]); % 0-20 kHz range
title('Frequency Spectrum');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
grid on;

% Highlight the tone frequencies
hold on;
stem(tones, 0.5*max(fft_magnitude)*ones(size(tones)), 'r', 'Marker', 'o', 'LineStyle', 'none');
hold off;
legend('Spectrum', 'Tone Frequencies');

%% 4. Save data to files
output_folder = fullfile(getenv('USERPROFILE'), 'Desktop', 'Telecom_Umut_Output');
if ~exist(output_folder, 'dir')
    mkdir(output_folder);
end

% Save signal data
signal_file = fullfile(output_folder, 'multi_tone_signal.txt');
fid = fopen(signal_file, 'w');
fprintf(fid, '%d\n', audioData);
fclose(fid);

%% 5. Display information
disp('Multi-tone signal generation completed:');
disp(['- Sampling frequency: ' num2str(Fs) ' Hz']);
disp(['- Duration: ' num2str(duration) ' seconds']);
disp(['- Number of tones: ' num2str(length(tones))]);
disp(['- Signal data saved to: ' signal_file]);
disp(['- FFT data saved to: ' fft_file]);