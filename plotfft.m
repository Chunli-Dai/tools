function [co]=plotfft(x,y)
%Given input, x, y, profile
% Plot the amplitude as a function of period.

%Get the wavelength in meter
Y=abs(fft(y)); 

% TEST : y=0.06*sin(2*pi/87*x)+0.05*sin(2*pi/64*x)+0.05*sin(2*pi/174*x);Y=abs(fft(y));

L=length(x); %Length of signal
T=mean(diff(x)); %sampling period
Fs=1/T;

P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

f = Fs*(0:(L/2))/L;
wavelen=1./f;

% wavelen = freq2wavelen(freq); %R2022a
figure;plot(wavelen,P1,'b.-','linewidth',2);
xlabel('Wavelength (m)');ylabel('Amplitude');
%wavelength 87 m, 0.06m, 64 m 174m at 0.05m amplitiude
set(gcf,'Color','white')
set(gca,'FontSize',14)
saveas(gcf,'profSS_freq','fig')

return
end

