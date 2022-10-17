clear all;close all;clc
% addpath(genpath('./'))
addpath('..\IV_images'); %加入上两级路径
global alpha_t;
%% Read the image
for i = 2:2%Here are 12 fused images that appeared in the paper
    % Path setting
    PathVis1          = [ 'IN\IV_images\VIS' ,        num2str(i) ,        '.png' ];
    PathVis          = [ 'IN\1 SCI_diff\VIS' ,        num2str(i) ,       '.png' ];
    FusionPath       = [ 'OUT\',   num2str(i) ,'.png' ]; %加入中值去噪
     
    I = im2double(imread(PathVis));
    I1 = im2double(imread(PathVis1));
    
    % figure;imshow(I)
    %% Do the job
%     for alpha_t =0.02:0.04:0.24
    alpha_t = .1;%.12
    N_iter =1;%10
    mode = 2; %mode = 0 dynamic/dynamic
    % mode = 1; % static/dynamic
    % mode = 2; % dynamic only
    tic
    img1 = ColorBalance(I); 
    img2 = adapthisteq(img1(:, :, 1)); 
    [T,R] = muGIF(I1,I1,alpha_t,0,N_iter,mode)  ;
    toc
    img3 = (im2double(img2)+R-T);
    imwrite(img3,FusionPath);
%     disp(['alpha_t:',num2str(alpha_t)]); %disp 显示
%     imwrite(img2,[ 'OUT2\A',   num2str(i) ,'_',num2str(alpha_t), '.png' ]);
%     end
end







