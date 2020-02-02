function [ R, I ] = retinex( S, hsize, sigma )
%RETINEX 
%   ʵ�ֵ��߶�Retinex�㷨��������̬ͬ�˲��������һ��
%   Input:  L       - ԭͼ��
%   Output: R       - ����ɷ�
%           I       - ���ճɷ�


h = fspecial('gaussian', hsize, sigma);        % �����˹�˲���
I = imfilter(S, h);
R = exp(log(S+0.00000001)-log(I+0.00000001));
% �궨
I = mat2gray(I);
R = mat2gray(R);
end

