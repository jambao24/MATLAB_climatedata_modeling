clear all; close all; clc
n=1:365;
% assume csv file contains 6 columns, with High-Mean-Low in Celsius, then in Fahrenheit
load('NY_simulF_copy.csv'); 
High = NY_simulF_copy(:,1); Low = NY_simulF_copy(:,3); Mean = NY_simulF_copy(:,2);
HighF = NY_simulF_copy(:,4); LowF = NY_simulF_copy(:,6); MeanF = NY_simulF_copy(:,5);
load('avetemps_reloaded.csv'); 
H = avetemps_reloaded(:,1); L = avetemps_reloaded(:,3); M = avetemps_reloaded(:,2);


R_0 = High-Low;
R_o = avetemps_reloaded(:,4);
Hf=avetemps_reloaded(:,5); Lf=avetemps_reloaded(:,7); Mf=avetemps_reloaded(:,6);
    
Rh(1:31)=35.5; Rh(32:59)=36; Rh(60:90)=36.5; Rh(91:120)=35; Rh(121:151)=34.5; Rh(151:180)=33; 
Rh(181:211)=32.5; Rh(212:242)=32.5; Rh(243:272)=35.5; Rh(273:303)=36.5; Rh(304:333)=37; Rh(334:365)=37;
Rl(1:31)=11; Rl(32:59)=10; Rl(60:90)=5.5; Rl(91:120)=1.5; Rl(121:151)=0.5; Rl(151:180)=0; 
Rl(181:211)=0.5; Rl(212:242)=0; Rl(243:272)=0.5; Rl(273:303)=0.5; Rl(304:333)=6.5; Rl(334:365)=9.5;
Rhf=Rh*1.8+32; Rlf=Rl*1.8+32;


figure(1)
plot(n,H,'m',n,L,'c',n,M,'y','Linewidth',2.3); hold on
plot(n,Rh,'kx-',n,Rl,'kx-');  
axis([0 365 0 37])
title('Climate Averages for Nouveau Yathrib (2261-2290)','Fontsize',20);
xlabel('Day of Year'), ylabel('Temperature (°C)')
legend('Actual High','Actual Low','Actual Mean','Record High','Record Low','Location','eastoutside');

figure(2)
plot(n,Hf,'m',n,Lf,'c',n,Mf,'y','Linewidth',2.3); hold on
plot(n,Rhf,'kx-',n,Rlf,'kx-');  
axis([0 365 30 100])
title('Climate Averages for Nouveau Yathrib (2261-2290)','Fontsize',20);
xlabel('Day of Year'), ylabel('Temperature (°F)')
legend('Actual High','Actual Low','Actual Mean','Record High','Record Low','Location','eastoutside');

figure(3)
plot(n,High,'ro-',n,Low,'bo-',n,Mean,'go-','Linewidth',0.3); hold on
plot(n,H,'m',n,L,'c',n,M,'y','Linewidth',2.3); hold on
plot(n,Rh,'kx-',n,Rl,'kx-');  
axis([0 365 -2 40])
title('Temperature Simulation for Nouveau Yathrib (2261-2290)','Fontsize',20);
xlabel('Day of Year'), ylabel('Temperature (°C)')
legend('Actual High','Actual Low','Actual Mean','Average High','Average Low','Average Mean','Location','eastoutside');

figure(4)
plot(n,HighF,'ro-',n,LowF,'bo-',n,MeanF,'go-','Linewidth',0.3); hold on
plot(n,Hf,'m',n,Lf,'c',n,Mf,'y','Linewidth',2.3); hold on
plot(n,Rhf,'kx-',n,Rlf,'kx-');  
axis([0 365 30 100])
title('Temperature Simulation for Nouveau Yathrib (2261-2290)','Fontsize',20);
xlabel('Day of Year'), ylabel('Temperature (°F)')
legend('Actual High','Actual Low','Actual Mean','Average High','Average Low','Average Mean','Location','eastoutside');

figure(5)
subplot(2,1,1)
plot(n,High,'r',n,Low,'b',n,H,'m',n,L,'c'); 
axis([0 365 -2 40])
title('High and Low Temps');
ylabel('Temperature (°C)');
legend('Actual High','Actual Low','Average High','Average Low','Location','eastoutside');
subplot(2,1,2)
plot(n,R_0,'g',n,R_o,'k');
axis([0 365 0 max(R_0+2)])
title('Diurnal Temp Range (°C)');
ylabel('Temperature (°C)');
legend('Actual Range','Average Range','Location','eastoutside');

figure(6)
plot(n,R_0,'g',n,R_o,'k');
axis([0 365 0 max(R_0+2)])
title('Diurnal Temp Range (°C)');
ylabel('Temperature (°C)');
legend('Actual Range','Average Range','Location','eastoutside');


