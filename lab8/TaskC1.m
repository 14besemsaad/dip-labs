img = imread('football.jpg');
figure
subplot(1,2,1)
imshow(img)
title('Original Image');

PQ = size(img);
D0 = 0.05*PQ(1);
[U, V] = dftuv(PQ(1), PQ(2));
H = 1 - exp(-((sqrt(U.^2 + V.^2)).^2)./(2*(D0^2)));
F = fft2(double(img),size(H,1),size(H,2));

highpassed = real(ifft2(H.*F)); 
highpassed = highpassed(1:size(img,1), 1:size(img,2));

subplot(1,2,2)
imshow(highpassed, [])
title('Guassian High Passed');