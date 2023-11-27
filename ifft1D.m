function retour = ifft1D(X)
    N = length(X);

    % Vérification que N est une puissance de 2
    if log2(N) ~= round(log2(N))
        error('La taille de la transformée de Fourier doit être une puissance de 2.');
    end

    % Inversion des signes dans la DFT
    X = conj(X);

    % Application de la FFT
    retour = fft1d(X) / N;
end
