%% IIR filter realization (butter, elliptical, cheby1,cheby2)
close all;
clear;
clc;

%
% filter spec parameters
%
Rp = 0.3;
Rs = 100;
Fpass = 50000;
Fstop = 80000;

Fs=1000000;
Ts= 1/Fs;

load('/home/amonjot/Downloads/num_fir.mat') % check the min and max values of these coefficients
butterf =designfilt('lowpassiir','PassbandFrequency',Fpass,'StopbandFrequency',Fstop,'PassbandRipple',Rp,'StopbandAttenuation',Rs,'SampleRate',Fs,'DesignMethod','butter');
elliptf =designfilt('lowpassiir','PassbandFrequency',Fpass,'StopbandFrequency',Fstop,'PassbandRipple',Rp,'StopbandAttenuation',Rs,'SampleRate',Fs,'DesignMethod','ellip');
cheby1f =designfilt('lowpassiir','PassbandFrequency',Fpass,'StopbandFrequency',Fstop,'PassbandRipple',Rp,'StopbandAttenuation',Rs,'SampleRate',Fs,'DesignMethod','cheby1');
cheby2f =designfilt('lowpassiir','PassbandFrequency',Fpass,'StopbandFrequency',Fstop,'PassbandRipple',Rp,'StopbandAttenuation',Rs,'SampleRate',Fs,'DesignMethod','cheby2');

fvtool(butterf,elliptf,cheby1f,cheby2f)
legend('Butterworth' ,'Elliptical' , 'Chebyshev1' , 'Chebyshev2')

ylim ([-200, 20]);
xlim ([0,150]);

fvtool(butterf,elliptf,cheby1f,cheby2f,'phase')
legend('Butterworth' ,'Elliptical' , 'Chebyshev1' , 'Chebyshev2')

ord_butt_ell_ch1_ch2=[filtord(butterf) filtord(elliptf) filtord(cheby1f) filtord(cheby2f)]
