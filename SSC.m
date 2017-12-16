% One of the feature function
% Calculate the number of time the slope of the function changes
% Author: Kening Zhang
function[m]=SSC(input)
    featureNum=size(input,2);
    sampleNum=size(input,1);
    m=zeros(sampleNum,1);
    for i = 1:sampleNum
        count=0;
        for j = 1 :featureNum-2
            if input(i,j+1)<input(i,j+2) && input(i,j+1)<input(i,j)
                count=count+1;
            elseif input(i,j+1)> input(i,j+2) && input(i,j+1)>input(i,j)
                count=count+1;
            end
        end
        m(i,1)=count;
    end
        
end
    