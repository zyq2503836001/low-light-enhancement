clear all;close all;clc
addpath(genpath('./'))
%% Read the image
I = im2double(imread('I07.BMP'));
figure;imshow(I)



%% Do the job
% alpha_t = .1;%.12
N_iter =1;%10
mode = 2; %mode = 0 dynamic/dynamic 
          % mode = 1; % static/dynamic
          % mode = 2; % dynamic only
          n=0;
 for i=1:5:1000
     alpha_t=0.01*i;
          n=n+1;
% if n==94
%     break;
% end
%  end

[T,R] = muGIF(I,I,alpha_t,0,N_iter,mode)  ;

% figure;imshow(T,[]);colormap('hot');
% figure;imshow(R-T,[]);colormap('hot');

H=rgb2gray(R-T);
imagesc(H)
% figure,imshow((I+R-T),[]);
FN=I+R-T;
% uciqe(1,i) = UCIQE(FN);
% uiqm(1,i)=UIQM(FN);
% uicm(1,i)=UICM(FN);
uism(1,n)=UISM(R-T);
% uiconm(1,i)=UIConM(FN);
 end


