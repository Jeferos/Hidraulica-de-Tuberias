% Datos del problema
Qd = 0.12; % caudal de diseño en m3/s
L = 150; % longitud de la tuberia en metros
ks = 0.00015; % rugosidad absoluta en metros
H = 2.2; % altura mínima de operación

skm = 0.5 + 0.8 + 10*0.1 + 1; % coeficiente global de pérdidas menores
z2 = 0; % cota en la salida en metros
vcin = 1.17e-6; % viscosidad cinematica del agua
p = 999.3; % densidad del agua en kg/m3
g = 9.81; %gravedad en m/s2
error = 0.001; % error considerado
% Consideraciones iniciales
d = 0.15; % diámetro inicial
dd = 0.05; % incremento de diámetro para las iteraciones
hf1 = H-z2; % hf inicial 
cond1 = true; cond2 = true; cond3 = true; % variables de control

% Cálculos
while cond3
	while cond1
		A = pi*(d^2)/4;
		v = -2*sqrt(2*g*d*hf1/L)*log10(ks/(3.7*d) + 2.51*vcin*sqrt(L)/(d*sqrt(2*g*d*hf1)));
		Q = v*A;
		if Qd < Q
			cond1 = false;
		else
			d = d + dd;
        end
    end
	while cond2
		hf = H - z2 - skm*v^2/(2*g);
		if abs(hf - hf1) < error
			cond2 = false;
		else
			hf1 = hf;
			v = -2*sqrt(2*g*d*hf1/L)*log10(ks/(3.7*d) + 2.51*vcin*sqrt(L)/(d*sqrt(2*g*d*hf1)));
			Q = v*A;
        end
    end
	if Q > Qd
		cond3 = false;
	else
		d = d + dd;
		hf1 = H - z2;
    end
end
        
%Resultados
A
Q
v
d
%OBS: El código dará error cuando las pérdidas menores sean mayores que las pérdidas por fricción. 