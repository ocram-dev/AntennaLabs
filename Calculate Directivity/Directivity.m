function d = Directivity(B0,M,N,F)
%This function receives: Bo(constant),M e N(int numbers which denote resolution) and F
%handler of the function F(theta,phi)(radiation intensity)
%Example: f = '@(theta, phi)sin(theta)^3'; input string
%         F = str2func(f); conversion of string to function(handler) F(theta,phi))
%         directivity=Directivity(1,36,36,F)
% Balanis, Constantine A., Antenna Theory Analysis and Design (third edition), 2005 


sum = 0;

for j=1:M %number of cycles M
    for i=1:N %number of cycles N
        sum = (sum + F(i*pi/N, 2*j*pi/M) * sin(i*pi/N)); % method 2-43 pag 61
    end
end

prad = sum * B0 * (pi/N) * (2*pi/M);

d = (4*pi)/prad; %returns d


