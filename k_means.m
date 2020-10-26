clear all
close all
clc

fid = dlmread('TrainData.txt');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%this code is for all size

dd=2;

if(dd == 2)

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

    [a,b]=kmeans(fid , 10 , 'start' ,k );

     for i=1:1:10
        fff = b(i,:);
        maindata = reshape(fff,30,40);
        figure
        imshow(maindata')
     end  
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%this code is for to low number vector
aaa = 0;

if(aaa == 1)
    
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
    Jiold = 0;

    while (abs(Ji-Jiold) > 0.001)

        Jiold = Ji;
        group = cell(1,10);
        for i=1:1:2000
            newdata = fid(i,:);
            for j=1:1:10
                space(1,j) = norm(k{1,j}-newdata);
            end
            [value , number ] = min(space);
            group{1,number} = [group{1,number};newdata];
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
                 sum = sum + norm( vectores(j,:)- mean(vectores))^2;
               end
           end

           sum = sum / j;
           Ji = Ji+sum;
        end

        k = knew;
    end

    for i=1:1:10
        fff = k{1,i};
        maindata = reshape(fff,30,40);
        figure
        imshow(maindata')
    end  
end


