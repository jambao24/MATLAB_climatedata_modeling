clear all; close all; clc

% load('avetemps.csv')
% AveH = transpose(avetemps(:,1));
% AveL = transpose(avetemps(:,2));
% n = (1:365);
% 
% TestH(1,:)=AveH(1,1:365); %Define time axis for smoothed signal
% TestH(2,:)=AveH(1,1:365)-mean(AveH(1,1:365)); %Subtract mean to remove offset
% TestL(1,:)=AveL(1,1:365); %Define time axis for smoothed signal
% TestL(2,:)=AveL(1,1:365)-mean(AveL(1,1:365)); %Subtract mean to remove offset
% RunAvgH=[];
% for j=1:365-8
%     RunAvgH(1,j+2)=mean(TestH(1,j:j+8)); %Smooth signal using a running average algorithm with window of 5 points
%     RunAvgL(1,j+2)=mean(TestL(1,j:j+8));
% end
% 
% % AvH = smooth(single(AveH)); AvL = smooth(single(AveL));
% H(4:358) = RunAvgH(4:358); H(1:3) = AveH(1:3); H(359:365) = AveH(359:365);
% L(4:358) = RunAvgL(4:358); L(1:3) = AveL(1:3); L(359:365) = AveL(359:365);
% A = (H + L)./2;
% 
% Rh(1:31)=35.5; Rh(32:59)=36; Rh(60:90)=36.5; Rh(91:120)=35; Rh(121:151)=34.5; Rh(151:180)=33; 
% Rh(181:211)=32.5; Rh(212:242)=32.5; Rh(243:272)=35.5; Rh(273:303)=36.5; Rh(304:333)=37; Rh(334:365)=37;
% Rl(1:31)=11; Rl(32:59)=10; Rl(60:90)=5.5; Rl(91:120)=1.5; Rl(121:151)=0.5; Rl(151:180)=0; 
% Rl(181:211)=0.5; Rl(212:242)=0; Rl(243:272)=0.5; Rl(273:303)=0.5; Rl(304:333)=6.5; Rl(334:365)=9.5;
% 
% % figure(1)
% % plot(n,AveH,'ro',n,AveL,'bo','MarkerSize',2); hold on
% % plot(n, H,'m',n, L,'c',n, A,'y','Linewidth',2.9); 
% % axis([0 365 0 37])
% 
% load('avetemps0.csv')
% AveHh = transpose(avetemps0(:,1));
% AveLl = transpose(avetemps0(:,2));
% n = (1:365);
% 
% TestHh(1,:)=AveHh(1,1:365); %Define time axis for smoothed signal
% TestHh(2,:)=AveHh(1,1:365)-mean(AveHh(1,1:365)); %Subtract mean to remove offset
% TestLl(1,:)=AveLl(1,1:365); %Define time axis for smoothed signal
% TestLl(2,:)=AveLl(1,1:365)-mean(AveLl(1,1:365)); %Subtract mean to remove offset
% RunAvgHh=[];
% for k=1:365-8
%     RunAvgHh(1,k+2)=mean(TestHh(1,k:k+8)); %Smooth signal using a running average algorithm with window of 5 points
%     RunAvgLl(1,k+2)=mean(TestLl(1,k:k+8));
% end
% 
% % AvH = smooth(single(AveH)); AvL = smooth(single(AveL));
% Hh(4:358) = RunAvgHh(4:358); Hh(1:3) = AveHh(1:3); Hh(359:365) = AveHh(359:365);
% Ll(4:358) = RunAvgLl(4:358); Ll(1:3) = AveLl(1:3); Ll(359:365) = AveLl(359:365);
% Aa = (Hh + Ll)./2;
% 
% 
% %smoothing of the two smoothed values due to end truncation
% H1=H(185:365); H2=Hh(1:181); H3=H(1:184); H4=Hh(182:365);
% L1=L(185:365); L2=Ll(1:181); L3=L(1:184); L4=Ll(182:365);
% Hm(185:365) = 0.5*(H1+H2); Hm(1:184) = 0.5*(H3+H4);
% Lm(185:365) = 0.5*(L1+L2); Lm(1:184) = 0.5*(L3+L4);
% Am = 0.5*(Hm + Lm);
%  
% HF = Hm.*1.8+32; LF = Lm.*1.8+32; AF = Am.*1.8+32; 
% % figure(10)
% % plot(n, HF,'m',n, LF,'c',n, AF,'y','Linewidth',2.9); hold on
% % plot(n,Rhf,'kx-',n,Rlf,'kx-')
% % axis([0 365 30 100])
% % set(gca,'ytick',[30:5:100])
% % xlabel('Day of Year'), ylabel('Temperature (°F)')
% % title('Climate Averages for Nouveau Yathrib (2261-2290)','Fontsize',20)
% % legend('Average High','Average Low','Mean','Record High','Record Low','Location','northeastoutside')
% 
% % b1=transpose(Hm); b2=transpose(Am); b3=transpose(Lm);
% % save('NY_reloaded_H.csv','b1','-ASCII')
% % save('NY_reloaded_A.csv','b2','-ASCII')
% % save('NY_reloaded_L.csv','b3','-ASCII')

