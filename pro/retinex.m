function [ R, I ] = retinex( S, hsize, sigma )
%RETINEX 
%   实现单尺度Retinex算法，流程与同态滤波处理过程一致
%   Input:  L       - 原图像
%   Output: R       - 反射成分
%           I       - 光照成分


h = fspecial('gaussian', hsize, sigma);        % 构造高斯滤波器
I = imfilter(S, h);
R = exp(log(S+0.00000001)-log(I+0.00000001));
% 标定
I = mat2gray(I);
R = mat2gray(R);
end

