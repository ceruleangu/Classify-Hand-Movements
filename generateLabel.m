% Generate a label for the final result comparison, which is 1800*6, each
% row can only be 1 or 0, standing for the classification group of the
% experienment
% Author: Kening Zhang
function[label]=generateLabel()
    label=zeros(1800,6);
    for i=1:6
        label(1+(i-1)*300:i*300,i)= 1;
    end
end