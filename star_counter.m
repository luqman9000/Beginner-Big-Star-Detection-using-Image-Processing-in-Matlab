close all, clear all, clc
startingFolder = 'C:\Users\WHOAMI\Documents\MATLAB\star counter';
if ~exist(startingFolder, 'dir')
  % If that folder doesn't exist, just start in the current folder.
  startingFolder = pwd;
end
defaultFileName = fullfile(startingFolder, '*.jpg');
[baseFileName, folder] = uigetfile(defaultFileName, 'Select a file');
if baseFileName == 0
 
  return;
end
fullFileName = fullfile(folder, baseFileName)
a=imread(fullFileName);
b=rgb2gray(a);
bw = im2bw(b);
SE = strel('disk',2);
erode = imerode(bw,SE);
st = regionprops(erode, 'BoundingBox');
subplot(231),imshow(a),title('Original Object')
subplot(232),imshow(b),title('Greyscale Object')
subplot(233),imshow(bw),title('Binary Object')
subplot(234),imshow(erode),title('Eroded Object')
subplot(235),imshow(a),title('Boundary Box')
hold on 
for k = 1 : length(st)
    CurrBB = st(k).BoundingBox;
    rectangle('Position', [CurrBB(1),CurrBB(2),CurrBB(3),CurrBB(4)],'EdgeColor','r','LineWidth',2)
end
hold off



