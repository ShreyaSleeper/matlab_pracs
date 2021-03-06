close all;
clear all;
clc;
clf;
 
% MESSAGE SIGNAL
fc1=5;

n=[1 1 0 0 1];
l=length(n)
if(n(l)==1)
    n(l+1)=1
else 
    n(l+1)=0
end
l1=length(n)
tn=0:l1-1
 
subplot(5,1,1)
stairs(tn,n,'r');
xlabel('TIME');
ylabel('AMPLITUDE');
title('MESSAGE SIGNAL');
grid on;
 
% CARRIER SIGNAL 1
t=0:0.01:l
c1=sin(2*pi*fc1*t);
subplot(5,1,2);
plot(t,c1,'m');
xlabel('TIME');
ylabel('AMPLITUDE');
title('CARRIER SIGNAL 1');
grid on;
 
% CARRIER SIGNAL 2
t=0:0.01:l
c2=sin((2*pi*fc1*t)-pi);
subplot(5,1,3);
plot(t,c2,'c');
xlabel('TIME');
ylabel('AMPLITUDE');
title('CARRIER SIGNAL 2');
grid on;
 
% FSK MODULATED SIGNAL
 
for i=1:l
for j=(i-1)*100:i*100
    if(n(i)==1)
        s(j+1)=c1(j+1)
    else
        s(j+1)=c2(j+1)
    end
end
end
 
subplot(5,1,4)
plot(t,s,'k');
xlabel('TIME');
ylabel('AMPLITUDE');
title('FSK SIGNAL');
grid on;
 
 
 
% FSK DEMODULATED SIGNAL
 
for i=1:l
for j=(i-1)*100:i*100
    if(s(j+1)==c1(j+1))
        x(j+1)=1
    else
         x(j+1)=0
    end
end
end
 
subplot(5,1,5)
plot(t,x,'r');
xlabel('TIME');
ylabel('AMPLITUDE');
title('DEMODULATED SIGNAL');
grid on;
