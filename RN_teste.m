% Testar a rede

k=imread('a11.jpg');
l=imread('a12.jpg');
m=imread('b12.jpg');

G11 = rgb2gray(k);
BW11=im2bw(G11);
A11=im2double(BW11);

G12 = rgb2gray(l);
BW12=im2bw(G12);
A12=im2double(BW12);

G13 = rgb2gray(m);
BW13=im2bw(G13);
A13=im2double(BW13);

Z=[A11(:) A12(:) A13(:)];



C = sim(net,Z)






