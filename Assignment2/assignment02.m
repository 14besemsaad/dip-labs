%% cycle through all image files in a given directory
%% (and in this case display them)


%Directory for Task-1
task1Dir = 'Retinal_Images_Task_1\';
% list = dir([ task1Dir '*.jpg']);


%Directory for Task-2
task2Dir = 'Retinal_Images_Task_2\';
list2 = dir([task2Dir '*.tif']);

%Output Directory, write your name at the place of yourname
OutputDir = '.\Output\';
mkdir(OutputDir);

number_of_files = size(list2);

for itr= 1:number_of_files(1,1)
    filename = list2(itr).name;
    I = imread([task2Dir filename]);
    
    %%%%%%%%%%%%            write your code here      %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    
%%%%%%%%%%%% Task 1 %%%%%%%%%%%%%%
% Io=I;
% Io=Io(:,:,2);
% Ibe = imfilter(Io,fspecial('average',399));
% In=Io-Ibe;
% 
% % figure
% % imshow(Io,[]);
% % title('Original');
% 
% % figure
% % imshow(In,[]);
% % title('Normalized');
% 
% max_pixel=mode(In(In>0));
% 
% Ih=In;
% Ih(Ih<0)=0;
% Ih(Ih>255)=255;
% 
% Ih=Ih+128-max_pixel;
% 
% % figure
% % imshow(Ih,[]);
% % title('Homogenized');
% imwrite(Ih,[OutputDir,filename]);

 %%%%%%%%%%%%%%%%%%%%%%%%%%%%  Task 2 --- Initial Selection of Candidate Points   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

Io=im2double(rgb2gray(I));
Ibe = imfilter(Io,fspecial('average',399),'conv');
In=Io-Ibe;
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
thin_vessel_0=   [-1 -1 -1;2 2 2;-1 -1 -1]/6;
thin_vessel_45=  [-1 -1 2;-1 2 -1;2 -1 -1]/6;
thin_vessel_90=  [-1 2 -1;-1 2 -1;-1 2 -1]/6;
thin_vessel_135= [2 -1 -1;-1 2 -1;-1 -1 -2]/6;

zero=imfilter(In,thin_vessel_0);
fourtyfive=imfilter(In,thin_vessel_45);
ninety=imfilter(In,thin_vessel_90);
onethreefive=imfilter(In,thin_vessel_135);

m=0;
for i=1:size(zero,1)
    for j=1:size(zero,2)
        temp1=max(zero(i,j),fourtyfive(i,j));
        temp2=max(ninety(i,j),onethreefive(i,j));
        m(i,j)=max(temp1,temp2);
    end
end

In=In+m;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

DoOG_0=[-1 -2 0 2 1
        -2 -4 0 4 2
        -1 -2 0 2 1];

DoOG_45=imrotate(DoOG_0,45);
DoOG_90=imrotate(DoOG_0,90);
DoOG_135=imrotate(DoOG_0,135);

candidate0=imfilter(In,DoOG_0);
candidate45=imfilter(In,DoOG_45);
candidate90=imfilter(In,DoOG_90);
candidate135=imfilter(In,DoOG_135);


newimage0=0;
for i=1:size(candidate0,1)
    for j=1:size(candidate0,2)-3
        
        first=candidate0(i,j); 
        second=candidate0(i,j+1); 
        third=candidate0(i,j+2); 
        fourth=candidate0(i,j+3); 
        
        if (first>0 && second>0 && third<0 && fourth<0)                             %%% pattern one
           
                newimage0(i,j)=max(first,second)+max(abs(third),abs(fourth));
               
        elseif (first>0 && second>0 && third<0 && ((first+second+third+fourth)/4)>0) %%% second pattern
               
                newimage0(i,j)=max(first,second)+max(abs(third),abs(fourth));
        elseif (second>0 && third<0 && fourth<0 && ((first+second+third+fourth)/4)<0) %%% third pattern
               newimage0(i,j)=max(first,second)+max(abs(third),abs(fourth));
        elseif (first>0 && second==0 && third<0)                                    %%%fourth pattern
                 newimage0(i,j)=max(first,second)+max(abs(third),abs(fourth)); 
        end
        
        
    end
        
end

% figure,imshow(candidate0),title('Candidate 0');
% figure,imshow(newimage0),title('Centerline Candidate 0');
    
