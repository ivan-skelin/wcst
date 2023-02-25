


function [curr_plv] = get_plv(curr_trace1, curr_trace2, curr_freq, time_limits, srate)


nyq_freq = srate/2;

  freq_low = curr_freq(1) / nyq_freq;
  freq_high = curr_freq(2) / nyq_freq;
                        
  [A,B] = cheby1(3, 0.1, [freq_low,freq_high]);
  
  a = filtfilt(A, B, curr_trace1);

hilb_trace1 = angle(a((end-time_limits(1)):(end-time_limits(2))));


a = filtfilt(A, B, curr_trace2);

hilb_trace2 = angle(a((end-time_limits(1)):(end-time_limits(2))));


curr_plv = (exp(1i *(hilb_trace1 - hilb_trace2)));   %phase difference is in the brackets


