close all
temp = imread('english (5).png');
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
%         if(width<10)
            if(height<10)
%                 if(area>15)
                    
%                     inew = imresize(inew, [100 100]);
                    figure,imshow(inew);
%                 end
            end
%         end
                            
    end
    x=x+Ne;
    if size(re,1)==0
        k=k+1;
    end
    g=g+1;
end