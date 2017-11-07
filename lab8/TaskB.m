
img = imread('cameraman.tif');
figure
subplot(1,2,1);
imshow(img);
title('Original Image');

img = im2double(img);
PQ = 2*size(img);
FT = fft2(img,PQ(1),PQ(2));
FT = fftshift(FT);

% Question 1
min(min(FT))
max(max(FT))
%%%%%%%%%%%%%

subplot(1,2,2);
imshow(log(1 + abs(FT)), []);
title('FT');



% Question 2

% Question 2 Ideal
img = imread('cameraman.tif');

PQ = 2*size(img);
[U, V] = dftuv(PQ(1), PQ(2));
D0 = 0.05*PQ(1);
H =  double((sqrt(U.^2 + V.^2)) <=D0);
FT = fft2(im2double(img),PQ(1),PQ(2));
lowpassed = real(ifft2(H.*FT)); 
lowpassed = lowpassed(1:size(img,1), 1:size(img,2));

figure (2)
subplot(1,2,1)
imshow(lowpassed, []);
title('Ideal Filtered')

%Question 2 Butterworth
img = imread('cameraman.tif');
PQ = 2*size(img);
[U, V] = dftuv(PQ(1), PQ(2));
D0 = 0.05*PQ(1);
H =  1./(1 + ((sqrt(U.^2 + V.^2))./D0).^(2*1));
FT = fft2(im2double(img),PQ(1),PQ(2));
lowpassed = real(ifft2(H.*FT)); 
lowpassed = lowpassed(1:size(img,1), 1:size(img,2));

subplot(1,2,2)
imshow(lowpassed, []);
title('Butterworth Filtered')