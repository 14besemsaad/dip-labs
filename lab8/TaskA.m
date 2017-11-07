f= im2double(imread('Cap.jpg'));
figure
imshow(f,[])
p = paddedsize(size(f));
F2 = fft2(f,p(1),p(2)); 
F = fftshift(F2);
%D = zeros(size(F));
D = abs(F);
Do = 210; n = 2;
H = 1./(1 + (D./Do).^(2*n));
Hc = imcomplement(H);
G = F .* H;
L = F .* Hc;
g=real(ifft2(G));
I= real(ifft2(L));
g=g(1:size(f,1), 1:size(f,2));
I=I(1:size(f,1), 1:size(f,2));
figure,imshow(g,[]), title('High pass');
figure,imshow(I,[]),title('low pass');
figure,imshow(H,[]), title('High pass spectrum');
figure,imshow(Hc,[]),title('low pass spectrum');


