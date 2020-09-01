clear; close all; clc;

% system sampling parameters
Fs_filter = 200000;
Ts_filter = 1/Fs_filter;

% acquire raw stereo data, data will be normalized from -1.0 to 1.0
[Y, FS] = audioread('/home/amonjot/Downloads/69869__lg__thats-nice.wav', 'double');

% Resample with 200kHz
Y=resample(Y,Fs_filter,FS); % make the data compatible with out filter
                        	% sampling rate, Fs_filter
 
YS = fft(Y,10);
%plotting the sample
time=(1:length(Y))/FS;  % Time vector on x-axis
plot(time,Y);xlabel('Time');
ylabel('Amplitude');	% Plot the waveform w.r.t. time

YL = Y(:,1); % left sound channel
YR = Y(:,2); % right sound channel
N = max(size(Y)); % number of data points
audiowrite('test_preoutput.wav', [YL YR], Fs_filter);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Low-Pass Filter design:
% load a statemodel, stored as Me system matrix (previously designed)
load('/home/amonjot/Downloads/Me.mat')
Ae = Me(1:8,1:8);
Be = Me(1:8, 9);
Ce = Me(9, 1:8);
De = Me(9, 9);
Hsys = ss(Ae,Be,Ce,De,Ts_filter);
% apply the filter
Trange = (0:Ts_filter:(N-1)*Ts_filter)';
YLO = lsim(Hsys, YL, Trange);
YRO = lsim(Hsys, YR, Trange);
% form the new output
YO = [YLO YRO];
% write it out: audiowrite(FILENAME,Y,F)
audiowrite('output.wav', YO, Fs_filter);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
