
function [sem] = get_sem(trials)
if size(trials)>1
 sem = std(trials)/sqrt(size(trials,1));
else
     sem = std(trials)/sqrt(numel(trials));
end