% Get GPU device information
deviceInfo = gpuDevice;

% define output folder
outputFolder = 'C:\Users\Lena\Downloads'; 
rootFolder = fullfile(outputFolder, '101');
imds = imageDatastore(rootFolder, 'IncludeSubfolders',true, 'LabelSource', 'foldernames');

% Split to train and test data
[trainingImages,validationImages] = splitEachLabel(imds,0.7,'randomize');

% Load pretrained neural network and check its structure
net = alexnet();
net.Layers;

% Fine-tuning

% Freeze all the layers except the last three from the pretrained network
layersTransfer = net.Layers(1:end-3);

numClasses = numel(categories(trainingImages.Labels));

% Replace the last three AlexNet layers to fullyConnectedLayer, softmaxLayer, classificationLayer
layers = [ ...
    layersTransfer
    fullyConnectedLayer(numClasses,'WeightLearnRateFactor',20,'BiasLearnRateFactor',20)
    softmaxLayer
    classificationLayer];

% Set options to re-train our network
miniBatchSize = 16;
numIterationsPerEpoch = floor(numel(trainingImages.Labels)/miniBatchSize);
optionsTransfer = trainingOptions('sgdm', ...
    'MiniBatchSize',miniBatchSize,...
    'MaxEpochs',50, ...
    'InitialLearnRate',0.0001, ...
    'Verbose',false,...
    'Plots','training-progress',...
    'ValidationData',validationImages,...
    'ValidationFrequency',numIterationsPerEpoch);

% Re-train network
netTransfer = trainNetwork(trainingImages,layers,optionsTransfer);

% Predict several images from Caltech101
predictedLabels = classify(netTransfer,validationImages);
random_images = [100 500 1569 2000];
figure
for i = 1:numel(random_images)
    subplot(2,2,i)
    I = readimage(validationImages,random_images(i));
    label = predictedLabels(random_images(i));
    imshow(I)
    title(char(label))
end

valLabels = validationImages.Labels;
accuracy = mean(predictedLabels == valLabels);