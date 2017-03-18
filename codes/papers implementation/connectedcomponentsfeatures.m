function [features] = connectedcomponentsfeatures(temp)
%% preprocess
% close all;
features = [];
% temp = imread('english (1).png');
% figure,imshow(i);
try
    im=rgb2gray(temp);
catch
    im = temp;
end
threshold = graythresh(im);
temp=im2bw(im,threshold);
temp = ~temp;
temp = bwareaopen(temp,30);
re=temp;
k=0;
g=0;
x=0;
feature1 = [];
feature2 = [];
feature3 = [];
feature4 = [];
feature5 = [];
while k==0
    [fl re]=lines(re);
    [L Ne] = bwlabel(fl);
    for n=1:Ne
        i=fl;
        [f co]=find(L==n);
        inew=i(min(f):max(f),min(co):max(co));
%         figure,imshow(inew);
        area = (min(f)- max(f));
        area = area * (min(co)-max(co));
        height = max(f)-min(f);
        width = max(co)-min(co);
        if(width>3)
            if(height>10)
                if(area>15)
%                     inew = imresize(inew, [100 100]);
                    feature1 = [feature1 width/height];
                    feature2 = [feature2 sum(sum(inew))/(area)];
                    [L1 Ne1] = bwlabel(~inew);
                    feature3 = [feature3 Ne1];
                    bla = regionprops(true(size(inew)), inew,  'WeightedCentroid');
                    feature4 = [feature4 (bla.WeightedCentroid(1)/height)];
                    feature5 = [feature5 (bla.WeightedCentroid(2)/width)];
                end
            end
        end
                            
    end
    x=x+Ne;
    if size(re,1)==0
        k=k+1;
    end
    g=g+1;
end
features = [features mean(feature1) std(feature1) skewness(feature1) mean(feature2) std(feature2) skewness(feature2) mean(feature3) std(feature3) skewness(feature3) mean(feature4) std(feature4) skewness(feature4) mean(feature5) std(feature5) skewness(feature5)];
end