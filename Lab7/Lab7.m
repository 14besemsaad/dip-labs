%%Mohammad Saad
%%BESE5A

original=imread('text.png');
org=im2double(original);
bw=imbinarize(org);
cc=bwconncomp(~bw);
% L=labelmatrix(cc);
% imshow(L);


for i=1:cc.NumObjects
    character = false(size(bw));
    character(cc.PixelIdxList{i}) = true;
    %imshow(character);
    imwrite(character,sprintf('%d.jpg',i))
end;