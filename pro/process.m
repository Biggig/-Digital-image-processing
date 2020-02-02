%clc,clear,close all;

% Test1
ori = imread('0628.bmp');
ori2 = imread('0901.bmp');

% Test2
%ori = imread('1554.bmp');
%ori2 = imread('0628.bmp');

% Test3
%ori = imread('0201.bmp');
%ori2 = imread('0153.bmp');

M = im2double(ori);
[R1, I1] = retinex(M, 19, 80);
M2 = im2double(ori2);
[R2, I2] = retinex(M2, 19, 80);

figure(2)
subplot(4,3,1),imshow(M);title('原图1')
subplot(4,3,2),imshow(R1);title('反射1')
subplot(4,3,3),imshow(I1);title('光照1')

subplot(4,3,4),imshow(M2);title('原图2')
subplot(4,3,5),imshow(R2);title('反射2')
subplot(4,3,6),imshow(I2);title('光照2')

%%% 光照迁移处理 %%%
% 图1反射与图2光照合成
new_img = exp(log(R1 + 0.00000001) + log(I2 + 0.00000001));
new_img = mat2gray(new_img);
subplot(4, 3, 7),imshow(new_img);title('图1反射与图2光照合成')

new_img2 = histeq(im2uint8(new_img));
subplot(4, 3, 8),imshow(new_img2);title('前一张图均衡化')

% 图2反射与图1光照合成
new_img3 = exp(log(R2 + 0.00000001) + log(I1 + 0.00000001));
new_img3 = mat2gray(new_img3);
subplot(4, 3, 10),imshow(new_img3);title('图2反射与图1光照合成')

new_img4 = histeq(im2uint8(new_img3));
subplot(4, 3, 11),imshow(new_img4);title('前一张图均衡化')
%%% 光照迁移处理 %%%