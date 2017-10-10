
%%%%%%%%%%%% Mohammad Saad (111502)

%%%%%%%%%%%% Task 1

% original=imread('cameraman.tif');
% figure
% imshow(original);
% title('Original');
% A=input('Give value of A');
% filter1=[ 0  -1    0;...
%         -1  A+4  -1;...
%          0  -1    0];
%      
% filter2=[ -1  -1    -1;...
%           -1  A+8   -1;...
%           -1  -1    -1];     
      
%%%%%%%%%%%%% Task 1 Part A

% figure
% imshow(imfilter(original,filter1));
% title('Filter 1');
% figure
% imshow(imfilter(original,filter2));
% title('Filter 2');
   
%%%%%%%%%%%%% Task 1 Part B

% A=3;
% subplot 121
% imshow(imfilter(original,filter1));
% title('High Boost Mask');
% subplot 122
% imshow(immultiply(original,3));
% title('Multiplied Image');

%%%%%%%%%%%%%% Task 2 Part A

%log=fspecial('log',[7 7],1.0);
%cartoon=imread('cartoon.tif');
% subplot 121
% imshow(cartoon);
% title('Original');
% subplot 122
% imshow(imfilter(cartoon,log));
% title('LoG Filter');

%%% The output image is mostly a dark image with very few white edges. The
%%% edges are visible if the image is zoomed. The log filter has given a
%%% zero response of the places where the image is constant. On the edges
%%% where the values are changing the response is a white line. If you
%%% invert the image the effect is more visible.


%%%%%%%%%%%%%% Task 2 Part B

% cartoon=imread('cartoon.tif');
% log=fspecial('log',[7 7],1.0);
% filtered=imfilter(cartoon,log);
% translated=imtranslate(filtered,[15,-5]);
% subtracted=imsubtract(cartoon,translated);
% subplot 121
% imshow(cartoon);
% title('Original');
% subplot 122
% imshow(subtracted);
% title('Sharpened');

%%%%%%%%%%%% Task 2 Part C

% cartoon=imread('cartoon.tif');
% sigma1=imfilter(cartoon,fspecial('log',[7 7],1.0));
% subtracted=imsubtract(cartoon,sigma1);
% figure
% subplot 121
% imshow(cartoon);
% title('Original');
% subplot 122
% imshow(subtracted);
% title('Sigma:0.5');
% 
% sigma2=imfilter(cartoon,fspecial('log',[7 7],1.5));
% subtracted=imsubtract(cartoon,sigma2);
% figure
% subplot 121
% imshow(cartoon);
% title('Original');
% subplot 122
% imshow(subtracted);
% title('Sigma:1.5');
% 
% sigma3=imfilter(cartoon,fspecial('log',[7 7],3));
% subtracted=imsubtract(cartoon,sigma3);
% figure
% subplot 121
% imshow(cartoon);
% title('Original');
% subplot 122
% imshow(subtracted);
% title('Sigma:3');

%%%%%%%%%%%%%%% Task 3

% peppers=imread('peppers.png');
% %pear=imread('Pear.png');
% figure
% subplot 121
% imshow(peppers);
% title('Original');
% subplot 122
% imshow(imsharpen(peppers,'Amount',1));
% title('Unsharpened');

%%%%%%%%%%%%%%%%%%%%% Task 4

original=imread('cameraman.tif');
%%% Vertical Edges
result=zeros(size(original));
result=padarray(result,[1,1]);
for i=2:size(original,1)-1
    for j=2:size(original,2)-1
        result(i-1,j-1)=original(i,j+1)-original(i,j-1);
    end
end

maximum=max(result);
minimum=min(result);
for i=1:size(result,1)
    for j=1:size(result,2)
        result(i,j)=((result(i,j)-minimum)/(maximum-minimum)).*255;
    end
end



%%% Horizontal Edges

result1=zeros(size(original));
result1=padarray(result1,[1,1]);
for i=2:size(original,1)-1
    for j=2:size(original,2)-1
        result1(i-1,j-1)=original(i+1,j)-original(i-1,j);
    end
end

maximum=max(result1);
minimum=min(result1);
for i=1:size(result1,1)
    for j=1:size(result1,2)
        result1(i,j)=((result1(i,j)-minimum)/(maximum-minimum)).*255;
    end
end





%%% Task 4 Part B

[gx,gy]=imgradientxy(original);

subplot 221
imshow(result);
title('Vertical Edges (my Function)');

subplot 222
imshow(gx);
title('Vertical Edges (imgradientxy)');

subplot 223
imshow(result1);
title('Horizontal Edges (my Function)');

subplot 224
imshow(gy);
title('Horizontal Edges (imgradientxy)');



%%% The difference is between the noise of the two images. My function is
%%% slower as it is implemented by loops. Secondly it includes noise. 






     