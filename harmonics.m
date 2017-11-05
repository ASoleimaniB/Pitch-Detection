
function [check,wH] = harmonics (center,F,net,lf);
if center>lf
    rcenter= round(center); 
    f= (F((rcenter-20):(rcenter+20)))';     %41 samples
    f= f/max(f);                            % normalize samples
    f=f';
    check=net(f);
    threshold=.8;   % if net(f)>threshold then there is a peak
    if check>threshold
        check=1;
        [temp1 wH]=max(f);
    else
        check=0;
        wH=0;
    end
else
    check=0;
    wH=0;
end
