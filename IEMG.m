% One of the feature function
% Calculate the sum of absolute value of the function data points
% Author: Kening Zhang
function[m]=IEMG(input)
    featureNum=size(input,2);
    sampleNum=size(input,1);
    m=zeros(sampleNum,1);
    for i = 1:sampleNum
        for j = 1 :featureNum
            m(i,1)=m(i,1)+abs(input(i,j));
        end
        m(i,1)=m(i,1)/featureNum;
    end
end
      