clear all;close all;clc
addpath(genpath('./'))
%% Read the image
I = im2double(imread('I07.BMP'));
figure;imshow(I)
%% Do the job
alpha_t = .1;%.12
N_iter =1;%10
mode = 2; %mode = 0 dynamic/dynamic 
          % mode = 1; % static/dynamic
          % mode = 2; % dynamic only
tic
[T,R] = muGIF(I,I,alpha_t,0,N_iter,mode)  ;
toc
figure;imshow(T,[]);colormap('hot');
figure;imshow(R-T,[]);colormap('hot');

H=rgb2gray(R-T);
imagesc(H)
figure,imshow((I+R-T),[]);









