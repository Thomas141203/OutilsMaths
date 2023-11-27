image = imread("Image");
image = double(rgb2gray(image)); % Convertir en niveaux de gris

% Taille de l'image
[M, N] = size(image);

% Initialiser la matrice résultante de la transformée de Fourier
fourier_image = zeros(M, N);

% Calculer la transformée de Fourier
for u = 1:M
    for v = 1:N
        sum = 0;
        for x = 1:M
            for y = 1:N
                pixel_value = image(x, y);
                exponent = exp(-1j * 2 * pi * ((u-1) * (x-1)/M + (v-1) * (y-1)/N));
                sum = sum + pixel_value * exponent;
            end
        end
        fourier_image(u, v) = sum;
    end
end

% Réorganiser les fréquences pour que DC soit au centre
fourier_image = fftshift(fourier_image);

% Calculer la magnitude de la transformée de Fourier
magnitude = abs(fourier_image);

% Appliquer une échelle logarithmique (optionnel)
magnitude = log(1 + magnitude);

% Afficher l'image d'origine
subplot(1, 2, 1);
imshow(uint8(image));
title('Image d''origine');

% Afficher le spectre de fréquence
subplot(1, 2, 2);
imshow(magnitude, []);
title('Spectre de fréquence');

% Ajuster les paramètres d'affichage si nécessaire
colormap(gca, jet);  % Choisissez une colormap pour mieux visualiser
_
