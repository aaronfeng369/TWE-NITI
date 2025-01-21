% Show the inversion results of TWENITI
%
% Record of Revision
% Jan-21-2025===Shengyuan Ma===Orignal code 
clc
clear
close all

%%
load MM.mat;
M=M0;
M=M(1:end-1,1:end-1,1:end-1);
%%

load G.mat
mu0_12=(mu(:,:,:,1));
mu1_12=(mu(:,:,:,2));
mu2_12=(mu(:,:,:,3));

load G1.mat
mu0_1=(mu(:,:,:,1));
mu1_1=(mu(:,:,:,2));
mu2_1=(mu(:,:,:,3));

load G2.mat
mu0_2=(mu(:,:,:,1));
mu1_2=(mu(:,:,:,2));
mu2_2=(mu(:,:,:,3));
fa=M.*double(fa);
mag=M.*(double(mag));

xind=[16,67];
yind=[11,70];

zind=[1,36];
rr=3;

pr=500;

M=M1;
%% WAVE
load MRE_DTI_demo.mat W
load cmapBWAVE.mat
AWAVE=cmap;
W=W(2:end-2,2:end-2,2:end-2,:,:,:,:,:,:);
dd=2;
ff=1;
ddp=0.5;
%% X 1 re
im_in1=permute(squeeze(mu0_1(37,yind(2):-1:yind(1),zind(2):-1:zind(1))),[2,1]);
im_in2=permute(squeeze(mu0_2(37,yind(2):-1:yind(1),zind(2):-1:zind(1))),[2,1]);
im_in3=permute(squeeze(mu0_12(37,yind(2):-1:yind(1),zind(2):-1:zind(1))),[2,1]);
low_up_limit=[0,3000];
figure
subplot(3,6,1);
imagesc(real(im_in1),low_up_limit);colormap gray;axis image;axis off;
title('Re(\mu)-test1')
subplot(3,6,7);
imagesc(real(im_in2),low_up_limit);colormap gray;axis image;axis off;
title('Re(\mu)-test2')
subplot(3,6,13);
imagesc(real(im_in3),low_up_limit);colormap gray;axis image;axis off;
title('Re(\mu)-fusion')

low_up_limit=[0,1500];
subplot(3,6,4);
imagesc(imag(im_in1),low_up_limit);colormap gray;axis image;axis off;
title('Im(\mu)-test1')
subplot(3,6,10);
imagesc(imag(im_in2),low_up_limit);colormap gray;axis image;axis off;
title('Im(\mu)-test2')
subplot(3,6,16);
imagesc(imag(im_in3),low_up_limit);colormap gray;axis image;axis off;
title('Im(\mu)-fusion')


im_in1=permute(squeeze(mu1_1(37,yind(2):-1:yind(1),zind(2):-1:zind(1))),[2,1]);
im_in2=permute(squeeze(mu1_2(37,yind(2):-1:yind(1),zind(2):-1:zind(1))),[2,1]);
im_in3=permute(squeeze(mu1_12(37,yind(2):-1:yind(1),zind(2):-1:zind(1))),[2,1]);
low_up_limit=[0,500];
subplot(3,6,2);
imagesc(real(im_in1),low_up_limit);colormap gray;axis image;axis off;
title('Re(\mu\phi)-test1')
subplot(3,6,8);
imagesc(real(im_in2),low_up_limit);colormap gray;axis image;axis off;
title('Re(\mu\phi)-test2')
subplot(3,6,14);
imagesc(real(im_in3),low_up_limit);colormap gray;axis image;axis off;
title('Re(\mu\phi)-fusion')

subplot(3,6,5);
imagesc(imag(im_in1),low_up_limit);colormap gray;axis image;axis off;
title('Im(\mu\phi)-test1')
subplot(3,6,11);
imagesc(imag(im_in2),low_up_limit);colormap gray;axis image;axis off;
title('Im(\mu\phi)-test2')
subplot(3,6,17);
imagesc(imag(im_in3),low_up_limit);colormap gray;axis image;axis off;
title('Im(\mu\phi)-fusion')

