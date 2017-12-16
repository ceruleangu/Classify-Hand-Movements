% to concatatenate all the 40 features of the data set which is 1800*2500
% Author: Kening Zhang
function[m]=concate2(input)
    IMFFirst=zeros(1800,2500);
    IMFSecond=zeros(1800,2500);
    IMFThird=zeros(1800,2500);
    residual=zeros(1800,2500);
    for i=1:1800
        IMFs=emd(input(i,:));
        IMFFirst(i,:)= IMFs(1,:);
        IMFSecond(i,:)= IMFs(2,:);
        IMFThird(i,:)=IMFs(3,:);
        residual(i,:)=IMFs(size(IMFs,1),:);
    end
    m=horzcat(IEMG(input), ZC(input), Var(input),SSC(input),WL(input),WAMP(input), KUR(input),SKE(input),...
              IEMG(IMFFirst), ZC(IMFFirst), Var(IMFFirst),SSC(IMFFirst),WL(IMFFirst),WAMP(IMFFirst), KUR(IMFFirst),SKE(IMFFirst),...
              IEMG(IMFSecond), ZC(IMFSecond), Var(IMFSecond),SSC(IMFSecond),WL(IMFSecond),WAMP(IMFSecond), KUR(IMFSecond),SKE(IMFSecond),...
              IEMG(IMFThird), ZC(IMFThird), Var(IMFThird),SSC(IMFThird),WL(IMFThird),WAMP(IMFThird), KUR(IMFThird),SKE(IMFThird),...
              IEMG(residual), ZC(residual), Var(residual),SSC(residual),WL(residual),WAMP(residual), KUR(residual),SKE(residual));
end