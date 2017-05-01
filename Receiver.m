I=input('Enter Image Path: ');
A=imread(I);
B=rgb2gray(A);
C=double(B);
row=size(C,1);
col=size(C,2);
keyFile = fopen('key.txt','r');
key = fscanf(keyFile,'%d');
fclose(keyFile);
l=1;
msgr='';
for i=1:size(C,1)
    for j=1:size(C,2)
        k=j+((i-1)*col);
        if k==key(l)
            msgr(l)=char(A(i,j));
            l=l+1;
            if key(l)==0
                break
            end
        end
    end
    if key(l)==0
        break
    end
end
disp('The decoded message: ')
disp(msgr)