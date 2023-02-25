


function [phase_diff] = get_phase_diff(signal1, signal2, freq, srate)

% phase_diff computes the phase differences between the two time series
%
% Inputs : 
%     signal1: a vector representing one time series (e.g. EEG from one electrode)
%     signal2: a vector representing another time series (e.g. EEG from one electrode)
%     freq:    a 2-element vector, defining the low and high  bandpass limits
%     srate:   a scalar, defining the sampling frequency (both signals must be recorded or later processed to have the same sampling frequency)
%
% Outputs :
%     phase_diff: a vector containing the phase differences (in radians) between the two time series at a given frequency, at each timepoint
      
nyq_freq = srate/2;

freq_low = freq(1) / nyq_freq;
freq_high = freq(2) / nyq_freq;

[A,B] = cheby1(3, 0.1, [freq_low,freq_high]);

filt_signal1 = filtfilt(A, B, signal1);

angle_signal1 = angle(hilbert(filt_signal1));


filt_signal1 = filtfilt(A, B, signal1);

angle_signal1 = angle(hilbert(filt_signal1));

phase_diff = (exp(1i *(angle_signal1 - angle_signal1)));  


