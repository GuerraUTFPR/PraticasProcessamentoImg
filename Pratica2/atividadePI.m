pkg load image;

imagem = imread("/home/guerra/Área de trabalho/UTFPR/Processamento de Imagens/Praticas/Pratica2/pollen.jpg");

val = zeros (889,889, "double");


r1x = 100;
r1y = 40;
r2x = 135;
r2y = 215;

xa = 1;
ya = 1;
xb = r1x;
yb = r1y;
m = (yb - ya) / (xb - xa);

vet = zeros (1,256, "double");

for i = 1:r1x
  r = ya + m * (i - xa);
  vet(i) =  r;
endfor


xa = r1x;
ya = r1y;
xb = r2x;
yb = r2y;
m = (yb - ya) / (xb - xa);

for i = r1x:r2x
  r = ya + m * (i - xa);
  vet(i) =  r;
endfor
 
xa = r2x;
ya = r2y;
xb = 256;
yb = 256;
m = (yb - ya) / (xb - xa);

for i = r2x:256
  r = ya + m * (i - xa);
  vet(i) =  r;
endfor

plot(0:255,vet);

saida = zeros (889,889, "uint8");
for i = 1:889
  for j = 1:889
    valOrig = uint8(imagem(i,j));
    novoVal = vet(valOrig+1);
    saida(i,j) = novoVal;
  endfor
endfor

imshow(saida);
imwrite(saida, "saida.jpg"); 

# A melhor configuraçao foi encontrada atraves de tentativas,
# foi possivel deduzir que os valores que deram os melhores resultados, foram aqueles que apresentaram um grafico em forma de "escada".
