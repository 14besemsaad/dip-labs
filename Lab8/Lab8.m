% cap = im2double(imread('Cap.jpg'));
% % PQ=paddedsize(size(cap));
% 
% %btw=butterworth(PQ(1),PQ(2),D0,1)
% 
% F2 = fft2(cap);
% F = fftshift(F2);
% 
% D = abs(F);
% D0 = 100 ; n = 1;
% 
% H =  1 ./ ( 1+ (D./D0).^(2*n));
% Hc = imcomplement(H);
% G = F .* H;
% Gc = F .* Hc;
% 
% Gi = ifft2(G);
% figure, imshow(Gi);
% title('After High Pass Filter');
% 
% Gic = ifft2(Gc);
% figure, imshow(Gic);
% title('After Low Pass Filter');
% 
% figure, imshow(cap);
% title('Original');
% 
% %%Fourier Spectrum
% figure, imshow((F));
% title('Fourier Spectrum Of Image');

%%% Task B

cameraman=im2double(imread('cameraman.tif'));
dft=fft2(cameraman);











