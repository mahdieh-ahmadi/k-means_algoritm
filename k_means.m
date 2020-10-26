clear all
close all
clc

fid = dlmread('TrainData.txt');
sizeData = size(fid);
n = sizeData(1);
k(1,:) = randi([0 1],[1 1200]);
k(2,:) = randi([0 1],[1 1200]);
k(3,:) = randi([0 1],[1 1200]);
k(4,:) = randi([0 1],[1 1200]);
k(5,:) = randi([0 1],[1 1200]);
k(6,:) = randi([0 1],[1 1200]);
k(7,:) = randi([0 1],[1 1200]);
k(8,:) = randi([0 1],[1 1200]);
k(9,:) = randi([0 1],[1 1200]);
k(10,:) = randi([0 1],[1 1200]);

% group(1)=[];
% group(2)=[];
% group(3)=[];
% group(4)=[];
% group(5)=[];
% group(6)=[];
% group(7)=[];
% group(8)=[];
% group(9)=[];
% group(10)=[];

group = cell(1,10);


space = zeros(1,10);

    for i=1:1:10
        newdata = fid(i,:);
        for j=1:1:10
            space(1,j) = norm(k(j,:)-newdata);
        end
        [value , number ] = min(space);
        group{1,number} = [group{1,number};newdata];

    %     maindata = reshape(newdata,30,40);
    %     imshow(maindata')
    end
    for i=1:10
        if(size(group{1,i}) == 0)
            knew(i,:) = k(i,:)
        elseif(size(group{1,i}) == 1)
            knew(i,:) = group{1,i}
        else
            knew(i,:) = mean(group{1,i})
        end
    end
    % k1new = mean(group{1,7})

