
function [sem] = get_sem(values)
%   get_sem.m calculates the standard error of the mean from the input
%  Input:
%   values : a 1D or 2D array
%  
%  Output: 
%   sem : a scalar in the case of 1D input or a vector in the case of 2D input (the SEM is calculated over the first dimension by default).

if size(values)>1
 sem = std(values)/sqrt(size(values,1));
else
     sem = std(values)/sqrt(numel(values));
end
