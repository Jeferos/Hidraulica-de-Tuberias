% Calibración de una tubería simple
% Los datos del problema son:
L = 2800; % Longitud de la tubería en m
Qd = 3.72; % Caudal de diseño en m3/s
H = 32; % Caida en la altura piezométrica
skm = 16.4; % Coeficiente global de pérdidas menores
vcin = 1.17e-6; % Viscosidad cinemática en m2/s
d = 1.2; % Diámetro en m
g = 9.81; % Gravedad
% Solucion:
A = pi*d^2/4;   %Área en m2
v = Qd/A;   % Velocidad en m/s
hm = skm*v^2/(2*g); % Pérdidas menores
Re = v*d/vcin;  % Número de Reynolds
% Pérdida por fricción
hf = H - hm;
% Factor de fricción de Darcy
f = 2*g*d*hf/(L*v^2);

% Rugosidad absoluta
ks = 3.7*d*(power(10,-1/(2*sqrt(f)))-(2.51/(Re*sqrt(f))));
