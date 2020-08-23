clc;
close all;
clear;
fs= 50000;
 Npts  = fs / 2;
 fpass = 16000;
 fstop = 20000;
 Rpass = 0.1;
 Rstop = 80;
spec_pbr_pos = 1; % upper ripple limit as a unitless quantity
spec_pbr_neg = 10^(-Rpass/20); % lower ripple limit as a unitless quantity
spec_sba = 10^(-Rstop/20); % stopband attenuation, converted from dB

Wrange = linspace(0,2*pi*fpass,1000000); % linear frequency range for plotting
Frange = (1/(2*pi))*Wrange;
Ypbrpos = spec_pbr_pos*ones(size(Wrange));
Ypbrneg = spec_pbr_neg*ones(size(Wrange));
Ysba = spec_sba*ones(size(Wrange));
    
 Wpass = 2 / fs * fpass;
 Wstop = 2 / fs * fstop;
 [n, Wn_p] = buttord (fpass, fstop, Rpass, Rstop,'s')
 
    [numHbw, denHbw] = butter(n,Wn_p,'s');
    Hbw = tf(numHbw,denHbw);
    [Ybw_mag,Ybw_ph] = bode(Hbw, Wrange);
    Ybw_mag=reshape(Ybw_mag,[1 max(size(Ybw_mag))]);
    Ybw_ph=reshape(Ybw_ph,[1 max(size(Ybw_ph))]);
    
    % plot response with specs superimposed
    figure; plot(Frange, 20*log10(Ybw_mag));
    hold on;
    grid;
    title('Butterworth Analog Filter Response');
    xlabel('freq (kHz)');
    ylabel('response (dB)');
    % plot specs/constraints for comparison
     figure;   
     plot(Ybw_ph)    
     hold on;
      xlabel("Frequency in kHz")
      ylabel("Phase in radians")
