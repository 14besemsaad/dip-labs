% Author: Mohammad Saad
% Reg.No.: 111502
% Date: 12/12/2017

%% Image segmentation
% In computer vision, segmentation is the process to divide, or segment an
% input digital image into a meaningful representation that is simpler to
% analyze.

% Thresholding is the most simple form of segmentation. In today's task we
% use industry standard the Otsu's method to define threshold value.
% Basically the method assumes that there are two classes: the foreground
% and the background, the input has a bi-modal histogram. It varies the
% threshold to get minimal intraclass variance. The result is a binary
% image with background and foreground.

% Likewise, color image segmentation assumes that objects are 
% distinctively colored. In this lab we extend simple segmentation 
% using thresholding to select only particular objects with color 
% homogeneity.

%% Today's task
% Count the objects of some user defined color.
% Pseudocode.
% 1) Read input image
% 2) Use thresholding to segment foreground from background
% 3) Clean the binary image using morphological filtering
% 4) Label the objects using color values
% 5) Ask the user to select some color
% 6) Segment and count the objects with specified color

% Note. For the sake of learning and simplicity we assume that,
% the objects are homogeneously colored, isolated.
% the background is uniformly well lit.

clear all
close all

%% INIT

%load input color imageimage
im = im2double(imread('mnms.jpg'));
[M N K] = size(im);

% read RGB channels separately
imR = squeeze(im(:,:,1));
imB = squeeze(im(:,:,2));
imG = squeeze(im(:,:,3));

%% Task 1. Thresholding

% Input. R, G and B color channels
% Output. binary image

bw = zeros(M,N);

% Binarize each color channel using im2bw()
% HINT. use matlab graythresh() to define the threshold
% to convert intensity image to binary image

bwR=im2bw(imR,graythresh(imR));
bwB=im2bw(imB,graythresh(imB));
bwG=im2bw(imG,graythresh(imG));

% combine the three masks to get single binary image

bw=bwR & bwB & bwG;

figure, imshow(bw)

%% Task2. Morphological processing

% Input. binary mask
% Output. cleaned binary mask

imClean = zeros(M,N);

% Apply three operations in sequence on the mask
% imopen() using disk structuring element of size 3
% imfill() to fill holes
% imclearborder() to suppress light structures connected to border

SE=strel('disk',3);
bw=imcomplement(bw);
imClean=imopen(bw,SE);
imClean=imfill(imClean,'holes');
imClean=imclearborder(imClean);

figure, imshow(imClean)

%% Task 3. Labeling connected components

% Input. clean binary mask
% Output. labeled image and total number of components found

labels = []; numlabels = 0;

% use bwlabel() to get labeled matrix and # of labels

[labels,numlabels] = bwlabel(imClean);

%% Task 4. RGB labeled image

% compute median color for all labeled connected components

% Input. labeled image
% Output. RGB labeled image with median RGB values as labels

rLabel = zeros(M,N);
gLabel = zeros(M,N);
bLabel = zeros(M,N);

% Pseudocode.
% Iterate thru the connected components one-by-one
% compute median RGB values
% return RGB labeled image

for i=1:numlabels,
    rLabel(labels==i) = median(imR(labels==i));
    gLabel(labels==i) = median(imG(labels==i));
    bLabel(labels==i) = median(imB(labels==i));
    
end

% concatenate to get RGB labeled image
imLabel = cat(3,rLabel,gLabel,bLabel);
figure, imshow(imLabel)

%% Task 5. Select color to segment

% HINT. use ginput() to get coordinates from user
[x y] = ginput(1);
selColor = imLabel(floor(y),floor(x),:);

%% Task 6. L*a*b* colorspace

% L*a*b* color space
% luminosity 'L*' or brightness layer, 
% chromaticity layer 'a*' indicating where color falls along the red-green axis,and 
% chromaticity layer 'b*' indicating where the color falls along the blue-yellow axis.

% For color metric in next task, we want isolate luminance from chrominance (the color)
% To do this L*a*b* colorspace is used.
% convert colorspace for labeled image (Task 4) &selected color (Task 5).

C = makecform('srgb2lab');
imLAB = applycform(imLabel,C);
imSelLAB = applycform(selColor,C);

% we only use a* and b* components
imA = imLAB(:,:,2);
imB = imLAB(:,:,3);

imSelA = imSelLAB(:,:,2);
imSelB = imSelLAB(:,:,3);

%% Task 7. Color metric

% Input. chrominance a* and b* for RGB labeled image and selected color
% Output. binary mask with components with selected color

distThresh = 10;
imMask = zeros(M,N);

% Compute eucledian distance between selected color and color components

distance = sqrt((imA-imSelA).^2+(imB-imSelB).^2);


%% Task 8. Segmentation

% Input. binary mask with components with selected color
% Output. segmented image using the mask

imSeg = zeros(M,N);
imMask(distance <= distThresh)=1;
imSeg=imMask;
imSeg=im.*repmat(imMask,[1,1,3]);
figure,imshow(imSeg)
