pkg load image;

imagem = imread("pratica7.png");

imagem = im2double (imagem);

tx = 808;
ty = 754;

#transformada
transformada = fftshift(fft2(imagem, tx*2, ty*2));

espectro = uint8(abs(transformada));

imwrite (espectro, "espectro.png");

#construindo o filtro
filtro = zeros(tx, ty, "double");
filtro(1:tx*2, 1:ty*2) = 1;
filtro(1:798, 750:760) = 0;
filtro(818:tx*2, 750:760) = 0;

imwrite(filtro, "filtro.png");

#aplicando o filtro
trft = transformada .* filtro;

x = ifftshift(trft);
y = ifft2(x, tx*2, ty*2);
imagemfiltro = real(y);

#retirando o padding
resultado = zeros(tx, ty, "double");
resultado(1:tx, 1:ty) = imagemfiltro(1:tx, 1:ty);

imwrite(resultado, "resultado.png");

