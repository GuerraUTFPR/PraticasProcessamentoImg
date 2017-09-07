pkg load image;

imagem = imread("/home/guerra/Área de trabalho/UTFPR/Processamento de Imagens/Praticas/Pratica3/imagem.jpg");

n = 800;
m = 679;
mn = m*n;

[counts, x] = imhist(imagem,256);

#plot (1:256, counts);

for i = 1:256
  counts(i) = counts(i)/mn;
endfor


vet = [];
for i= 1:256
  aux = 0;
  for j=1:i
    aux += 256*counts(j);        
    #aux = round(aux);
    endfor
    vet(i) = aux;
    printf("vet(%d) = %d\n", i, vet(i));
endfor
 
 saida = zeros (m,n, "uint8");
for i = 1:m
  for j = 1:n
    valOrig = uint8(imagem(i,j));
    novoVal = vet(valOrig);
    saida(i,j) = novoVal;
  endfor
endfor

[counts, x] = imhist(saida, 256);

plot (1:256, counts);

imwrite(saida, "saida.jpg");  

