function Hd = filtroEliptico3
%FILTROELIPTICO3 Returns a discrete-time filter object.

% MATLAB Code
% Generated by MATLAB(R) 9.8 and Signal Processing Toolbox 8.4.
% Generated on: 15-Dec-2021 18:58:37

% Elliptic Bandstop filter designed using FDESIGN.BANDSTOP.

% All frequency values are in Hz.
Fs = 25000;  % Sampling Frequency

N      = 20;    % Order
Fpass1 = 900;   % First Passband Frequency
Fpass2 = 1000;  % Second Passband Frequency
Apass  = 1;     % Passband Ripple (dB)
Astop  = 80;    % Stopband Attenuation (dB)

% Construct an FDESIGN object and call its ELLIP method.
h  = fdesign.bandstop('N,Fp1,Fp2,Ap,Ast', N, Fpass1, Fpass2, Apass, ...
                      Astop, Fs);
Hd = design(h, 'ellip');

% [EOF]
