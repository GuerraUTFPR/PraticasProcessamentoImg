pkg load image;

imagem = imread("pratica5.jpg");

imagem = im2double (imagem);

mascara = zeros(9);

for i = 1:9
  for j = 1:9
    mascara(i,j) = 1;
  endfor
endfor

mascara = mascara * 1/81;

saida = filter2(mascara,imagem);

#imshow(saida);
imwrite(saida, "1.jpg"); 

# A imagem ficou levemente borrada e com uma borda preta, 
# pois o filtro usou pixels que estao alem da imagem, ou seja, 
# as partes que ficaram pra fora da imagem recebe o valor zero pois não ha um 3º parametro na filter2.

imagem2 = padarray(imagem, [4,4], "replicate");

saida2 = filter2(mascara,imagem2, "valid");

#imshow(saida2);
imwrite(saida2, "2.jpg"); 

magnitude_y = [-1, 0, 1;
			         -2, 0, 2;
			         -1, 0, 1];

magnitude_x = [-1, -2,-1;
			          0, 0, 0;
			          1, 2, 1];

imagem3 = padarray(imagem, [1,1], "replicate");

gradiente_x = filter2(magnitude_x, imagem3, "valid");
gradiente_y = filter2(magnitude_y, imagem3, "valid");

saida3 = sqrt(gradiente_x.^2 + gradiente_y.^2);
#saida3 = abs(gradiente_x) + abs(gradiente_y);

imshow(saida3);
imwrite(saida3, "3.jpg"); 