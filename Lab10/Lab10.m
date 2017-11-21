%%%%%%%%%%%%%%%%%%  Line Shaped SE  %%%%%%%%%%%%%%%
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
%     for j=0:30:330
%         line = strel('line',30,j);
%         tophat=imtophat(green,line);
%         result=result+tophat;
%     end
% 
%     figure
%     imshow(result);
%     title(sprintf('%d',i));
%     result=0;
% 
% end

%%%%%%%%%%%%%%%%%%  Disk Shaped SE  %%%%%%%%%%%%%%%

ImgDir = 'Images\';
list = dir([ImgDir '*.tif']);
number_of_files=size(list);  
result=0;

for i=1:number_of_files(1,1)
    filename=list(i).name;
    original=imread([ImgDir filename]);
    green=original(:,:,2);
    green=imcomplement(green);
    for j=2:2:8
        disk = strel('disk',j);
        tophat=imtophat(green,disk);
        result=result+tophat;
    end

    figure
    imshow(result);
    title(sprintf('%d',i));
    result=0;

end