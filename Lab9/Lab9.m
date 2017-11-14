original=imbinarize(imread('tools.gif'));

figure
imshow(original);
title('Original');

B=strel('diamond',1);
% 
% eroded=imerode(original,B);
% figure
% imshow(eroded);
% title('Eroded Image');
% 
% dilated=imdilate(original,B);
% figure
% imshow(dilated);
% title('Dilated Image');
% 
% opened=imopen(original,B);
% figure
% imshow(opened);
% title('Opened Image');
% 
% closed=imclose(original,B);
% figure
% imshow(closed);
% title('Closed Image');

%%%%%%%%%%%%%%%%%%%%%% Task 2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% opened1=imopen(original,B);
% closed1=imclose(opened1,B);
% figure
% imshow(closed1);
% title('Open-Close');
% 
% closed2=imclose(original,B);
% opened2=imopen(closed2,B);
% figure
% imshow(opened2);
% title('Close-Open');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Task 3 %%%%%%%%%%%%%%%%%%%%%%

CH = imfill(original,'holes');
figure
% imshow(CH);
title('Filled Holes with Positive Noise');

H=imopen((CH-original),B);
figure
% imshow(H);
title('Only Holes');

CHopened=imopen(CH,B);
figure
% imshow(CHopened);
title('Filled Holes with Positive Noise Removed');

Reconstructed=CHopened-H;
figure
imshow(Reconstructed);
title('Final Reconstructed Image');

%%% The process first fills the holes in the image completely. Then it
%%% removes the white (Positive) noise by opening the image. An image
%%% including just the holes is obtaines by subtracting the filled hole
%%% image from the image. Then the final image is obtained by subtracting
%%% the image with just the holes from the image with filled holes. 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Task 4 %%%%%%%%%%%%%%%%%%%%%

marker=imopen(original,B);
mask=imclose(original,B);
conn=4;

IM = imreconstruct(marker,mask,conn);

figure
imshow(IM);
title('Reconstructed Image');

%%% The result of reconstruction is identical to the result of the above task just the
%%% process is different. 
%%% Morphological reconstruction can be thought of conceptually as repeated
%%% dilations of an image, called the marker image, until the contour of the marker
%%% image fits under a second image, called the mask image. In morphological 
%%% reconstruction, the peaks in the marker image ?spread out,? or dilate.










