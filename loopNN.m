function outputForm = loopNN(nLoop, feature, label)

%array of training functions
trainFuncArray=[string('trainscg')];

%array of hidden layer numbers
hiddenLayerArray = [10,40,160,640,2560];
%hiddenLayerArray = [10,20,40,60,80];

%array of performance functions
performFuncArray=[string('mse')];

%results in a string array
outputForm = strings(length(trainFuncArray)*length(hiddenLayerArray)*length(performFuncArray)*6+1,7);
outputForm= [string('TrainingFcn'), string('HiddenLayers'), string('PerformanceFcn'), string('NumOfLoops'), ...
    string('trainingAcc'), string('validationAcc'), string('testingAcc')];
row = 1;

for i = 1:length(trainFuncArray)
    tf = char(trainFuncArray(i));
    for j = 1:length(hiddenLayerArray)
        hl = hiddenLayerArray(j);
        for k = 1:length(performFuncArray)
            pf = char(performFuncArray(k));
            trAccSum = 0; vaAccSum=0; tstAccSum=0;
            for n = 1:nLoop
                [trAcc,vaAcc,tstAcc]=runNN(tf,hl,pf,feature,label);
                row = row + 1;
                outputForm(row,:) = [trainFuncArray(i),hiddenLayerArray(j), ...
                    performFuncArray(k),n,trAcc,vaAcc,tstAcc];
                trAccSum = trAccSum + trAcc;
                vaAccSum = vaAccSum + vaAcc;
                tstAccSum = tstAccSum + tstAcc;
            end
            trAccRate = trAccSum/nLoop;
            vaAccRate = vaAccSum/nLoop;
            tstAccRate = tstAccSum/nLoop;
            row = row + 1;
            outputForm(row,:) = [trainFuncArray(i),hiddenLayerArray(j), ...
                performFuncArray(k),string('avg'), trAccRate, vaAccRate, tstAccRate];  
        end
    end
end

end