clear; close all;
filename='test.wav';
[x ,fs]=audioread(filename);
x=x';
t=(1:length(x))/fs;
fft_size=256;
width=512;
fprintf('Ū�����T��:\n');
fprintf('���T�W��= "%s" \n',filename);
fprintf('���T����= "%g"�� \n',length(x)/fs);
fprintf('���˲v= "%g" �����I/�� \n',fs);
fprintf('���˶g��= "%g" �� \n',1/fs);
%-----------------------fundamental setting-------------------------------%
Forward_diff=[1 -1 0]; 
Backward_diff=[0 1 -1];
Moving_average=[1 1 1 1 1 1 1 1]/8;
Delay=zeros(1,fs/10);   Delay(1,end)=1;
Accumulator=ones(1,length(x));
%-------------------------impulse response--------------------------------%
[Out_Forward_diff,t1]=Hugo_filter(Forward_diff,x);
[Out_Backward_diff,t2]=Hugo_filter(Backward_diff,x);
[Out_Moving_average,t3]=Hugo_filter(Moving_average,x);
[Out_Delay,t4]=Hugo_filter(Delay,x);
[Out_Accumulator,t5]=Hugo_filter(Accumulator,x);
%-----------------------------Convolution---------------------------------%
figure;
subplot(621); plot(t,x);
xlabel('�ɶ�(��)'); ylabel('���T(��S)'); title('��l�H��');%show the message
subplot(622); specgram(x,fft_size,fs); 
xlabel('�ɶ�(��)'); ylabel('�W�v(����)');  title('��l�H���W��');
subplot(623); plot(t1/fs,Out_Forward_diff); 
xlabel('�ɶ�(��)'); ylabel('���T(��S)'); title('�V�e�L���H��');
subplot(624); specgram(Out_Forward_diff,fft_size,fs); 
xlabel('�ɶ�(��)'); ylabel('�W�v(����)');  title('�V�e�L���W��');
subplot(625); plot(t2/fs,Out_Backward_diff); 
xlabel('�ɶ�(��)'); ylabel('���T(��S)'); title('�V��L���H��');
subplot(626); specgram(Out_Backward_diff,fft_size,fs); 
xlabel('�ɶ�(��)'); ylabel('�W�v(����)');  title('�V��L���W��');
%figure;
subplot(627); plot(t3/fs,Out_Moving_average); 
xlabel('�ɶ�(��)'); ylabel('���T(��S)'); title('�첾������H��');
subplot(628); specgram(Out_Moving_average,fft_size,fs); 
xlabel('�ɶ�(��)'); ylabel('�W�v(����)');  title('�첾�������W��');
subplot(629); plot(t4/fs,Out_Delay); 
xlabel('�ɶ�(��)'); ylabel('���T(��S)'); title('����H��');
subplot(6,2,10); specgram(Out_Delay,fft_size,fs); 
xlabel('�ɶ�(��)'); ylabel('�W�v(����)');  title('�����W��');
subplot(6,2,11); plot(t5/fs,Out_Accumulator); 
xlabel('�ɶ�(��)'); ylabel('���T(��S)'); title('�֥[�H��');
subplot(6,2,12); specgram(Out_Accumulator,fft_size,fs); 
xlabel('�ɶ�(��)'); ylabel('�W�v(����)');  title('�֥[�W��');
%------------------------------show the result----------------------------%
Hugo_freqz(Forward_diff,width);   
Hugo_freqz(Backward_diff,width);  
Hugo_freqz(Moving_average,width); 
Hugo_freqz(Delay,width);         
Hugo_freqz(Accumulator,width);    
%---------------------show the frequency response-------------------------%
fprintf('Saving to %s...\n','Out_Forward_diff.wav');
audiowrite('Out_Forward_diff.wav', Out_Forward_diff, fs);
fprintf('Saving to %s...\n','Out_Backward_diff.wav');
audiowrite('Out_Backward_diff.wav', Out_Backward_diff, fs);
fprintf('Saving to %s...\n','Out_Moving_average.wav');
audiowrite('Out_Moving_average.wav', Out_Moving_average, fs);
fprintf('Saving to %s...\n','Out_Delay.wav');
audiowrite('Out_Delay.wav', Out_Delay, fs);
fprintf('Saving to %s...\n','Out_Accumulator.wav');
audiowrite('Out_Accumulator.wav', Out_Accumulator, fs);
%-------------------------save the audio file-----------------------------%