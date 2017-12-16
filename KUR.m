% One of the feature function
% Calculate the kurtosis of the function( horizatally)
% Author: Kening Zhang
function[m]=KUR(input)
    m=kurtosis(input');
    m=m';
end