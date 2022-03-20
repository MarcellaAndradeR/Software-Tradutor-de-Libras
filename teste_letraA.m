%As imagens têm que está adicionadas no matlab para utilizar o caminho
%abaixo!

a=imread('a1.jpg');
b=imread('a2.jpg');
c=imread('a3.jpg');
d=imread('a4.jpg');
e=imread('a5.jpg');
f=imread('a6.jpg');
g=imread('a7.jpg');
h=imread('a8.jpg');
i=imread('a9.jpg');
j=imread('a10.jpg');
k=imread('b1.jpg');
l=imread('b2.jpg');
m=imread('b3.jpg');
n=imread('b4.jpg');
o=imread('b5.jpg');
p=imread('b6.jpg');
q=imread('b7.jpg');
r=imread('b8.jpg');
s=imread('b9.jpg');
t=imread('b10.jpg');
u=imread('c1.jpg');
v=imread('c2.jpg');
x=imread('c3.jpg');
w=imread('c4.jpg');
y=imread('c5.jpg');
z=imread('c6.jpg');
a1=imread('c7.jpg');
b1=imread('c8.jpg');
c1=imread('c9.jpg');
d1=imread('c10.jpg');

G1 = rgb2gray(a);
G2 = rgb2gray(b);
G3 = rgb2gray(c);
G4 = rgb2gray(d);
G5 = rgb2gray(e);
G6 = rgb2gray(f);
G7 = rgb2gray(g);
G8 = rgb2gray(h);
G9 = rgb2gray(i);
G10 = rgb2gray(j);
G11 = rgb2gray(k);
G12 = rgb2gray(l);
G13 = rgb2gray(m);
G14 = rgb2gray(n);
G15 = rgb2gray(o);
G16 = rgb2gray(p);
G17 = rgb2gray(q);
G18 = rgb2gray(r);
G19 = rgb2gray(s);
G20 = rgb2gray(t);
G21 = rgb2gray(u);
G22 = rgb2gray(v);
G23 = rgb2gray(x);
G24 = rgb2gray(w);
G25 = rgb2gray(y);
G26 = rgb2gray(z);
G27 = rgb2gray(a1);
G28 = rgb2gray(b1);
G29 = rgb2gray(c1);
G30 = rgb2gray(d1);

BW1 = im2bw(G1);
BW2 = im2bw(G2);
BW3 = im2bw(G3);
BW4 = im2bw(G4);
BW5 = im2bw(G5);
BW6 = im2bw(G6);
BW7 = im2bw(G7);
BW8 = im2bw(G8);
BW9 = im2bw(G9);
BW10 = im2bw(G10);
BW11 = im2bw(G11);
BW12 = im2bw(G12);
BW13 = im2bw(G13);
BW14 = im2bw(G14);
BW15 = im2bw(G15);
BW16 = im2bw(G16);
BW17 = im2bw(G17);
BW18 = im2bw(G18);
BW19 = im2bw(G19);
BW20 = im2bw(G20);
BW21 = im2bw(G21);
BW22 = im2bw(G22);
BW23 = im2bw(G23);
BW24 = im2bw(G24);
BW25 = im2bw(G25);
BW26 = im2bw(G26);
BW27 = im2bw(G27);
BW28 = im2bw(G28);
BW29 = im2bw(G29);
BW30 = im2bw(G30);




A1=im2double(BW1);
A2=im2double(BW2);
A3=im2double(BW3);
A4=im2double(BW4);
A5=im2double(BW5);
A6=im2double(BW6);
A7=im2double(BW7);
A8=im2double(BW8);
A9=im2double(BW9);
A10=im2double(BW10);
A11=im2double(BW11);
A12=im2double(BW12);
A13=im2double(BW13);
A14=im2double(BW14);
A15=im2double(BW15);
A16=im2double(BW16);
A17=im2double(BW17);
A18=im2double(BW18);
A19=im2double(BW19);
A20=im2double(BW20);
A21=im2double(BW21);
A22=im2double(BW22);
A23=im2double(BW23);
A24=im2double(BW24);
A25=im2double(BW25);
A26=im2double(BW26);
A27=im2double(BW27);
A28=im2double(BW28);
A29=im2double(BW29);
A30=im2double(BW30);


%colunas matriz
c1=A1(:);
c2=A2(:);
c3=A3(:);
c4=A4(:);
c5=A5(:);
c6=A6(:);
c7=A7(:);
c8=A8(:);
c9=A9(:);
c10=A10(:);
c11=A11(:);
c12=A12(:);
c13=A13(:);
c14=A14(:);
c15=A15(:);
c16=A16(:);
c17=A17(:);
c18=A18(:);
c19=A19(:);
c20=A20(:);
c21=A21(:);
c22=A22(:);
c23=A23(:);
c24=A24(:);
c25=A25(:);
c26=A26(:);
c27=A27(:);
c28=A28(:);
c29=A29(:);
c30=A30(:);


%criando a matriz entrada
P=[c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12, c13, c14, c15, c16, c17, c18, c19, c20, c21, c22, c23, c24, c25, c26, c27, c28, c29, c30];


%criando a matriz target
T=[1,0,0,0;1,0,0,0;1,0,0,0;1,0,0,0;1,0,0,0;1,0,0,0;1,0,0,0;1,0,0,0;1,0,0,0;1,0,0,0;0,1,0,0;0,1,0,0;0,1,0,0;0,1,0,0;0,1,0,0;0,1,0,0;0,1,0,0;0,1,0,0;0,1,0,0;0,1,0,0;0,0,1,0;0,0,1,0;0,0,1,0;0,0,1,0;0,0,1,0;0,0,1,0;0,0,1,0;0,0,1,0;0,0,1,0;0,0,1,0]';


%criar rede neural

net = newff( [min(P')' max(P')'],[200 4],{'tansig' 'logsig'},'traingd');

%Definindo parametros de treinamento

net.trainParam.epochs = 1000;
net.trainParam.goal = 1e-8;
net.trainParam.lr = 0.01;
net.trainParam.show = 25;
net.trainParam.mc = 0.9;
net.trainParam.lr_inc = 1.05;
net.trainParam.lr_dec = 0.7;
net.trainParam.max_perf_inc = 1.04;

% Treinar a rede

net = train(net, P, T);




