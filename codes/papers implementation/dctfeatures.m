%%%Feature Extraction
function [features] = dctfeatures(temp)
% close all;
features = [];
%% Binarise image
% img = 'telugu (1).jpg';
% i = imread(img);
im = imresize(temp,[1600 800]);
% figure,imshow(i);
try
    im=rgb2gray(im);
catch
end
threshold = graythresh(im);
temp=im2bw(im,threshold);
temp = ~temp;
% figure,imshow(temp);

%% opening and Closing
temp = bwareaopen(temp,30);
SE = strel('square',3);
temp = imdilate(temp,SE);
% figure,imshow(temp);
temp = imerode(temp,SE);
% % name = strcat('new/',img(1:end-3),'mat');
% % m=matfile(sprintf(name, temp),'writable',true);
% % m.temp = temp;
%    
% % catch
% %     disp('small error')
% % end
% 
% 
% % figure, imshow(temp);

%% Apply DCT
% load 'new/english (1).mat'
temp = dct2(temp);
minimum = min(min(temp));
maximum = max(max(temp));
temp = temp-minimum;
temp = temp/(maximum-minimum);

temp_array = [];
for i = 1:400
    temp_array = [temp_array temp(i,i)];
end
features = [features std(temp_array)];
temp_array = [];
for i = 1:399
    temp_array = [temp_array temp(i,i+1)];
end
features = [features std(temp_array)];
temp_array = [];
for i = 1:399
    temp_array = [temp_array temp(i+1,i)];
end
features = [features std(temp_array)];
temp_array = [];
temp1 = flipud(temp);
for i = 1:400
    temp_array = [temp_array temp1(i,i)];
end
features = [features std(temp_array)];
temp_array = [];
for i = 1:399
    temp_array = [temp_array temp1(i,i+1)];
end
features = [features std(temp_array)];
temp_array = [];
for i = 1:399
    temp_array = [temp_array temp1(i+1,i)];
end
features = [features std(temp_array)];
% figure, imagesc(temp);
% figure, imshow(temp);

ll = temp(1:800, 1:400);
hl = temp(801:1600, 1:400);
lh = temp(1:800, 401:800);
hh = temp(801:1600, 401:800);
features = [features std2(ll) std2(hl) std2(lh) std2(hh) mean2(ll) mean2(hl) mean2(lh) mean2(hh)];

%% Apply DWT
[cA,cH,cV,cD] = dwt2(temp,'db9');
features = [features std2(cA) std2(cH) std2(cV) std2(cD) mean2(cA) mean2(cH) mean2(cV) mean2(cD)];

