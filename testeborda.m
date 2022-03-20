%Definir variaveis
format long g;
format compact;
fontSize = 20;
%Abrir a Imagem 
folder='C:\Users\Castelo\Documents\MATLAB';
fullFileName = double('Imagemfinal.jpg');

%Converter em escalas de cinza
grayImage=imread(fullFileName);
%Tirando o erro, converte a imagem em escala de cinza usando apenas o canal
%verde
[rows, columns, numberOfColorBands] = size(grayImage);
if numberOfColorBands > 1
    grayImage = grayImage(:, :, 2);
end
 
%Visualizar a Imagem em escala de cinza
 
imshow(grayImage, []);
axis on;
title('Imagem Original em Cinza', 'FontSize', fontSize);
 
%Binarizar Imagem
binaryImage = grayImage < 128;
imshow(binaryImage, []);

% Salvar a Imagem no Desktop
saveas(gcf,'Imagemfinal2.jpg');
pause(3);









