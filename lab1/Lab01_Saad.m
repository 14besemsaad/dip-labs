%Saad Bilal
%BESE 5A

% Reading an image
img1 = imread('res/sample1.jpg');
img2 = imread('res/sample2.jpg');


%#############################################################################
% Task 1: Read any of default Images in Matlab and show the image using      #
% imshow, subplot andimagesc commands.Usedifferentcolormptodisplaytheimages  #                                                               #
%#############################################################################
subplot(1,2,1),imshow(img1);
subplot(1,2,2),imshow(img2);

%imshow(img1);
%imagesc(img1);


%#############################################################################
% Task 2: Use any image and separate red, green and blue component/ channel  #
% in image.                                                                  #
%#############################################################################
red = img1(:,:,1);
%imshow(red);
%disp(red);

green = img1(:,:,2);
%imshow(green);
%disp(green);

blue = img1(:,:,3);
%imshow(blue);
%disp(blue);


%#############################################################################
% Task 3: Read any image (using imread command) then resize it and then      #
% store it bmp format.                                                       #
%#############################################################################
resized = imresize(img1, 0.5);
imwrite(resized,'res/sample1_resized_matlab.bmp')