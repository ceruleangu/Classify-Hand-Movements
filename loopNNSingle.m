function outputForm = loopNNSingle(nLoop,tf,hl,pf, feature, label)

sum = 0;
outputForm = strings([2,5]);
outputForm(1,:) = ["TrainingFcn", "HiddenLayers", "PerformanceFcn", "NumOfLoops", "AverageErr"];
%outputForm(2,1:3) = [convertCharsToStrings(tf),hl,pf];

for n = 1:nLoop
    sum = sum + runNN(tf,hl,pf,feature,label);
end

averageErrRate = sum/nLoop;

outputForm(2,:) = [convertCharsToStrings(tf),hl,pf,nLoop, averageErrRate];

end