im_in1=permute(squeeze(mu2_1(37,yind(2):-1:yind(1),zind(2):-1:zind(1))),[2,1]);
im_in2=permute(squeeze(mu2_2(37,yind(2):-1:yind(1),zind(2):-1:zind(1))),[2,1]);
im_in3=permute(squeeze(mu2_12(37,yind(2):-1:yind(1),zind(2):-1:zind(1))),[2,1]);
low_up_limit=[0,500];
subplot(3,6,3);
imagesc(real(im_in1),low_up_limit);colormap gray;axis image;axis off;
title('Re(\mu\zeta)-test1')
subplot(3,6,9);
imagesc(real(im_in2),low_up_limit);colormap gray;axis image;axis off;
title('Re(\mu\zeta)-test2')
subplot(3,6,15);
imagesc(real(im_in3),low_up_limit);colormap gray;axis image;axis off;
title('Re(\mu\zeta)-fusion');

subplot(3,6,6);
imagesc(imag(im_in1),low_up_limit);colormap gray;axis image;axis off;
title('Im(\mu\zeta)-test1')
subplot(3,6,12);
imagesc(imag(im_in2),low_up_limit);colormap gray;axis image;axis off;
title('Im(\mu\zeta)-test2')
subplot(3,6,18);
imagesc(imag(im_in3),low_up_limit);colormap gray;axis image;axis off;
title('Im(\mu\zeta)-fusion')
% return
tt=1;
im_in1=medfilt2(permute(squeeze(real(W(37,yind(2):-1:yind(1),zind(2):-1:zind(1),dd,ff,tt))),[2,1]),[3,1]);
tt=2;
im_in2=medfilt2(permute(squeeze(real(W(37,yind(2):-1:yind(1),zind(2):-1:zind(1),dd,ff,tt))),[2,1]),[3,1]);
low_up_limit=[-ddp,ddp];
figure
subplot(2,1,1)
imagesc(im_in1,low_up_limit);colormap(AWAVE);axis image;axis off;
title('Test1(wave)');
subplot(2,1,2)
imagesc(im_in2,low_up_limit);colormap(AWAVE);axis image;axis off;
title('Test2(wave)');
figure
im_in1=permute(squeeze((mag(37,yind(2):-1:yind(1),zind(2):-1:zind(1)))),[2,1]);
im_in2=permute(squeeze(fa(37,yind(2):-1:yind(1),zind(2):-1:zind(1))),[2,1]);
subplot(2,1,1)
imagesc(im_in1);colormap(gray);axis image;axis off;
title('magnitude');
subplot(2,1,2)
imagesc(im_in2);colormap(gray);axis image;axis off;
title('FA');

%% X 2
im_in1=permute(squeeze(mu0_1(xind(2):-1:xind(1),40,zind(2):-1:zind(1))),[2,1]);
im_in2=permute(squeeze(mu0_2(xind(2):-1:xind(1),40,zind(2):-1:zind(1))),[2,1]);
im_in3=permute(squeeze(mu0_12(xind(2):-1:xind(1),40,zind(2):-1:zind(1))),[2,1]);
low_up_limit=[0,3000];
figure
subplot(3,6,1);
imagesc(real(im_in1),low_up_limit);colormap gray;axis image;axis off;
title('Re(\mu)-test1')
subplot(3,6,7);
imagesc(real(im_in2),low_up_limit);colormap gray;axis image;axis off;
title('Re(\mu)-test2')
subplot(3,6,13);
imagesc(real(im_in3),low_up_limit);colormap gray;axis image;axis off;
title('Re(\mu)-fusion')

low_up_limit=[0,1500];
subplot(3,6,4);
imagesc(imag(im_in1),low_up_limit);colormap gray;axis image;axis off;
title('Im(\mu)-test1')
subplot(3,6,10);
imagesc(imag(im_in2),low_up_limit);colormap gray;axis image;axis off;
title('Im(\mu)-test2')
subplot(3,6,16);
imagesc(imag(im_in3),low_up_limit);colormap gray;axis image;axis off;
title('Im(\mu)-fusion')


im_in1=permute(squeeze(mu1_1(xind(2):-1:xind(1),40,zind(2):-1:zind(1))),[2,1]);
im_in2=permute(squeeze(mu1_2(xind(2):-1:xind(1),40,zind(2):-1:zind(1))),[2,1]);
im_in3=permute(squeeze(mu1_12(xind(2):-1:xind(1),40,zind(2):-1:zind(1))),[2,1]);
low_up_limit=[0,500];
subplot(3,6,2);
imagesc(real(im_in1),low_up_limit);colormap gray;axis image;axis off;
title('Re(\mu\phi)-test1')
subplot(3,6,8);
imagesc(real(im_in2),low_up_limit);colormap gray;axis image;axis off;
title('Re(\mu\phi)-test2')
subplot(3,6,14);
imagesc(real(im_in3),low_up_limit);colormap gray;axis image;axis off;
title('Re(\mu\phi)-fusion')

