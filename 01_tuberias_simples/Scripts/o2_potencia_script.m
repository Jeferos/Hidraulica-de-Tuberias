% Solución:
% Inicializar las variables
Q = 0.042; % caudal en m3/s
d = 0.150; % diametro en metros
ks = 1.5e-6; % rugosidad absoluta en metros
L = 970; % longitud de la tuberia en metros
skm = 9.4; % coeficiente global de pérdidas menores
z2 = 16; % cota en la salida en metros
vcin = 1.14e-6; % viscosidad cinematica del agua
p = 999.1; % densidad del agua en kg/m3
g = 9.81; %gravedad en m/s2
error = 0.0001; % error considerado
 
% Cálculos
kd = ks/d; % rugosidad relativa
A = pi*d^2/4; % area de la tuberia
v = Q/A; % velocidad
SHm = skm*v^2/(2*g); % pérdidas menores
Re = v*d/vcin; % número de Reynols

% Cálculo del factor de fricción
% Definimos la función F:
F = @(x) ((-2)*log10((kd/3.7) + ((2.51*x)/(Re)))) - x;

% Utilizaremos el método de Newton Raphson para calcular f, aproximaremos la derivada con:
h = 0.00000001;
df = @(x) (F(x+h)-F(x))/h;

%Iteramos:
x0 = 1; % consideramos un valor inicial para x
condicion = true;
while condicion
    x = x0 - F(x0)/df(x0);  % ecuación de Newton Raphson
    if abs(x-x0)<error
        condicion = false;
    else
        x0 = x;
    end
end
% Resultados
 f = (1/x)^2; % factor de fricción  

% Pérdidas por fricción utilizando Darcy-Weisbach:
hf=f*L*v^2/(d*2*g);
% Altura que debe ser producida por la Bomba:
H = z2 + hf + SHm;
% Potencia de la bomba en W:
Pot = p*Q*g*H;
format bank
round(Pot,3)
format