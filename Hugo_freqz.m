function freq=Hugo_freqz(h,width)
    l=0:2*pi/(width-1):2*pi; %set range from 0 to 2*pi
    freq=zeros(1,length(l)); 
    for n=1:length(l)   %width
        for k=0:length(h)-1 %filter's length
            freq(n)=freq(n)+h(k+1)*exp(-1i*l(n)*k);    %FFT 
        end
    end
    magnitude=20*log10(abs(freq(2:end-1)));
    if(abs(mean(magnitude))<1e-15)
        magnitude=round(magnitude); %delete very low value
    end
    
    phase=unwrap(angle(freq(2:end)))*180/pi; %turn radian to angle
    figure;
    subplot(211);   plot(l(2:end-1)/(pi),magnitude);    grid on;  title('Magnitude Spectrum |H(e^{j\omega})|');  
    xlabel('Frequency (\times\pi rad/sample)'); ylabel('Magnitude(dB)');    %show magnitude(db)
    subplot(212);   plot(l(2:end)/(pi),phase);          grid on;  title('Phase Spectrum arg[H(e^{j\omega})]');
    xlabel('Frequency (\times\pi rad/sample)'); ylabel('Phase(degrees)');   %show phase(degree)
    freq=conj(freq');

