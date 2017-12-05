pkg load image;

#open imagem
rgbimagem = imread("Imagem.jpg");
rgbimagem = im2double (rgbimagem);

#tamanho da imagem
tx = 900;
ty = 1600;

#converte imagem pra hsv
hsvimage = rgb2hsv (rgbimagem);

#os tres canais separados 
h = hsvimage(:,:,1);
s = hsvimage(:,:,2);
v = hsvimage(:,:,3);


#transformada
transformada = fftshift(fft2(v, tx*2, ty*2));

#espectro
espectro = uint8(abs(transformada));

imwrite (espectro, "espectro.png");

#open filtro notch
filtro = imread("filtro.png");
filtro = im2double (filtro);

#aplicando o filtro notch
trft = transformada .* filtro;
x = ifftshift(trft);
y = ifft2(x);
imagemfiltro = real(y);
imagemfiltro = abs(imagemfiltro);

#retirando o padding
resultado = zeros(tx, ty, "double");

#transformacao de potencia gama

resultado = imagemfiltro(1:tx, 1:ty);

resultado = resultado .^ 0.7;

resultado = cat(3, h,s,resultado);
resultado = im2uint8(resultado);
resultado = hsv2rgb(resultado);


imwrite(resultado, "resultado.png");