newimage45=0;
for i=1:size(candidate45,1)-3
    for j=size(candidate45,2):-1:4
        
        first=candidate45(i,j); 
        second=candidate45(i+1,j-1); 
        third=candidate45(i+2,j-2); 
        fourth=candidate45(i+3,j-3); 
        
        if (first>0 && second>0 && third<0 && fourth<0)                             %%% pattern one
           
                newimage45(i,j)=max(first,second)+max(abs(third),abs(fourth));
               
        elseif (first>0 && second>0 && third<0 && ((first+second+third+fourth)/4)>0) %%% second pattern
               
                newimage45(i,j)=max(first,second)+max(abs(third),abs(fourth));
        elseif (second>0 && third<0 && fourth<0 && ((first+second+third+fourth)/4)<0) %%% third pattern
               newimage45(i,j)=max(first,second)+max(abs(third),abs(fourth));
        elseif (first>0 && second==0 && third<0)                                    %%%fourth pattern
                 newimage45(i,j)=max(first,second)+max(abs(third),abs(fourth)); 
        end
        
        
    end
        
end

% figure,imshow(candidate45),title('Candidate 45');
% figure,imshow(newimage45),title('Centerline Candidate 45');

newimage90=0;
for i=1:size(candidate90,1)-3
    for j=1:size(candidate90,2)
        
        first=candidate90(i,j); 
        second=candidate90(i+1,j); 
        third=candidate90(i+2,j); 
        fourth=candidate90(i+3,j); 
        
        if (first>0 && second>0 && third<0 && fourth<0)                             %%% pattern one
           
                newimage90(i,j)=max(first,second)+max(abs(third),abs(fourth));
               
        elseif (first>0 && second>0 && third<0 && ((first+second+third+fourth)/4)>0) %%% second pattern
               
                newimage90(i,j)=max(first,second)+max(abs(third),abs(fourth));
        elseif (second>0 && third<0 && fourth<0 && ((first+second+third+fourth)/4)<0) %%% third pattern
               newimage90(i,j)=max(first,second)+max(abs(third),abs(fourth));
        elseif (first>0 && second==0 && third<0)                                    %%%fourth pattern
                 newimage90(i,j)=max(first,second)+max(abs(third),abs(fourth)); 
        end
        
        
    end
        
end

% figure,imshow(candidate90),title('Candidate 90');
% figure,imshow(newimage90),title('Centerline Candidate 90');    
    
newimage135=0;
for i=1:size(candidate135,1)-3
    for j=1:size(candidate135,2)-3
        
        first=candidate135(i,j); 
        second=candidate135(i+1,j+1); 
        third=candidate135(i+2,j+2); 
        fourth=candidate135(i+3,j+3); 
        
        if (first>0 && second>0 && third<0 && fourth<0)                             %%% pattern one
           
                newimage135(i,j)=max(first,second)+max(abs(third),abs(fourth));
               
        elseif (first>0 && second>0 && third<0 && ((first+second+third+fourth)/4)>0) %%% second pattern
               
                newimage135(i,j)=max(first,second)+max(abs(third),abs(fourth));
        elseif (second>0 && third<0 && fourth<0 && ((first+second+third+fourth)/4)<0) %%% third pattern
               newimage135(i,j)=max(first,second)+max(abs(third),abs(fourth));
        elseif (first>0 && second==0 && third<0)                                    %%%fourth pattern
                 newimage135(i,j)=max(first,second)+max(abs(third),abs(fourth)); 
        end
        
        
    end
        
end

% figure,imshow(candidate135),title('Candidate 135');
% figure,imshow(newimage135),title('Centerline Candidate 135');    
    
mean0=mean(candidate0(:));
std0=std(candidate0(:));
alpha0=1;
T0=mean0-(alpha0*std0);
 %figure,imshow(imbinarize(candidate0,T0)),title('Thresholded 0');


mean45=mean(candidate45(:));
std45=std(candidate45(:));
alpha45=1;
T45=mean45-(alpha45*std45);
 %figure,imshow(imbinarize(candidate45,T45)),title('Thresholded 45');


mean90=mean(candidate90(:));
std90=std(candidate90(:)); 
alpha90=1;
T90=mean90-(alpha90*std90);
% figure,imshow(imbinarize(candidate90,T90)),title('Thresholded 90');


mean135=mean(candidate135(:));
std135=std(candidate135(:));
alpha135=1;
T135=mean135-(alpha135*std135);
%  figure,imshow(imbinarize(candidate135,T135)),title('Thresholded 135');  

imwrite(candidate0+candidate45+candidate90+candidate135,[OutputDir,filename]);
    
    disp(['reading image no ' num2str(i) ': ' filename ])
end

disp('Done')