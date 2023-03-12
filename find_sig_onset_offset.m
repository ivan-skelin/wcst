
function [onsets, offsets] = find_sig_onset_offset(sig_sign, specific_sign)

%find_sig_onset_offset.m finds the onsets and offsets of significant effect
%windows, in each direction
if strcmp(specific_sign,'positive')==1
    specific_change_symbol = 1;
elseif strcmp(specific_sign,'negative')==1
    specific_change_symbol = -1;
end

count=1; onsets = [];

for i = 1:(numel(sig_sign)-1)
    if sig_sign(i)==0 & sig_sign(i+1)==specific_change_symbol
        onsets(count) = i+1;
        count=count+1;
    end
end


count=1; offsets = [];

for i = 2:(numel(sig_sign)-1)
    if sig_sign(i)==specific_change_symbol & sig_sign(i+1)==0
        offsets(count) = i;
        count=count+1;
    end
end