load('NY_reloaded_A.csv'); Hm = transpose(NY_reloaded_A(:,1)); Am = transpose(NY_reloaded_A(:,2)); Lm = transpose(NY_reloaded_A(:,3));
n = 1:365;

HmA = zeros(1,365); LmA = zeros(1,365); AmA = 0.5.*(HmA+LmA);
Range_0 = mean(Hm)-mean(Lm);
Range = HmA-LmA;

Rh(1:31)=35.5; Rh(32:59)=36; Rh(60:90)=36.5; Rh(91:120)=35; Rh(121:151)=34.5; Rh(151:180)=33; 
Rh(181:211)=32.5; Rh(212:242)=32.5; Rh(243:272)=35.5; Rh(273:303)=36.5; Rh(304:333)=37; Rh(334:365)=37;
Rl(1:31)=11; Rl(32:59)=10; Rl(60:90)=5.5; Rl(91:120)=1.5; Rl(121:151)=0.5; Rl(151:180)=0; 
Rl(181:211)=0.5; Rl(212:242)=0; Rl(243:272)=0.5; Rl(273:303)=0.5; Rl(304:333)=6.5; Rl(334:365)=9.5;

AmA(1:55) = Am(1:55)+(0.7).*rand(1,55)-(0.7).*rand(1,55); %center = 0
Range(1:55) = (Hm(1:55)-Lm(1:55)) + (1.7).*rand(1,55)-(3.7).*rand(1,55);
HmA(1:55) = AmA(1:55)+ 0.5.*Range(1:55); LmA(1:55) = AmA(1:55)-0.5.*Range(1:55);
AmA(56:85) = Am(56:85)+ (1.3).*rand(1,30)-(1.3).*rand(1,30); %center = 0
Range(56:85) = (Hm(56:85)-Lm(56:85)) + (3.6).*rand(1,30)-(4.5).*rand(1,30);
HmA(56:85) = AmA(56:85)+ 0.5.*Range(56:85); LmA(56:85) = AmA(56:85)-0.5.*Range(56:85);
AmA(86:123) = Am(86:123) + 2.5.*rand(1,38)-2.5.*rand(1,38); %center = +0
Range(86:123) = (Hm(86:123)-Lm(86:123)) + (5.8).*rand(1,38)-(5.5).*rand(1,38);
HmA(86:123) = AmA(86:123)+ 0.5.*Range(86:123); LmA(86:123) = AmA(86:123)-0.5.*Range(86:123);
AmA(124:169) = Am(124:169) + 3.3.*rand(1,46)-3.3.*rand(1,46); %center = 0
Range(124:169) = (Hm(124:169)-Lm(124:169)) + (4.3).*rand(1,46)-(4.9).*rand(1,46);
HmA(124:169) = AmA(124:169)+ 0.5.*Range(124:169); LmA(124:169) = AmA(124:169)-0.5.*Range(124:169);
AmA(170:215) = Am(170:215) + 4.5.*rand(1,46)-4.5.*rand(1,46); %center = 0
Range(170:215) = (Hm(170:215)-Lm(170:215)) + 4.8.*rand(1,46)-(5.8).*rand(1,46);
HmA(170:215) = AmA(170:215)+ 0.5.*Range(170:215); LmA(170:215) = AmA(170:215)-0.5.*Range(170:215);
AmA(216:246) = Am(216:246) + 4.4.*rand(1,31)-4.4.*rand(1,31); %center = 0
Range(216:246) = (Hm(216:246)-Lm(216:246)) + (5.8).*rand(1,31)-(4.2).*rand(1,31);
HmA(216:246) = AmA(216:246)+ 0.5.*Range(216:246); LmA(216:246) = AmA(216:246)-0.5.*Range(216:246);
AmA(247:270) = Am(247:270) + 3.7.*rand(1,24)-3.7.*rand(1,24); %center = 0
Range(247:270) = (Hm(247:270)-Lm(247:270)) + (3.8).*rand(1,24)-(2.2).*rand(1,24);
HmA(247:270) = AmA(247:270)+ 0.5.*Range(247:270); LmA(247:270) = AmA(247:270)-0.5.*Range(247:270);
AmA(271:300) = Am(271:300) + 3.6.*rand(1,30)-3.6.*rand(1,30); %center = 0
Range(271:300) = (Hm(271:300)-Lm(271:300)) + (3.8).*rand(1,30)-(1.2).*rand(1,30);
HmA(271:300) = AmA(271:300)+ 0.5.*Range(271:300); LmA(271:300) = AmA(271:300)-0.5.*Range(271:300);
AmA(301:340) = Am(301:340) + 3.0.*rand(1,40)-3.0.*rand(1,40); %center = 0
Range(301:340) = (Hm(301:340)-Lm(301:340)) + (2.8).*rand(1,40)-(0.6).*rand(1,40);
HmA(301:340) = AmA(301:340)+ 0.5.*Range(301:340); LmA(301:340) = AmA(301:340)-0.5.*Range(301:340);
AmA(341:350) = Am(341:350) + 2.4.*rand(1,10)-2.4.*rand(1,10); %center = 0
Range(341:350) = (Hm(341:350)-Lm(341:350)) + (1.8).*rand(1,10)-(2.2).*rand(1,10);
HmA(341:350) = AmA(341:350)+ 0.5.*Range(341:350); LmA(341:350) = AmA(341:350)-0.5.*Range(341:350);
AmA(351:365) = Am(351:365) - 1.0.*rand(1,15) +1.0.*rand(1,15);
Range(351:365) = (Hm(351:365)-Lm(351:365)) + (1.6).*rand(1,15)-(2.8).*rand(1,15);
HmA(351:365) = AmA(351:365)+ 0.5.*Range(351:365); LmA(351:365) = AmA(351:365)-0.5.*Range(351:365);

figure(11)
plot(n, Hm,'m',n, Lm,'c',n, Am,'y','Linewidth',2.3); hold on
plot(n, Rh,'kx-',n, Rl,'kx-'); hold on
plot(n, HmA,'r',n, LmA,'b',n, AmA,'g','Linewidth',1.3); hold on
%plot(n,Range,'w','Linewidth',0.1);
axis([0 365 -4 40])
xlabel('Day of Year'), ylabel('Temperature (°C)')
title('Temperature Simulation for Nouveau Yathrib (2261-2290)','Fontsize',20)
legend('Average High','Average Low','Mean','Record High','Record Low','High','Low','Daily Mean','Location','northeastoutside')

Z = mean(Aa0);

% b1=transpose(HmA); b2=transpose(AmA); b3=transpose(LmA);
% save('NY_simulH.csv','b1','-ASCII')
% save('NY_simulA.csv','b2','-ASCII')
% save('NY_simulL.csv','b3','-ASCII')
