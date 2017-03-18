function [fl re]=lines(im_texto)
% Divide text in lines
% im_texto->input image; fl->first line; re->remain line
% Example:
% im_texto=imread('TEST_3.jpg');
% [fl re]=lines(im_texto);
% subplot(3,1,1);imshow(im_texto);title('INPUT IMAGE')
% subplot(3,1,2);imshow(fl);title('FIRST LINE')
% subplot(3,1,3);imshow(re);title('REMAIN LINES')
[f co]=find(im_texto==1);
im_texto=im_texto(min(f):max(f),min(co):max(co));
num_filas=size(im_texto,1);
for s=1:num_filas
    if sum(im_texto(s,:))==0
        nm=im_texto(1:s-1, :); % First line matrix
        rm=im_texto(s:end, :);% Remain line matrix
        [f co]=find(nm==1);
        fl=nm(min(f):max(f),min(co):max(co));
        [f co]=find(rm==1);
        re=rm(min(f):max(f),min(co):max(co));
        %*-*-*Uncomment lines below to see the result*-*-*-*-
        %         subplot(2,1,1);imshow(fl);
        %         subplot(2,1,2);imshow(re);
        break
    else
        fl=im_texto;%Only one line.
        
        %figure,imshow(fl);
        %figure,imshow(originalfl);
        re=[ ];
        
    end
end