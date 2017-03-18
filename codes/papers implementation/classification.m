%%%Classification using KNN
%% Strore X_train,Y_train,X_test,Y_test
train_size = 50;
total_size = 200;
X_train = [];
Y_train = [];
X_test = [];
Y_test = [];
temp = 0;
disp('Loading train set');
for i = 1:train_size
%     load(['new/english (' num2str(i) ').mat'])
    temp = imread(strcat('english (',num2str(i),').png'));
    try
        temp = gaborfeatures(temp);
        X_train = [X_train; temp];
        Y_train = [Y_train; 1];
    catch
        disp('small error')
    end
end
for i = 1:train_size
%     load(['new/hindi (' num2str(i) ').mat'])
    temp = imread(strcat('hindi (',num2str(i),').png'));
    try
        temp = gaborfeatures(temp);
        X_train = [X_train; temp];
        Y_train = [Y_train; 2];
    catch
        disp('small error')
    end
end
for i = 1:train_size
%     load(['new/telugu (' num2str(i) ').mat'])
    temp = imread(strcat('telugu (',num2str(i),').jpg'));
    try
        temp = gaborfeatures(temp);
        X_train = [X_train; temp];
        Y_train = [Y_train; 3];
    catch
        disp('small error')
    end
end
for i = 1:25
%     load(['new/english (' num2str(i) ').mat'])
    temp = imread(strcat('englishgoogle (',num2str(i),').jpeg'));
    try
        temp = gaborfeatures(temp);
        X_train = [X_train; temp];
        Y_train = [Y_train; 1];
    catch
        disp('small error')
    end
end
for i = 1:3
%     load(['new/hindi (' num2str(i) ').mat'])
    temp = imread(strcat('hindigoogle (',num2str(i),').jpeg'));
    try
        temp = gaborfeatures(temp);
        X_train = [X_train; temp];
        Y_train = [Y_train; 2];
    catch
        disp('small error')
    end
end
 for i = 1:25
%     load(['new/telugu (' num2str(i) ').mat'])
    temp = imread(strcat('telugugoogle (',num2str(i),').jpeg'));
    try
        temp = gaborfeatures(temp);
        X_train = [X_train; temp];
        Y_train = [Y_train; 3];
    catch
        disp('small error')
    end
 end
disp('loading test set')
for i = 26:27
%     load(['new/english (' num2str(i) ').mat'])
    temp = imread(strcat('englishgoogle (',num2str(i),').jpeg'));
    try
        temp = gaborfeatures(temp);
        X_test = [X_test; temp];
        Y_test = [Y_test; 1];
    catch
        disp('small error')
    end
end
% for i = 1:3
% %     load(['new/hindi (' num2str(i) ').mat'])
%     temp = imread(strcat('hindigoogle (',num2str(i),').jpeg'));
%     try
%         temp = gaborfeatures(temp);
%         X_test = [X_test; temp];
%         Y_test = [Y_test; 2];
%     catch
%         disp('small error')
%     end
% end
 for i = 26:30
%     load(['new/telugu (' num2str(i) ').mat'])
    temp = imread(strcat('telugugoogle (',num2str(i),').jpeg'));
    try
        temp = gaborfeatures(temp);
        X_test = [X_test; temp];
        Y_test = [Y_test; 3];
    catch
        disp('small error')
    end
 end
 
 %% KNN
 disp('testing')
%  load 'X_train.mat'
%  load 'X_test.mat'
%  load 'Y_train.mat'
%  load 'Y_test.mat'
%  k = 250;
%  class = knnclassify(X_test, X_train, Y_train,k);
%  pred = Y_test == class;
%  sum(pred)
%  
 %% SVM
 X_train(isnan(X_train)) = 0;
 X_test(isnan(X_test)) = 0;
 result = multisvm(X_train,Y_train,X_test);
 pred = Y_test == result;
 sum(pred)/size(pred,1)*100
 