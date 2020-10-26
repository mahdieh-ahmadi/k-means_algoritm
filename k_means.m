clear all
close all
clc

fid = dlmread('TrainData.txt'); 
newfile = dlmread('TestData.txt');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%% this code is for all numbers of vectores %%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 10 class %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
     
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% setting %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
type = 4;%% 1 => random number , 2 => random from data , 3 => mean of each 2000 vectore , 4 => select manual

    if(type == 1) %% rondom numder for centroid position
        for i=1:1:10
            k(i,:) = randi([0 1],[1 1200]);
        end
    elseif(type == 2)%%random vectore of data input for centroid position
        for i=1:1:10
            b = randi([1 20000]);
            k(i,:) = fid(b,:);
        end
    elseif(type ==3) %% the avrage af each 2000 vectore for centroid position
        for i=0:1:9
            sum =  fid( (i*2000)+1:(i+1)*2000,:) ;
            k(i+1,:) = mean(sum);
        end
    elseif(type == 4) %% select manual for centroid position
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

    [a10,b10]=kmeans(fid , 10 , 'start' ,k ); %% start algorithm
    
    %%%%%%%%%%%%%%%%%%%%%%%% display algorithm %%%%%%%%%%%%%%%%%%%%%%%%%%%
%      for i=1:1:10
%         fff = b10(i,:);
%         maindata = reshape(fff,30,40);
%         figure
%         imshow(maindata')
%      end  
     
     
     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
     %%%%%%%%%%%%%%%%%%%%%%%%%%%% 20 class %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
     
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%% setting %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
     type = 3;%% 1 => random number , 2 => random from data , 3 => mean of each 2000 vectore 

    if(type == 1) %% rondom numder for centroid position
        for i=1:1:20
            k(i,:) = randi([0 1],[1 1200]);
        end
    elseif(type == 2)%%random vectore of data input for centroid position
        for i=1:1:20
            b = randi([1 20000]);
            k(i,:) = fid(b,:);
        end
    elseif(type ==3) %% the avrage af each 2000 vectore for centroid position
        for i=0:1:19
            sum =  fid((i*1000)+1:(i+1)*1000,:) ;
            k(i+1,:) = mean(sum);
        end
    end

    [a20,b20]=kmeans(fid , 20 , 'start' ,k ); %% start algorithm
    
    %%%%%%%%%%%%%%%%%%%%%%%% display algorithm %%%%%%%%%%%%%%%%%%%%%%%%%%%
%      for i=1:1:10
%         fff = b20(i,:);
%         maindata = reshape(fff,30,40);
%         figure
%         imshow(maindata')
%      end  
     
     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
     %%%%%%%%%%%%%%%%%%%%%%%%%% classify new data %%%%%%%%%%%%%%%%%%%%%%%%
     s = size(newfile);
     n = s(1);
     classify = [];
     b = [b10(1,:);b10(2,:);b10(3,:);b10(4,:);b20(5,:);b20(6,:);b20(7,:)];
     
     for i=1:1:7 %% display clasters
        fff = b(i,:);
        maindata = reshape(fff,30,40);
        figure
        imshow(maindata')
     end 
     
     for i=1:1:n
        data = newfile(i,:);
        sum = zeros(1,10);
        for j=1:1:7
            sum(1,j) = norm(data - b(j,:));
        end
        [value , number ] = min(sum);
        classify = [classify;number];
     end
     
     
