% Solución:

% Inicializar las variables
d = 0.293; % diametro en metros
ks = 1.5e-6; % rugosidad absoluta en metros
H = 43.5; % diferencia de nivel en metros
L = 730; % longitud de la tuberia en metros
skm = 11.8; % coeficiente global de pérdidas menores
z2 = 0; % cota en la salida en metros
vcin = 1.007e-6; % viscosidad cinematica
g = 9.81; %gravedad en m/s2
error = 0.0001; % error considerado

%Cálculos
hf = H - z2;
kd = ks/d; % rugosidad relativa
A = pi*d^2/4; %area de la tuberia

%Iteraciones
condicion = true;
while condicion
    v=(-2*(2*g*d*hf/L)^0.5)*(log10((kd/3.7)+(2.51*vcin*L^0.5)/(d*(2*g*d*hf)^0.5)));
    hf1=H-z2-skm*v^2/(2*g);
    if abs(hf-hf1)<error
        condicion = false;
    else
        hf = hf1;
    end
end
% Resultados
% El caudal en m3/s es:
 Q = v * A