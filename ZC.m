% One of the feature function
% Calculate the number of time the function across the x axis
% Author: Kening Zhang
function[m]=ZC(input)
    featureNum=size(input,2);
    sampleNum=size(input,1);
    m=zeros(sampleNum,1);
    for i = 1:sampleNum
        count=0;
        for j = 1 :featureNum-1
            if (input(i,j)*input(i,j+1) <0)
                count=count+1;
            end
        end
        m(i,1)=count;
    end
end