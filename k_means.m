clear all
close all
clc

fid = dlmread('TrainData.txt');
sizeData = size(fid);
n = sizeData(1);

for i=1:1:10
    newdata = fid(i,:);
    maindata = reshape(newdata,30,40);
    imshow(maindata')
end