subplot(3,6,5);
imagesc(imag(im_in1),low_up_limit);colormap gray;axis image;axis off;
title('Im(\mu\phi)-test1')
subplot(3,6,11);
imagesc(imag(im_in2),low_up_limit);colormap gray;axis image;axis off;
title('Im(\mu\phi)-test2')
subplot(3,6,17);
imagesc(imag(im_in3),low_up_limit);colormap gray;axis image;axis off;
title('Im(\mu\phi)-fusion')

im_in1=permute(squeeze(mu2_1(xind(2):-1:xind(1),40,zind(2):-1:zind(1))),[2,1]);
im_in2=permute(squeeze(mu2_2(xind(2):-1:xind(1),40,zind(2):-1:zind(1))),[2,1]);
im_in3=permute(squeeze(mu2_12(xind(2):-1:xind(1),40,zind(2):-1:zind(1))),[2,1]);
low_up_limit=[0,500];
subplot(3,6,3);
imagesc(real(im_in1),low_up_limit);colormap gray;axis image;axis off;
title('Re(\mu\zeta)-test1')
subplot(3,6,9);
imagesc(real(im_in2),low_up_limit);colormap gray;axis image;axis off;
title('Re(\mu\zeta)-test2')
subplot(3,6,15);
imagesc(real(im_in3),low_up_limit);colormap gray;axis image;axis off;
title('Re(\mu\zeta)-fusion');

subplot(3,6,6);
imagesc(imag(im_in1),low_up_limit);colormap gray;axis image;axis off;
title('Im(\mu\zeta)-test1')
subplot(3,6,12);
imagesc(imag(im_in2),low_up_limit);colormap gray;axis image;axis off;
title('Im(\mu\zeta)-test2')
subplot(3,6,18);
imagesc(imag(im_in3),low_up_limit);colormap gray;axis image;axis off;
title('Im(\mu\zeta)-fusion')
% return
tt=1;
im_in1=medfilt2(permute(squeeze(real(W(xind(2):-1:xind(1),40,zind(2):-1:zind(1),dd,ff,tt))),[2,1]),[3,1]);
tt=2;
im_in2=medfilt2(permute(squeeze(real(W(xind(2):-1:xind(1),40,zind(2):-1:zind(1),dd,ff,tt))),[2,1]),[3,1]);
low_up_limit=[-ddp,ddp];
figure
subplot(2,1,1)
imagesc(im_in1,low_up_limit);colormap(AWAVE);axis image;axis off;
title('Test1(wave)');
subplot(2,1,2)
imagesc(im_in2,low_up_limit);colormap(AWAVE);axis image;axis off;
title('Test2(wave)');
figure
im_in1=permute(squeeze((mag(xind(2):-1:xind(1),40,zind(2):-1:zind(1)))),[2,1]);
im_in2=permute(squeeze(fa(xind(2):-1:xind(1),40,zind(2):-1:zind(1))),[2,1]);
subplot(2,1,1)
imagesc(im_in1);colormap(gray);axis image;axis off;
title('magnitude');
subplot(2,1,2)
imagesc(im_in2);colormap(gray);axis image;axis off;
title('FA');


%% X 3
im_in1=permute(squeeze(mu0_1(xind(2):-1:xind(1),yind(2):-1:yind(1),15)),[2,1]);
im_in2=permute(squeeze(mu0_2(xind(2):-1:xind(1),yind(2):-1:yind(1),15)),[2,1]);
im_in3=permute(squeeze(mu0_12(xind(2):-1:xind(1),yind(2):-1:yind(1),15)),[2,1]);
low_up_limit=[0,3000];
figure
subplot(3,6,1);
imagesc(real(im_in1),low_up_limit);colormap gray;axis image;axis off;
title('Re(\mu)-test1')
subplot(3,6,7);
imagesc(real(im_in2),low_up_limit);colormap gray;axis image;axis off;
title('Re(\mu)-test2')
subplot(3,6,13);
imagesc(real(im_in3),low_up_limit);colormap gray;axis image;axis off;
title('Re(\mu)-fusion')

