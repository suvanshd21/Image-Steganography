I=input('Enter Image Path: ');
A=imread(I);
imshow(A);
B=rgb2gray(A);
C=double(B);
msg=input('Enter Your Message: ');
key = zeros(1,numel(msg)+1);
a=1;
row=size(C,1);
col=size(C,2);
for i=1:size(C,1)-2             %Sobel operator for edge detection
    for j=1:size(C,2)-2
        Gx=((2*C(i+2,j+1)+C(i+2,j)+C(i+2,j+2))-(2*C(i,j+1)+C(i,j)+C(i,j+2)));
        Gy=((2*C(i+1,j+2)+C(i,j+2)+C(i+2,j+2))-(2*C(i+1,j)+C(i,j)+C(i+2,j)));
        B(i,j)=sqrt(Gx.^2+Gy.^2);
    end
end
keyFile = fopen('key.txt','w');
l=1;
for i=1:size(C,1)
    for j=1:size(C,2)
        if B(i,j)>250
            k=j+((i-1)*col);
            key(l)=k;       %Storing position of pixel in key
            fprintf(keyFile,'%d\n',key(l));
            A(i,j)=msg(l);  %Changing pixel in image
            l=l+1;
            if l>numel(msg)
                break
            end
        end
    end
    if l>numel(msg)
       break
    end
end
fprintf(keyFile,'%d\n',0);
fclose(keyFile);
dest='EncodedImage.png';        %Only PNG images can be read at receiver's end
figure
imshow(A)
imwrite(A,dest);