% Demo code for estimating NITI parameters of brain
%
% Record of Revision
% Jan-21-2025===Shengyuan Ma===Orignal code 
%%
clc
clear
close all
warning off;
rng default;
%% note: Fig.5
%% step1: Load data
load MRE_DTI_demo.mat
%% step2:  filter
Wj=wavefield_filter(W,Freq_list);
Wj=Wj./max(abs(Wj),[],[1,2,3]);
%%  TWE-NITI for Fusion
mu=TWE_NITI_main(Wj,Freq_list,dxyz,Fiber);
M=Roi_mask(2:end-2,2:end-2,2:end-2);
mu=mu.*M;
mag=Mag(2:end-2,2:end-2,2:end-2);
fa=FA(2:end-2,2:end-2,2:end-2);
save G.mat mu  mag fa
%% TWE-NITI for Test1
mu=TWE_NITI_main(Wj(:,:,:,:,:,1),Freq_list,dxyz,Fiber);
M=Roi_mask(2:end-2,2:end-2,2:end-2);
mu=mu.*M;
mag=Mag(2:end-2,2:end-2,2:end-2);
fa=FA(2:end-2,2:end-2,2:end-2);
save G1.mat mu mag fa
%% TWE-NITI for Test2
mu=TWE_NITI_main(Wj(:,:,:,:,:,2),Freq_list,dxyz,Fiber);
M=Roi_mask(2:end-2,2:end-2,2:end-2);
mu=mu.*M;
mag=Mag(2:end-2,2:end-2,2:end-2);
fa=FA(2:end-2,2:end-2,2:end-2);
save G2.mat mu mag fa
%% show res
show_pic;

