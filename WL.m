% One of the feature function
% Calculate absolute wavelength of the function 
% Author: Kening Zhang
function[m]=WL(input)
    featureNum=size(input,2);
    sampleNum=size(input,1);
    m=zeros(sampleNum,1);
    for i = 1:sampleNum
        for j = 1 :featureNum-1
            m(i,1)=m(i,1)+abs(input(i,j)-input(i,j+1));
        end
    end
end