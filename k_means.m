clear all
close all
clc

fid = dlmread('TrainData.txt');
sizeData = size(fid);
n = sizeData(1);

knew = cell(1,10);
k = cell(1,10);

k{1,1} = randi([0 1],[1 1200]);
k{1,2} = randi([0 1],[1 1200]);
k{1,3} = randi([0 1],[1 1200]);
k{1,4} = randi([0 1],[1 1200]);
k{1,5} = randi([0 1],[1 1200]);
k{1,6} = randi([0 1],[1 1200]);
k{1,7} = randi([0 1],[1 1200]);
k{1,8} = randi([0 1],[1 1200]);
k{1,9} = randi([0 1],[1 1200]);
k{1,10} = randi([0 1],[1 1200]);

space = zeros(1,10);
Ji = inf;

while (Ji > 0.01)
    group = cell(1,10);
    for i=1:1:100
        newdata = fid(i,:);
        for j=1:1:10
            space(1,j) = norm(k{1,j}-newdata);
        end
        [value , number ] = min(space);
        group{1,number} = [group{1,number};newdata];

    %     maindata = reshape(newdata,30,40);
    %     imshow(maindata')
    end
    for i=1:10
        s = size(group{1,i});
        if(s(1) == 0)
            knew{1,i} = k{1,i};
        elseif(s(1) == 1)
            knew{1,i} = group{1,i};
        else
            knew{1,i} = mean(group{1,i});
        end
    end
    
    Ji=0;
    for i=1:1:10
       s = size(group{1,i});
       vectores = group{1,i};
       sum = 0;
       j = 1;
       if(s(1) ~= 0)
           for j=1:1:s(1)
             sum = sum + norm( vectores(j,:)- knew{1,i})^2;
           end
       end
       
       sum = sum / j;
       Ji = Ji+sum;
    end
    
    k = knew;
end
    

