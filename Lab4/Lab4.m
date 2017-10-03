%{
%***********************************       Task 1      **********************************
image = imread('peppers.png');

filter1=ones(3,3)/9;  
filter2=ones(5,5)/25;
filter3=ones(15,15)/225;
filter4=ones(35,35)/1225;

filteredimage1=imfilter(image,filter1);
filteredimage2=imfilter(image,filter2);
filteredimage3=imfilter(image,filter3);
filteredimage4=imfilter(image,filter4);

figure
imshow(image);
title('Original Image');

figure
imshow(filteredimage1);
title('3x3');

figure
imshow(filteredimage2);
title('5x5');

figure
imshow(filteredimage3);
title('15x15');

figure
imshow(filteredimage4);
title('35x35');

%As the size of the filter is increased detailes tend to hide and the
%blurness of the image increases. The reason is that as the size of the
%avearging filter is increased the original image pixels start to average
%more and they start having value more like to each other and the
%difference between pixels values decreases due to which details start to
%hide.

weightedfilter=[1 2 1;...
                2 4 2;...
                1 2 1]./16;
filteredimage5=imfilter(image,weightedfilter);
figure
imshow(filteredimage5);
title('weighted filter');

filteredimage6=imgaussfilt(image);
figure
imshow(filteredimage6);
title('Gaussian Filter');
%}
%weighted filters give image details according to the weights. Where the
%weights are more the image is clearer whereas the details are less towards
%the edges where the weights are less.

%***********************************       Task 2      **********************************
pepper=imread('peppers.png');
peppers=rgb2gray(pepper);

sobelfilter=fspecial('sobel');
prewittfilter=fspecial('prewitt');
laplacianfilter=fspecial('laplacian');

sobel=imfilter(peppers,sobelfilter);
prewitt=imfilter(peppers,prewittfilter);
roberts=edge(peppers,'roberts');
laplace=imfilter(peppers,laplacianfilter);

figure
imshow(pepper);
title('Original Image');

figure
imshow(sobel);
title('Sobel');

figure
imshow(prewitt);
title('Prewitt');

figure
imshow(roberts);
title('Roberts');

figure
imshow(laplace);
title('Laplace');