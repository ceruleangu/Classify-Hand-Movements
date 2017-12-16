% Generate a label (Python version) for the final result comparison, which
% is 1800*1, each row is 0 to 5, standing for the classification group 
% of the experienment
% Author: Kening Zhang
function[label]=generateLabelPy()
    label=zeros(1800,1);
    for i=1:6
        label(1+(i-1)*300:i*300,1)= i-1;
    end
end