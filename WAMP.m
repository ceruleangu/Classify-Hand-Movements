% One of the feature function
% Calculate the count the absolute difference between two adjacent data 
% point over a threshold value 0.2
% Author: Kening Zhang
function[m]=WAMP(input)
    featureNum=size(input,2);
    sampleNum=size(input,1);
    m=zeros(sampleNum,1);
    for i = 1:sampleNum
        count=0;
        for j = 1 :featureNum-1
            if (abs(input(i,j)-input(i,j+1))> 0.2)
                count=count+1;
            end
        end
        m(i,1)=count;
    end
end