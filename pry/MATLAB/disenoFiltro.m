%% CARGANDO SEÑAL DE AUDIO CON RUIDO
%cargando una señal de audio con ruido
close all;
clear all;
Fs=25e3;
[y,Fs]=wavread("senal2.wav");
%%
%Donde:
%y: señal
%Fs: frecuencia de sampleo
T=1/Fs;%periodo de muestreo
t=linspace(0,T,length(y)); %puntos de muestreo
N=length(t);
F=fft(y)/N;
omega=0.5*Fs*linspace(0,1,floor(N/2)+1); % vector de frecuencias discretas
range=(1:floor(N/2)+1); % rango del espectro de potencia
P=F(range).*conj(F(range)); % espectro de potencia de la señal f
figure,plot(t,y), xlabel('tiempo'), title('señal original de audio')
figure,plot(omega,P), xlabel('frequency'), ylabel('P'),title('Espectro de potencia de la señal de audio')
%%
%       Reproducir audio
sound(y,Fs)
%%
% En el analisis en la grafica del espectr de potencia
% se requiere pasar las frecuencias menores a 250 a 740

%%
%aplicando el primer filtro:
close all;
Hd=filtroEliptico2;
y2=filter(Hd,y);
figure
plot(y)
figure
plot(y2)
%%
%visualizaremos el nuevo espectro de potencias:
close all;
T=1/Fs;%periodo de muestreo
t=linspace(0,T,length(y2)); %puntos de muestreo
N=length(t);
F=fft(y2)/N;
omega=0.5*Fs*linspace(0,1,floor(N/2)+1); % vector de frecuencias discretas
range=(1:floor(N/2)+1); % rango del espectro de potencia
P=F(range).*conj(F(range)); % espectro de potencia de la señal f
figure,plot(t,y2), xlabel('tiempo'), title('señal original de audio')
figure,plot(omega,P), xlabel('frequency'), ylabel('P'),title('Espectro de potencia de la señal de audio')
%%
hd2=filtroEliptico1;
y3=filter(hd2,y2);
figure
plot(y)
figure
plot(y3)
%%
%visualizaremos el nuevo espectro de potencias:
T=1/Fs;%periodo de muestreo
t=linspace(0,T,length(y3)); %puntos de muestreo
N=length(t);
F=fft(y3)/N;
omega=0.5*Fs*linspace(0,1,floor(N/2)+1); % vector de frecuencias discretas
range=(1:floor(N/2)+1); % rango del espectro de potencia
P=F(range).*conj(F(range)); % espectro de potencia de la señal f
figure,plot(t,y3), xlabel('tiempo'), title('señal original de audio')
figure,plot(omega,P), xlabel('frequency'), ylabel('P'),title('Espectro de potencia de la señal de audio')
%%
hd3=filtroEliptico3;
y4=filter(hd3,y3);
figure
plot(y)
figure
plot(y4)