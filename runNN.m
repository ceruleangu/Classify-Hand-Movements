function [trPercentAcc,vaPercentAcc,tstPercentAcc] = runNN(trainingFunc,hiddenLayer,performFunc,feature,label)
% Solve a Pattern Recognition Problem with a Neural Network

x = feature';
t = label';

trainFcn = trainingFunc;    

% Create a Pattern Recognition Network
hiddenLayerSize = hiddenLayer;                                             
net = feedforwardnet(hiddenLayerSize, trainFcn);

% Choose Input and Output Pre/Post-Processing Functions
net.input.processFcns = {'removeconstantrows','mapminmax'};
net.output.processFcns = {'removeconstantrows','mapminmax'};

% Setup Division of Data for Training, Validation, Testing
net.divideFcn = 'dividerand';  % Divide data randomly
net.divideMode = 'sample';  % Divide up every sample
net.divideParam.trainRatio = 60/100;                                       
net.divideParam.valRatio = 20/100;
net.divideParam.testRatio = 20/100;

% Choose a Performance Function
net.performFcn = performFunc;                                              

% Choose Plot Functions
net.plotFcns = {'plotperform','plottrainstate','ploterrhist', ...
    'plotconfusion', 'plotroc'};

% Train the Network
[net,tr] = train(net,x,t);

% Test the Network
y = net(x);
e = gsubtract(t,y);
performance = perform(net,t,y);
tind = vec2ind(t);
yind = vec2ind(y);
y_int= ind2vec(yind);
percentErrors = sum(tind ~= yind)/numel(tind);

% Recalculate Training, Validation and Test Performance
trainTargets = t .* tr.trainMask{1};
trainPredictions = y_int .* tr.trainMask{1};
valTargets = t .* tr.valMask{1};
valPredictions = y_int .* tr.valMask{1};
testTargets = t .* tr.testMask{1};
testPredictions = y_int .* tr.testMask{1};
tindTr=zeros(1,size(t,2)); % Initial as 0s
tindVa=zeros(1,size(t,2)); % Initial as 0s
tindTst=zeros(1,size(t,2)); % Initial as 0s
yindTr=ones(1,size(t,2))*9; % Initial as 9s
yindVa=ones(1,size(t,2))*9; % Initial as 9s
yindTst=ones(1,size(t,2))*9; % Initial as 9s
nTr=0;nVa=0;nTst=0;
for r = 1:size(t,1)
    for c = 1:size(t,2)
        if trainTargets(r,c)==1
            tindTr(c)=r; nTr=nTr+1;
        end
        if trainPredictions(r,c)==1
            yindTr(c)=r;
        end
        if valTargets(r,c)==1
            tindVa(c)=r; nVa=nVa+1;
        end
        if valPredictions(r,c)==1
            yindVa(c)=r;
        end
        if testTargets(r,c)==1
            tindTst(c)=r; nTst=nTst+1;
        end
        if testPredictions(r,c)==1
            yindTst(c)=r;
        end
    end
end
trPercentAcc = sum(tindTr == yindTr)/nTr;
vaPercentAcc = sum(tindVa == yindVa)/nVa;
tstPercentAcc = sum(tindTst == yindTst)/nTst;

trainPerformance = perform(net,trainTargets,y);
valPerformance = perform(net,valTargets,y);
testPerformance = perform(net,testTargets,y);

% View the Network
%view(net)

% Plots
% Uncomment these lines to enable various plots.
%figure, plotperform(tr)
%figure, plottrainstate(tr)
%figure, ploterrhist(e)
%figure, plotconfusion(t,y)
%figure, plotroc(t,y)

% Deployment
% Change the (false) values to (true) to enable the following code blocks.
% See the help for each generation function for more information.
if (false)
    % Generate MATLAB function for neural network for application
    % deployment in MATLAB scripts or with MATLAB Compiler and Builder
    % tools, or simply to examine the calculations your trained neural
    % network performs.
    genFunction(net,'myNeuralNetworkFunction');
    y = myNeuralNetworkFunction(x);
end
if (false)
    % Generate a matrix-only MATLAB function for neural network code
    % generation with MATLAB Coder tools.
    genFunction(net,'myNeuralNetworkFunction','MatrixOnly','yes');
    y = myNeuralNetworkFunction(x);
end
if (false)
    % Generate a Simulink diagram for simulation or deployment with.
    % Simulink Coder tools.
    gensim(net);
end
end

