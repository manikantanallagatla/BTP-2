%%%Gabor Feature Extraction
function [features] = gaborfeatures(temp)
%% preprocess
% close all;
features = [];

%Read the original RGB input image
% image=imread('english (1).png');
%convert it to gray scale
try
    image_gray=rgb2gray(temp);
catch
    image_gray = temp;
end
%resize the image to 160x160 pixels
image_resize=imresize(image_gray, [800 800]);
%apply im2double
image_resize=im2double(image_resize);
image_energy = 0;
for x=1:800
    for y=1:800
        image_energy = image_energy + (image_resize(x,y))*(image_resize(x,y));
    end
end

% %% feature extraction
% %Gabor filter size 7x7 and orientation 90 degree
% %declare the variables
% gamma=0.3; %aspect ratio
% psi=0; %phase
% bw=8; %bandwidth or effective width
% lambda8=8; % wavelength
% lambda4=4;
% lambda2=2;
% theta=0; %orientation
% temp_energy1 = 0;
% temp_energy2 = 0;
% temp_energy3 = 0;
% temp_energy4 = 0;
% temp_energy5 = 0;
% temp_energy6 = 0;
% for x=1:800
%     for y=1:800
%         x_theta=image_resize(x,y)*cos(theta)+image_resize(x,y)*sin(theta);
%         y_theta=-image_resize(x,y)*sin(theta)+image_resize(x,y)*cos(theta);
%         temp_store = exp(-(x_theta.^2/2*bw^2+ gamma^2*y_theta.^2/2*bw^2))*cos(2*pi/lambda8*x_theta+psi);
%         temp_energy1 = temp_energy1 + temp_store*temp_store;
%         temp_store = exp(-(x_theta.^2/2*bw^2+ gamma^2*y_theta.^2/2*bw^2))*sin(2*pi/lambda8*x_theta+psi);
%         temp_energy2 = temp_energy2 + temp_store*temp_store;
%         temp_store = exp(-(x_theta.^2/2*bw^2+ gamma^2*y_theta.^2/2*bw^2))*cos(2*pi/lambda4*x_theta+psi);
%         temp_energy3 = temp_energy3 + temp_store*temp_store;
%         temp_store = exp(-(x_theta.^2/2*bw^2+ gamma^2*y_theta.^2/2*bw^2))*sin(2*pi/lambda4*x_theta+psi);
%         temp_energy4 = temp_energy4 + temp_store*temp_store;
%         temp_store = exp(-(x_theta.^2/2*bw^2+ gamma^2*y_theta.^2/2*bw^2))*cos(2*pi/lambda2*x_theta+psi);
%         temp_energy5 = temp_energy5 + temp_store*temp_store;
%         temp_store = exp(-(x_theta.^2/2*bw^2+ gamma^2*y_theta.^2/2*bw^2))*sin(2*pi/lambda2*x_theta+psi);
%         temp_energy6= temp_energy6 + temp_store*temp_store;
%         
%     end
% end
% features = [features (temp_energy1/image_energy) (temp_energy2/image_energy) (temp_energy3/image_energy) (temp_energy4/image_energy) (temp_energy5/image_energy) (temp_energy6/image_energy)];
% 
% theta=pi/6; %orientation
% temp_energy1 = 0;
% temp_energy2 = 0;
% temp_energy3 = 0;
% temp_energy4 = 0;
% temp_energy5 = 0;
% temp_energy6 = 0;
% for x=1:800
%     for y=1:800
%         x_theta=image_resize(x,y)*cos(theta)+image_resize(x,y)*sin(theta);
%         y_theta=-image_resize(x,y)*sin(theta)+image_resize(x,y)*cos(theta);
%         temp_store = exp(-(x_theta.^2/2*bw^2+ gamma^2*y_theta.^2/2*bw^2))*cos(2*pi/lambda8*x_theta+psi);
%         temp_energy1 = temp_energy1 + temp_store*temp_store;
%         temp_store = exp(-(x_theta.^2/2*bw^2+ gamma^2*y_theta.^2/2*bw^2))*sin(2*pi/lambda8*x_theta+psi);
%         temp_energy2 = temp_energy2 + temp_store*temp_store;
%         temp_store = exp(-(x_theta.^2/2*bw^2+ gamma^2*y_theta.^2/2*bw^2))*cos(2*pi/lambda4*x_theta+psi);
%         temp_energy3 = temp_energy3 + temp_store*temp_store;
%         temp_store = exp(-(x_theta.^2/2*bw^2+ gamma^2*y_theta.^2/2*bw^2))*sin(2*pi/lambda4*x_theta+psi);
%         temp_energy4 = temp_energy4 + temp_store*temp_store;
%         temp_store = exp(-(x_theta.^2/2*bw^2+ gamma^2*y_theta.^2/2*bw^2))*cos(2*pi/lambda2*x_theta+psi);
%         temp_energy5 = temp_energy5 + temp_store*temp_store;
%         temp_store = exp(-(x_theta.^2/2*bw^2+ gamma^2*y_theta.^2/2*bw^2))*sin(2*pi/lambda2*x_theta+psi);
%         temp_energy6= temp_energy6 + temp_store*temp_store;
%         
%     end
% end
% features = [features (temp_energy1/image_energy) (temp_energy2/image_energy) (temp_energy3/image_energy) (temp_energy4/image_energy) (temp_energy5/image_energy) (temp_energy6/image_energy)];
% 
% theta=pi/3; %orientation
% temp_energy1 = 0;
% temp_energy2 = 0;
% temp_energy3 = 0;
% temp_energy4 = 0;
% temp_energy5 = 0;
% temp_energy6 = 0;
% for x=1:800
%     for y=1:800
%         x_theta=image_resize(x,y)*cos(theta)+image_resize(x,y)*sin(theta);
%         y_theta=-image_resize(x,y)*sin(theta)+image_resize(x,y)*cos(theta);
%         temp_store = exp(-(x_theta.^2/2*bw^2+ gamma^2*y_theta.^2/2*bw^2))*cos(2*pi/lambda8*x_theta+psi);
%         temp_energy1 = temp_energy1 + temp_store*temp_store;
%         temp_store = exp(-(x_theta.^2/2*bw^2+ gamma^2*y_theta.^2/2*bw^2))*sin(2*pi/lambda8*x_theta+psi);
%         temp_energy2 = temp_energy2 + temp_store*temp_store;
%         temp_store = exp(-(x_theta.^2/2*bw^2+ gamma^2*y_theta.^2/2*bw^2))*cos(2*pi/lambda4*x_theta+psi);
%         temp_energy3 = temp_energy3 + temp_store*temp_store;
%         temp_store = exp(-(x_theta.^2/2*bw^2+ gamma^2*y_theta.^2/2*bw^2))*sin(2*pi/lambda4*x_theta+psi);
%         temp_energy4 = temp_energy4 + temp_store*temp_store;
%         temp_store = exp(-(x_theta.^2/2*bw^2+ gamma^2*y_theta.^2/2*bw^2))*cos(2*pi/lambda2*x_theta+psi);
%         temp_energy5 = temp_energy5 + temp_store*temp_store;
%         temp_store = exp(-(x_theta.^2/2*bw^2+ gamma^2*y_theta.^2/2*bw^2))*sin(2*pi/lambda2*x_theta+psi);
%         temp_energy6= temp_energy6 + temp_store*temp_store;
%         
%     end
% end
% features = [features (temp_energy1/image_energy) (temp_energy2/image_energy) (temp_energy3/image_energy) (temp_energy4/image_energy) (temp_energy5/image_energy) (temp_energy6/image_energy)];
% 
% theta=pi/2; %orientation
% temp_energy1 = 0;
% temp_energy2 = 0;
% temp_energy3 = 0;
% temp_energy4 = 0;
% temp_energy5 = 0;
% temp_energy6 = 0;
% for x=1:800
%     for y=1:800
%         x_theta=image_resize(x,y)*cos(theta)+image_resize(x,y)*sin(theta);
%         y_theta=-image_resize(x,y)*sin(theta)+image_resize(x,y)*cos(theta);
%         temp_store = exp(-(x_theta.^2/2*bw^2+ gamma^2*y_theta.^2/2*bw^2))*cos(2*pi/lambda8*x_theta+psi);
%         temp_energy1 = temp_energy1 + temp_store*temp_store;
%         temp_store = exp(-(x_theta.^2/2*bw^2+ gamma^2*y_theta.^2/2*bw^2))*sin(2*pi/lambda8*x_theta+psi);
%         temp_energy2 = temp_energy2 + temp_store*temp_store;
%         temp_store = exp(-(x_theta.^2/2*bw^2+ gamma^2*y_theta.^2/2*bw^2))*cos(2*pi/lambda4*x_theta+psi);
%         temp_energy3 = temp_energy3 + temp_store*temp_store;
%         temp_store = exp(-(x_theta.^2/2*bw^2+ gamma^2*y_theta.^2/2*bw^2))*sin(2*pi/lambda4*x_theta+psi);
%         temp_energy4 = temp_energy4 + temp_store*temp_store;
%         temp_store = exp(-(x_theta.^2/2*bw^2+ gamma^2*y_theta.^2/2*bw^2))*cos(2*pi/lambda2*x_theta+psi);
%         temp_energy5 = temp_energy5 + temp_store*temp_store;
%         temp_store = exp(-(x_theta.^2/2*bw^2+ gamma^2*y_theta.^2/2*bw^2))*sin(2*pi/lambda2*x_theta+psi);
%         temp_energy6= temp_energy6 + temp_store*temp_store;
%         
%     end
% end
% features = [features (temp_energy1/image_energy) (temp_energy2/image_energy) (temp_energy3/image_energy) (temp_energy4/image_energy) (temp_energy5/image_energy) (temp_energy6/image_energy)];
% 
% theta=2*pi/3; %orientation
% temp_energy1 = 0;
% temp_energy2 = 0;
% temp_energy3 = 0;
% temp_energy4 = 0;
% temp_energy5 = 0;
% temp_energy6 = 0;
% for x=1:800
%     for y=1:800
%         x_theta=image_resize(x,y)*cos(theta)+image_resize(x,y)*sin(theta);
%         y_theta=-image_resize(x,y)*sin(theta)+image_resize(x,y)*cos(theta);
%         temp_store = exp(-(x_theta.^2/2*bw^2+ gamma^2*y_theta.^2/2*bw^2))*cos(2*pi/lambda8*x_theta+psi);
%         temp_energy1 = temp_energy1 + temp_store*temp_store;
%         temp_store = exp(-(x_theta.^2/2*bw^2+ gamma^2*y_theta.^2/2*bw^2))*sin(2*pi/lambda8*x_theta+psi);
%         temp_energy2 = temp_energy2 + temp_store*temp_store;
%         temp_store = exp(-(x_theta.^2/2*bw^2+ gamma^2*y_theta.^2/2*bw^2))*cos(2*pi/lambda4*x_theta+psi);
%         temp_energy3 = temp_energy3 + temp_store*temp_store;
%         temp_store = exp(-(x_theta.^2/2*bw^2+ gamma^2*y_theta.^2/2*bw^2))*sin(2*pi/lambda4*x_theta+psi);
%         temp_energy4 = temp_energy4 + temp_store*temp_store;
%         temp_store = exp(-(x_theta.^2/2*bw^2+ gamma^2*y_theta.^2/2*bw^2))*cos(2*pi/lambda2*x_theta+psi);
%         temp_energy5 = temp_energy5 + temp_store*temp_store;
%         temp_store = exp(-(x_theta.^2/2*bw^2+ gamma^2*y_theta.^2/2*bw^2))*sin(2*pi/lambda2*x_theta+psi);
%         temp_energy6= temp_energy6 + temp_store*temp_store;
%         
%     end
% end
% features = [features (temp_energy1/image_energy) (temp_energy2/image_energy) (temp_energy3/image_energy) (temp_energy4/image_energy) (temp_energy5/image_energy) (temp_energy6/image_energy)];
% 
% theta=5*pi/6; %orientation
% temp_energy1 = 0;
% temp_energy2 = 0;
% temp_energy3 = 0;
% temp_energy4 = 0;
% temp_energy5 = 0;
% temp_energy6 = 0;
% for x=1:800
%     for y=1:800
%         x_theta=image_resize(x,y)*cos(theta)+image_resize(x,y)*sin(theta);
%         y_theta=-image_resize(x,y)*sin(theta)+image_resize(x,y)*cos(theta);
%         temp_store = exp(-(x_theta.^2/2*bw^2+ gamma^2*y_theta.^2/2*bw^2))*cos(2*pi/lambda8*x_theta+psi);
%         temp_energy1 = temp_energy1 + temp_store*temp_store;
%         temp_store = exp(-(x_theta.^2/2*bw^2+ gamma^2*y_theta.^2/2*bw^2))*sin(2*pi/lambda8*x_theta+psi);
%         temp_energy2 = temp_energy2 + temp_store*temp_store;
%         temp_store = exp(-(x_theta.^2/2*bw^2+ gamma^2*y_theta.^2/2*bw^2))*cos(2*pi/lambda4*x_theta+psi);
%         temp_energy3 = temp_energy3 + temp_store*temp_store;
%         temp_store = exp(-(x_theta.^2/2*bw^2+ gamma^2*y_theta.^2/2*bw^2))*sin(2*pi/lambda4*x_theta+psi);
%         temp_energy4 = temp_energy4 + temp_store*temp_store;
%         temp_store = exp(-(x_theta.^2/2*bw^2+ gamma^2*y_theta.^2/2*bw^2))*cos(2*pi/lambda2*x_theta+psi);
%         temp_energy5 = temp_energy5 + temp_store*temp_store;
%         temp_store = exp(-(x_theta.^2/2*bw^2+ gamma^2*y_theta.^2/2*bw^2))*sin(2*pi/lambda2*x_theta+psi);
%         temp_energy6= temp_energy6 + temp_store*temp_store;
%         
%     end
% end
% features = [features (temp_energy1/image_energy) (temp_energy2/image_energy) (temp_energy3/image_energy) (temp_energy4/image_energy) (temp_energy5/image_energy) (temp_energy6/image_energy)];
I = image_resize;
[mag,phase] = imgaborfilt(I,8,0);
features = [features sum(sum(mag.^2))/image_energy std2(mag)];
[mag,phase] = imgaborfilt(I,8,30);
features = [features sum(sum(mag.^2))/image_energy std2(mag)];
[mag,phase] = imgaborfilt(I,8,60);
features = [features sum(sum(mag.^2))/image_energy std2(mag)];
[mag,phase] = imgaborfilt(I,8,90);
features = [features sum(sum(mag.^2))/image_energy std2(mag)];
[mag,phase] = imgaborfilt(I,8,120);
features = [features sum(sum(mag.^2))/image_energy std2(mag)];
[mag,phase] = imgaborfilt(I,8,150);
features = [features sum(sum(mag.^2))/image_energy std2(mag)];
[mag,phase] = imgaborfilt(I,4,0);
features = [features sum(sum(mag.^2))/image_energy std2(mag)];
[mag,phase] = imgaborfilt(I,4,30);
features = [features sum(sum(mag.^2))/image_energy std2(mag)];
[mag,phase] = imgaborfilt(I,4,60);
features = [features sum(sum(mag.^2))/image_energy std2(mag)];
[mag,phase] = imgaborfilt(I,4,90);
features = [features sum(sum(mag.^2))/image_energy std2(mag)];
[mag,phase] = imgaborfilt(I,4,120);
features = [features sum(sum(mag.^2))/image_energy std2(mag)];
[mag,phase] = imgaborfilt(I,4,150);
features = [features sum(sum(mag.^2))/image_energy std2(mag)];
[mag,phase] = imgaborfilt(I,2,0);
features = [features sum(sum(mag.^2))/image_energy std2(mag)];
[mag,phase] = imgaborfilt(I,2,30);
features = [features sum(sum(mag.^2))/image_energy std2(mag)];
[mag,phase] = imgaborfilt(I,2,60);
features = [features sum(sum(mag.^2))/image_energy std2(mag)];
[mag,phase] = imgaborfilt(I,2,90);
features = [features sum(sum(mag.^2))/image_energy std2(mag)];
[mag,phase] = imgaborfilt(I,2,120);
features = [features sum(sum(mag.^2))/image_energy std2(mag)];
[mag,phase] = imgaborfilt(I,2,150);
features = [features sum(sum(mag.^2))/image_energy std2(mag)];

end