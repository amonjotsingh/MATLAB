%butterworth magnitude and frequexy response
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
 [n, Wn_p] = buttord (Wpass, Wstop, Rpass, Rstop)
 [b, a] = butter (n, Wn_p);
 W = linspace(0,2*pi*50000,1000000); % linear frequency range for plotting
 f = (1/(2*pi))*W;
 freqz(b,a)
 ylim([ -100, 10]);
 title ("Digital Butterworth low-pass");
