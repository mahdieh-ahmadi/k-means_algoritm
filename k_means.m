clear all
close all
clc

fid = dlmread('TrainData.txt'); 
newfile = dlmread('TestData.txt');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%% this code is for all numbers of vectores %%%%%%%%%%%%%%%%%%%%%

     
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% setting %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
type = 3;%% 1 => random number , 2 => random from data , 3 => avrage of each 2000 vectore , 4 => select manual
count = 20; %% select the number of claster

    if(type == 1) %% rondom numder for centroid position
        for i=1:1:count
            k(i,:) = randi([0 1],[1 1200]);
        end
    elseif(type == 2)%%random vectore of data input for centroid position
        for i=1:1:count
            b = randi([1 20000]);
            k(i,:) = fid(b,:);
        end
    elseif(type ==3) %% the avrage af each 2000 vectore for centroid position
        for i=0:1:count-1
            sum =  fid( (i*(10/count)*2000)+1:(i+1)*(10/count)*2000,:) ;
            k(i+1,:) = mean(sum);
        end
    elseif(type == 4 && count == 10) %% select manual for centroid position for 10 claster
    k(1,:) = fid(240,:);
    k(2,:) = fid(34,:);
    k(3,:) = fid(18,:);
    k(4,:) = fid(40,:);
    k(5,:) = fid(15,:);
    k(6,:) = fid(1,:);
    k(7,:) = fid(10,:);
    k(8,:) = fid(38,:);
    k(9,:) = fid(31,:);
    k(10,:) = fid(9,:);
    end

    [a,b]=kmeans(fid , count , 'start' ,k ); %% start algorithm
    
    %%%%%%%%%%%%%%%%%%%%%%%% display algorithm %%%%%%%%%%%%%%%%%%%%%%%%%%%
     for i=1:1:count
        fff = b(i,:);
        maindata = reshape(fff,30,40);
        subplot(count/10,10,i)
        imshow(maindata')
     end  
     
     
     
     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
     %%%%%%%%%%%%%%%%%%%%%%%%%% classify new data %%%%%%%%%%%%%%%%%%%%%%%%
     s = size(newfile);
     n = s(1);
     classify = [];
%      b = [b10(1,:);b10(2,:);b10(3,:);b10(4,:);b20(5,:);b20(6,:);b20(7,:)];
     figure
     for i=1:1:n %% display clasters
        fff = newfile(i,:);
        maindata = reshape(fff,30,40);
        subplot(2,10,i)
        imshow(maindata')
     end 
     
     for i=1:1:n
        data = newfile(i,:);
        sum = zeros(1,10);
        for j=1:1:count
            sum(1,j) = norm(data - b(j,:));
        end
        [value , number ] = min(sum);
        classify = [classify;number];
     end
     
     