low_up_limit=[0,1500];
subplot(3,6,4);
imagesc(imag(im_in1),low_up_limit);colormap gray;axis image;axis off;
title('Im(\mu)-test1')
subplot(3,6,10);
imagesc(imag(im_in2),low_up_limit);colormap gray;axis image;axis off;
title('Im(\mu)-test2')
subplot(3,6,16);
imagesc(imag(im_in3),low_up_limit);colormap gray;axis image;axis off;
title('Im(\mu)-fusion')


im_in1=permute(squeeze(mu1_1(xind(2):-1:xind(1),yind(2):-1:yind(1),15)),[2,1]);
im_in2=permute(squeeze(mu1_2(xind(2):-1:xind(1),yind(2):-1:yind(1),15)),[2,1]);
im_in3=permute(squeeze(mu1_12(xind(2):-1:xind(1),yind(2):-1:yind(1),15)),[2,1]);
low_up_limit=[0,500];
subplot(3,6,2);
imagesc(real(im_in1),low_up_limit);colormap gray;axis image;axis off;
title('Re(\mu\phi)-test1')
subplot(3,6,8);
imagesc(real(im_in2),low_up_limit);colormap gray;axis image;axis off;
title('Re(\mu\phi)-test2')
subplot(3,6,14);
imagesc(real(im_in3),low_up_limit);colormap gray;axis image;axis off;
title('Re(\mu\phi)-fusion')

subplot(3,6,5);
imagesc(imag(im_in1),low_up_limit);colormap gray;axis image;axis off;
title('Im(\mu\phi)-test1')
subplot(3,6,11);
imagesc(imag(im_in2),low_up_limit);colormap gray;axis image;axis off;
title('Im(\mu\phi)-test2')
subplot(3,6,17);
imagesc(imag(im_in3),low_up_limit);colormap gray;axis image;axis off;
title('Im(\mu\phi)-fusion')

im_in1=permute(squeeze(mu2_1(xind(2):-1:xind(1),yind(2):-1:yind(1),15)),[2,1]);
im_in2=permute(squeeze(mu2_2(xind(2):-1:xind(1),yind(2):-1:yind(1),15)),[2,1]);
im_in3=permute(squeeze(mu2_12(xind(2):-1:xind(1),yind(2):-1:yind(1),15)),[2,1]);
low_up_limit=[0,500];
subplot(3,6,3);
imagesc(real(im_in1),low_up_limit);colormap gray;axis image;axis off;
title('Re(\mu\zeta)-test1')
subplot(3,6,9);
imagesc(real(im_in2),low_up_limit);colormap gray;axis image;axis off;
title('Re(\mu\zeta)-test2')
subplot(3,6,15);
imagesc(real(im_in3),low_up_limit);colormap gray;axis image;axis off;
title('Re(\mu\zeta)-fusion');

subplot(3,6,6);
imagesc(imag(im_in1),low_up_limit);colormap gray;axis image;axis off;
title('Im(\mu\zeta)-test1')
subplot(3,6,12);
imagesc(imag(im_in2),low_up_limit);colormap gray;axis image;axis off;
title('Im(\mu\zeta)-test2')
subplot(3,6,18);
imagesc(imag(im_in3),low_up_limit);colormap gray;axis image;axis off;
title('Im(\mu\zeta)-fusion')
% return
tt=1;
im_in1=medfilt2(permute(squeeze(real(W(xind(2):-1:xind(1),yind(2):-1:yind(1),15,dd,ff,tt))),[2,1]),[3,1]);
tt=2;
im_in2=medfilt2(permute(squeeze(real(W(xind(2):-1:xind(1),yind(2):-1:yind(1),15,dd,ff,tt))),[2,1]),[3,1]);
low_up_limit=[-ddp,ddp];
figure
subplot(2,1,1)
imagesc(im_in1,low_up_limit);colormap(AWAVE);axis image;axis off;
title('Test1(wave)');
subplot(2,1,2)
imagesc(im_in2,low_up_limit);colormap(AWAVE);axis image;axis off;
title('Test2(wave)');
figure
im_in1=permute(squeeze((mag(xind(2):-1:xind(1),yind(2):-1:yind(1),15))),[2,1]);
im_in2=permute(squeeze(fa(xind(2):-1:xind(1),yind(2):-1:yind(1),15)),[2,1]);
subplot(2,1,1)
imagesc(im_in1);colormap(gray);axis image;axis off;
title('magnitude');
subplot(2,1,2)
imagesc(im_in2);colormap(gray);axis image;axis off;
title('FA');
