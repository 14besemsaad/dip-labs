 image=imread('C:\Users\saad1\Downloads\BESE5 Fall 17 DIP Lab 2\lab2_task2_2.jpg');
 BW=im2bw(image,0.5);
% BW=[1 1 0 1 1 1 0 1;...
%    1 1 0 1 0 1 0 1;...
%    1 1 1 1 0 0 0 1;...
%    0 0 0 0 0 0 0 1;...
%    1 1 1 1 0 1 0 1;...
%    0 0 0 1 0 1 0 1;...
%    1 1 1 1 0 0 0 1;...
%    1 1 1 1 0 1 1 1];
    
label=0;
children=[];
Labels=zeros(size(BW,1),size(BW,2));
BWpad=padarray(BW,[1,1]);
for i=2:size(BW,1)+1
    for j=2:size(BW,2)+1
        if BWpad(i,j)==1
            if BWpad(i,j-1)==0 && BWpad(i-1,j)==0
                label=label+1;
                children(label)=0;
                Labels(i-1,j-1)=label;
            elseif BWpad(i-1,j)==0 && BWpad(i,j-1)~=0
                Labels(i-1,j-1)=Labels(i-1,j-1-1);
            elseif BWpad(i,j-1)==0 && BWpad(i-1,j)~=0
                Labels(i-1,j-1)=Labels(i-1-1,j-1);
            elseif BWpad(i,j-1)~=0 && BWpad(i-1,j)~=0 && Labels(i-1,j-1-1)==Labels(i-1-1,j-1)
                Labels(i-1,j-1)=Labels(i-1-1,j-1);
            elseif BWpad(i,j-1)~=0 && BWpad(i-1,j)~=0 && Labels(i-1,j-1-1)~=Labels(i-1-1,j-1)
                Labels(i-1,j-1)=min([Labels(i-1-1,j-1),Labels(i-1,j-1-1)]);
                children(min([Labels(i-1-1,j-1),Labels(i-1,j-1-1)]))=max([Labels(i-1-1,j-1),Labels(i-1,j-1-1)]);
                
            end
        end
    end
end

 for i=1:size(Labels,1)
     for j=1:size(Labels,2)
         if Labels(i,j)~=0 && ismember(Labels(i,j),children)==1 
             I=find(children==Labels(i,j));
             for k=1:size(I,2)
                Labels(i,j)=I(k);
             end
             
         end
     end
 end
 
if ismember(0,children)
    label=numel(children)-numel(unique(children))+1;
else
    label=numel(children)-numel(unique(children));
end
labelval=[];
labelvalindex=1;
i=1;
while labelvalindex<=size(children,2)
    if ismember(labelvalindex,children)==0
        labelval(i)=labelvalindex;
    else
        i=i-1;
    end
    labelvalindex=labelvalindex+1;
    i=i+1;
end

%imshow(BW)
%bwconncomp(BW)
%label

%RGB=label2rgb(Labels);
%RGB=label2rgb(labelmatrix(bwconncomp(BW)));
%imshow(RGB)
Labels
for i=labelval(1:end)
    NewLabels=Labels;
    for j=1:size(NewLabels,1)
        for k=1:size(NewLabels,2)
            if NewLabels(j,k)~=i
                NewLabels(j,k)=0;
            else
                NewLabels(j,k)=1;
            end
        end
    end
     fname = sprintf('myfile%d.jpg', i);
     imwrite(NewLabels,fname);
      
end

%labelmatrix() takes the connected components structure as input and returns a matrix of labels. 
%bwlabel() takes a binary image as input and returns and returns a matrix of labels
%labelmatrix is more memory efficient than bwlabel as because it returns its label matrix in 
%the smallest numeric class necessary for the number of objects.
       
            
    
