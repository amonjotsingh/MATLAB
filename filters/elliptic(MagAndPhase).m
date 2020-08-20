clc;
clear all;
fs    = 50000;
 Npts  = fs / 2;
 fpass = 16000;
 fstop = 20000;
 Rpass = 0.1;
 Rstop = 80;
 Wpass = 2 / fs * fpass;
 Wstop = 2 / fs * fstop;
 [n, Wn_p] = ellipord (Wpass, Wstop, Rpass, Rstop)
 [b, a] = ellip (n, Rpass, Rstop,Wn_p);
 W = linspace(0,2*pi*50000,1000000); % linear frequency range for plotting
 f = (1/(2*pi))*W;
 [H, f] = freqz (b, a, Npts, fs);
 plot (f, 20 * log10 (abs (H)));
 title ("Digital elliptical low-pass ");
 grid on;
 ylim ([-100, 20]);
