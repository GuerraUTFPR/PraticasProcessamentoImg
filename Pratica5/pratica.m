pkg load image;

function media = avg(valor, imagem)
  media = zeros(256,384, "double");
  for i = (1:valor)
    media = media + imnoise(imagem, "gaussian", 0, 0.64) / valor;
  endfor
  #media = media/valor;
endfunction


imagem = imread("pratica5.png");
imagem = im2double (imagem);

saida1 = avg(8, imagem);
imwrite(saida1, "saidaN8.jpg");

saida2 = avg(16, imagem);
imwrite(saida2, "saidaN16.jpg");

saida3 = avg(64, imagem);
imwrite(saida3, "saidaN64.jpg");

# A diferença e que quanto maior o valor de N utilizado(mais imagens utilizada),
# menor sera o ruido, entretanto, nunca chegara ao nivel da imagem perfeita(original).
