%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Task 1

original=imread('cameraman.tif');

gaussian=imnoise(original,'gaussian');
poisson=imnoise(original,'poisson');
s_and_p=imnoise(original,'salt & pepper');
speckle=imnoise(original,'speckle');
salt=Pepper_Or_Salt(original,0.2,2,120,255);
pepper=Pepper_Or_Salt(original,0.2,1,0,255);

figure('Name','Noises','NumberTitle','off')
subplot 331
imshow(gaussian);
title('Gaussian Noise');
subplot 332
imshow(poisson);
title('Poisson Noise');
subplot 333
imshow(s_and_p);
title('Salt and Pepper Noise');
subplot 334
imshow(speckle);
title('Speckle Noise');
subplot 335
imshow(salt);
title('Only Salt Noise');
subplot 336
imshow(pepper);
title('Only Pepper Noise');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Task 2

%%%% Arithmetic Mean
average=ones(3,3)/9;

% figure('Name','Arithmetic Mean','NumberTitle','off')
% subplot 331
% imshow(imfilter(gaussian,average));
% title('Gaussian');
% subplot 332
% imshow(imfilter(poisson,average));
% title('Poisson');
% subplot 333
% imshow(imfilter(s_and_p,average));
% title('Salt and Pepper');
% subplot 334
% imshow(imfilter(speckle,average));
% title('Speckle');
% subplot 335
% imshow(imfilter(salt,average));
% title('Only Salt');
% subplot 336
% imshow(imfilter(pepper,average));
% title('Only Pepper');


%%%% Min Filter

% figure('Name','Min Filter','NumberTitle','off')
% subplot 331
% imshow(ordfilt2(gaussian,1,ones(3,3)));
% title('Gaussian');
% subplot 332
% imshow(ordfilt2(poisson,1,ones(3,3)));
% title('Poisson');
% subplot 333
% imshow(ordfilt2(s_and_p,1,ones(3,3)));
% title('Salt and Pepper');
% subplot 334
% imshow(ordfilt2(speckle,1,ones(3,3)));
% title('Speckle');
% subplot 335
% imshow(ordfilt2(salt,1,ones(3,3)));
% title('Only Salt');
% subplot 336
% imshow(ordfilt2(pepper,1,ones(3,3)));
% title('Only Pepper');

%%%% Max Filter

% figure('Name','Max Filter','NumberTitle','off')
% subplot 331
% imshow(ordfilt2(gaussian,9,ones(3,3)));
% title('Gaussian');
% subplot 332
% imshow(ordfilt2(poisson,9,ones(3,3)));
% title('Poisson');
% subplot 333
% imshow(ordfilt2(s_and_p,9,ones(3,3)));
% title('Salt and Pepper');
% subplot 334
% imshow(ordfilt2(speckle,9,ones(3,3)));
% title('Speckle');
% subplot 335
% imshow(ordfilt2(salt,9,ones(3,3)));
% title('Only Salt');
% subplot 336
% imshow(ordfilt2(pepper,9,ones(3,3)));
% title('Only Pepper');

%%%% Median Filter

% figure('Name','Median Filter','NumberTitle','off')
% subplot 331
% imshow(medfilt2(gaussian));
% title('Gaussian');
% subplot 332
% imshow(medfilt2(poisson));
% title('Poisson');
% subplot 333
% imshow(medfilt2(s_and_p));
% title('Salt and Pepper');
% subplot 334
% imshow(medfilt2(speckle));
% title('Speckle');
% subplot 335
% imshow(medfilt2(salt));
% title('Only Salt');
% subplot 336
% imshow(medfilt2(pepper));
% title('Only Pepper');

%%%% Geometric Filter

% figure('Name','Geometric Filter','NumberTitle','off')
% fun = @(x) geomean(x(:));
% 
% subplot 331
% imshow(nlfilter(im2double(gaussian),[3,3],fun));
% title('Gaussian');
% subplot 332
% imshow(nlfilter(im2double(poisson),[3,3],fun));
% title('Poisson');
% subplot 333
% imshow(nlfilter(im2double(s_and_p),[3,3],fun));
% title('Salt and Pepper');
% subplot 334
% imshow(nlfilter(im2double(speckle),[3,3],fun));
% title('Speckle');
% subplot 335
% imshow(nlfilter(im2double(salt),[3,3],fun));
% title('Only Salt');
% subplot 336
% imshow(nlfilter(im2double(pepper),[3,3],fun));
% title('Only Pepper');

%%%% Harmonic Filter

% figure('Name','Harmonic Filter','NumberTitle','off')
% fun = @(x) harmmean(x(:));
% 
% subplot 331
% imshow(nlfilter(im2double(gaussian),[3,3],fun));
% title('Gaussian');
% subplot 332
% imshow(nlfilter(im2double(poisson),[3,3],fun));
% title('Poisson');
% subplot 333
% imshow(nlfilter(im2double(s_and_p),[3,3],fun));
% title('Salt and Pepper');
% subplot 334
% imshow(nlfilter(im2double(speckle),[3,3],fun));
% title('Speckle');
% subplot 335
% imshow(nlfilter(im2double(salt),[3,3],fun));
% title('Only Salt');
% subplot 336
% imshow(nlfilter(im2double(pepper),[3,3],fun));
% title('Only Pepper');

%%%% Conta Harmonic Filter

figure('Name','Conta Harmonic Filter','NumberTitle','off')

subplot 331
imshow(ContaHarmonicMeanFilter(gaussian));
title('Gaussian');
subplot 332
imshow(ContaHarmonicMeanFilter(poisson));
title('Poisson');
subplot 333
imshow(ContaHarmonicMeanFilter(s_and_p));
title('Salt and Pepper');
subplot 334
imshow(ContaHarmonicMeanFilter(speckle));
title('Speckle');
subplot 335
imshow(ContaHarmonicMeanFilter(salt));
title('Only Salt');
subplot 336
imshow(ContaHarmonicMeanFilter(pepper));
title('Only Pepper');
