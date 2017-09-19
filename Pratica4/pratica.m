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


imshow(saida);
# A imagem ficou levemente borrada e com uma borda preta, 
# pois o filtro usou pixels que estao alem da imagem, ou seja, 
# as partes que ficaram pra fora da imagem recebe o valor zero pois não h´a um 3º parametro na filter2.

imagem2 = padarray(imagem, [4,4], "replicate");

saida2 = filter2(mascara,imagem2, "valid");

imshow(saida2);