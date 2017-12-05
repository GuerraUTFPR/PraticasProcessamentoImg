pkg load image;

imagem = imread("pratica6.png");

imagem = im2double (imagem);

transformada = fftshift(fft2(imagem, 512, 512)); #dimensao da tranformada eh 512x512

espectro = uint8(abs(transformada));

#imshow(espectro);

d0 = 20;

#construindo o filtro
filtro = zeros(512, 512, "double");
for i = 1:512
  for j = 1:512
    d = ((i-256)^2 + (j-256)^2 )^0.5 ;
    filtro(i,j) = e^-((d^2)/(2*d0^2));
  endfor
endfor

#imshow(filtro);

trft = transformada .* filtro;

x = fftshift(trft);
y = ifft2(x, 512, 512);
finalp = real(y);

#imshow(finalp);

final = zeros(256, 256, "double");
for i = 1:256
  for j = 1:256
    final(i,j) = finalp(i,j);
  endfor
endfor

imshow(final);



