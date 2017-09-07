pkg load image;

imagem = imread("/home/guerra/Área de trabalho/UTFPR/Processamento de Imagens/Praticas/BCC36F-Pratica1-Imagens/tungsten_filament_shaded.tif");
sensor = imread("/home/guerra/Área de trabalho/UTFPR/Processamento de Imagens/Praticas/BCC36F-Pratica1-Imagens/tungsten_sensor_shading.tif");

imagem = im2double (imagem);
sensor = im2double (sensor);

new_image = imagem ./ sensor;

imshow (new_image);
