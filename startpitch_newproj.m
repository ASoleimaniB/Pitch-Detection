function [F,pitch]= startpitch()
close

load('nnetwork.mat');


Fs=8000;        %Sampling Frequency

%Record Sound for T seconds.
T=1;         %seconds
recObj = audiorecorder(Fs,8,1);
recordblocking(recObj, 1);           
s = getaudiodata(recObj);       % Store Data in Double-Precision Array


for u=1:2000    %Remove Intital Samples of Sound Because of Initial Conditions
    s(u)=0;
end


F=abs(fft(s,Fs));    % Absolute Fourier Transform of Sound
F=F(1:Fs/2,1);       % Half of FFT

lf=150;              % Lowest Frequencies
for i=1:lf           % Remove Low Frequencies Because of Noise and Microphone Limits
    F(i)=0;
end

for i=lf:Fs/2        % Remove Frequencies Witch are Small, Because of Noise
    if F(i)<5
        F(i)=0;
    end;
end


[val H1]=max(F);     % Find Max

                     % Harmonics of Max
H1=H1;
H2=H1/2;
H3=H1/3;
H4=H1/4;
H5=H1/5;
H22=H2/2;
H222=H2/4;
H23=H2/3;
H32=H3/2;




% Check Harmonics (Is there a peak? if yes 1 if no 0)
checkH1=0;
checkH2=0;
checkH3=0;
checkH4=0;
checkH5=0;
checkH22=0;
checkH222=0;
checkH23=0;
checkH32=0;

wH1=0;        %peaks position [1:41] ; normally is 21
wH2=0;         
wH3=0;
wH4=0;
wH5=0;
wH22=0;
wH222=0;
wH23=0;
wH32=0;

%Checks Harmonics
[checkH1,wH1]=harmonics(H1,F,net,lf);
if checkH1==1
    [checkH2,wH2]=harmonics(H2,F,net,lf);
    if checkH2==1
        [checkH22,wH22]=harmonics(H22,F,net,lf);
        if checkH22==1
            [checkH222,wH222]=harmonics(H222,F,net,lf);
        else
            [checkH23,wH23]=harmonics(H23,F,net,lf);
        end
    else
        [checkH3,wH3]=harmonics(H3,F,net,lf);
        if checkH3==1
            [checkH32,wH32]=harmonics(H32,F,net,lf);
        else
            [checkH4,wH32]=harmonics(H4,F,net,lf);
            if checkH4==0
                [checkH5,wH32]=harmonics(H5,F,net,lf);
            end
        end
    end
end

% Harmonics and Checks
a=[checkH1 checkH2 checkH3 checkH4 checkH5 checkH22 checkH222 checkH23 checkH32];
b=[ H1,H2,H3,H4,H5,H22,H222,H23,H32   ];
b=round(b);
pitch=b.*a; %Harmonics Witch are Exist
wH=[wH1,wH2,wH3,wH4,wH5,wH22,wH222,wH23,wH32];

for i=1:9
    if pitch(i)==0
        pitch(i)=inf;
    end
end

[pitch where]=min(pitch);
trig=wH(where)-21;
pitch=pitch+trig
plot(abs(F))
