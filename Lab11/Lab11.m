%%%%%%%%%%%%%%%%%%%%%%%  TASK 1 %%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% ImgDir = 'Images\';
% list = dir([ImgDir '*.tif']);
% number_of_files=size(list);  
% result=0;
% 
% for i=1:number_of_files(1,1)
%     filename=list(i).name;
%     original=imread([ImgDir filename]);
%     green=original(:,:,2);
%     green=imcomplement(green);
%     for j=0:30:180
%         line = strel('line',30,j);
%         tophat=imtophat(green,line);
%         result=result+tophat;
%     end
% 

%     

% %     bitone=bitget(result,1);figure;imshow(logical(bitone));title('Bit plane 1');
% %     bittwo=bitget(result,2);figure;imshow(logical(bittwo));title('Bit plane 2');
% %     bitthree=bitget(result,3);figure;imshow(logical(bitthree));title('Bit plane 3');
% %     bitfour=bitget(result,4);figure;imshow(logical(bitfour));title('Bit plane 4');
% %     bitfive=bitget(result,5);figure;imshow(logical(bitfive));title('Bit plane 5');
% %     bitsix=bitget(result,6);figure;imshow(logical(bitsix));title('Bit plane 6');
%     bitseven=bitget(result,7);%figure;imshow(logical(bitseven));title('Bit plane 7');
%     biteight=bitget(result,8);%figure;imshow(logical(biteight));title('Bit plane 8');
%     bitseven=logical(bitseven);biteight=logical(biteight);
%     enhancedimg=bitseven | biteight;
%     figure;imshow(enhancedimg);title(sprintf('Enhanced Image %d',i));
%     result=0;
% 
% end

%%%%%%%%%%%%%%%%%%%%%%%  TASK 2 %%%%%%%%%%%%%%%%%%%%%%%%%%%

% ImgDir = 'Images\';
% list = dir([ImgDir '*.tif']);
% number_of_files=size(list);  
% result=0;
% 
% for i=1:number_of_files(1,1)
%     filename=list(i).name;
%     original=imread([ImgDir filename]);
%     green=original(:,:,2);
%     green=imcomplement(green);
%     for j=0:30:180
%         line = strel('line',30,j);
%         tophat=imtophat(green,line);
%         result=result+tophat;
%     end
% 
%     result=adapthisteq(result);
%     
%    
%     bitone=bitget(result,1);figure;imshow(logical(bitone));title('Bit plane 1');
%     bittwo=bitget(result,2);figure;imshow(logical(bittwo));title('Bit plane 2');
%     bitthree=bitget(result,3);figure;imshow(logical(bitthree));title('Bit plane 3');
%     bitfour=bitget(result,4);figure;imshow(logical(bitfour));title('Bit plane 4');
%     bitfive=bitget(result,5);figure;imshow(logical(bitfive));title('Bit plane 5');
%     bitsix=bitget(result,6);figure;imshow(logical(bitsix));title('Bit plane 6');
%     bitseven=bitget(result,7);figure;imshow(logical(bitseven));title('Bit plane 7');
%     biteight=bitget(result,8);figure;imshow(logical(biteight));title('Bit plane 8');
%     
%     result=0;
%    
% end

%%%%%%%%%%%%%%%%%%%%%%%  TASK Hit or Miss %%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% SE1 = [0 0 0 0 0
%       0 0 0 0 0
%       0 1 1 0 0
%       0 0 1 0 0 
%       0 0 0 0 0];
%   
%   SE2 = [0 0 0 0 0
%       1 1 1 1 0
%       0 0 0 1 0
%       0 0 0 1 0 
%       0 0 0 1 0];
%   
% I = imread('blobs.png');
% I_hm = bwhitmiss(I,SE1,SE2);
% figure, imshow(I), title('Original Image');
% figure, imshow(I_hm), title('Hit-or-miss operation'); 
  
%Question 1:
% Only the pixels which match the ones in the first structuring element and
% match the zeros in the second structuring element have remained in the
% hit or miss operation.

%Question 2
% By reversing the order of the given structuring elements the desired
% result can be obtained.

%Question 3
% no the technique won't be able to work. In such a case the structuring
% elements will have to be made separately. 


%%%%%%%%%%%%%%%%%%%%%%%  TASK Boundary Extraction %%%%%%%%%%%%%%%%%%%%%%%%%%%

I = imread('blobs.png');
figure, imshow(I), title('Original image');

se = strel('square',3); I_ero = imerode(I,se);
I_bou = imsubtract(I,I_ero);
figure, imshow(I_bou), title('Boundary Extraction');

I_perim = bwperim(I,8);
figure, imshow(I_perim), title('Boundary using bwperim');

%Question 4

figure, imshow(I_perim - I_bou), title('Difference');

% The result is a black image. This shows that the two images are exactly
% the same.

%Question 5

% Fewer pixels and the edges will become thinner as the critera for matching neighbours is
% reduced. Instead of 8 connective pixels only 4 are used.

I_thin = bwmorph(I,'thin',5);
figure, imshow(I_thin), title('Thinning, 5 iterations');

%Question 6

% When the value is increased edges become more thinner but in the above
% case after 15 it stops thinning further.

I_skel = bwmorph(I,'skel',Inf);
figure, imshow(I_skel), title('Skeleton of image');

%Question 7

% Skeletelization shows the skeleton of the structures present whereas 
% thining thins the edges of the image.

  
  
  