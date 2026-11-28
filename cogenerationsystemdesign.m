clear all 
 %Kojenerasyon sistem tasarýmý  
Örnek 10-8 
 %-----------------------------------------------------------------------  
%1.hal - Kazan çýkýþý 
 P1=7000;%kPa  
T1=700+273.15;%K - örnekte 500K olunca 5 nolu çýkýþ sývý buhar 
 %karýþýmý oluyor.  
%kütlesel debi 
 m1=15;%kg/s 
 h1=refpropm('H','T',T1,'P',P1,'water');  
s1=refpropm('S','T',T1,'P',P1,'water'); 
 T1doy=refpropm('T','P',P1,'Q',1,'water'); 
 if T1 > T1doy  
      fprintf('1 çýkýþý Kýzgýn buhar\n'); 
       else 
         fprintf('1 çýkýþý doymuþ sývý buhar karýþýmý\n'); 
         end 
 %----------------------------------------------------------------------- 
 %2.hal - türbin proses ýsýtýcý ayrýmý 
 %kütlesel oran 
 r12=0.1; 
 m2=r12m1; 
 P2=P1;%kPa  
T2=T1; 
h2=h1; 
s2=s1;  
%-----------------------------------------------------------------------  
%3.hal - türbin giriþi  
m3=(1-r12)m1; 
P3=P1; 
T3=T1; 
h3=h1; 
s3=s1; 
%----------------------------------------------------------------------- 
%4.hal - kýsýlma vanasý 
m4=m2; 
P4=500;%kPa 
h4=h2; 
T4=refpropm('T','P',P4,'H',h4,'water');  
T4doy=refpropm('T','P',P4,'Q',1,'water'); 
s4=refpropm('S','P',P4,'H',h4,'water');  
if T4 > T4doy 
fprintf('4 çýkýþý Kýzgýn buhar\n');  
else 
fprintf('4 çýkýþý doymuþ sývý buhar karýþýmý\n'); 
end 
%-----------------------------------------------------------------------  
%5.hal - turbin 1. kademe ara çýkýþ  
%kütlesel oran  
r35=0.7; 
m5=r35m3; 
P5=P4; 
%isentropik geniþleme 
s5=s3;  
T5=refpropm('T','P',P5,'S',s5,'water'); 
T5doy=refpropm('T','P',P5,'Q',1,'water');  
x5=refpropm('Q','P',P5,'S',s5,'water'); 
h5=refpropm('H','P',P5,'S',s5,'water'); 
h5doy=refpropm('H','P',P5,'Q',1,'water'); 
if T5 > T5doy  
fprintf('5 çýkýþý Kýzgýn buhar\n'); 
else 
fprintf('5 çýkýþý doymuþ sývý buhar karýþýmý\n'); 
end 
%Türbin iþi  
Wt1=m5(h3-h5); 
%----------------------------------------------------------------------- 
%6. Hal - türbin 2. kademe çýkýþý 
%kütlesel oran 
r36=1-r35; 
m6=r36m3;  
P6=5;%kPa 
%isentropik geniþleme 
s6=s3; 
T6=refpropm('T','P',P6,'S',s6,'water'); 
T6doy=refpropm('T','P',P6,'Q',1,'water'); 
x6=refpropm('Q','P',P6,'S',s6,'water'); 
h6=refpropm('H','P',P6,'S',s6,'water'); 
h6doy=refpropm('H','P',P6,'Q',1,'water'); 
if T6 > T6doy 
fprintf('6 çýkýþý Kýzgýn buhar\n');  
else 
fprintf('6 çýkýþý doymuþ sývý buhar karýþýmý\n'); 
end 
%Türbin iþi Wt2=m6(h3-h6); 
%----------------------------------------------------------------------- 
%7. Hal - proces ýsýtýcý çýkýþý 
P7=P4; x7=0;  
T7=refprom('T','P',P7,'Q',x7,'water'); 
h7=refpropm('H','P',P7,'Q',x7,'water');  
s7=refpropm('S','P',P7,'Q',x7,'water'); 
m7=m4+m5;  
%Proses ýsýtýcý ýsý çýkýþý 
Qpr=m4h4+m5h5-m7h7;  
fprintf('7 çýkýþý doymuþ sývý \n'); 
%-----------------------------------------------------------------------  
%8. Hal - yoðuþturucu çýkýþý 
P8=P6; x8=0;  
m8=m6;  
h8=refpropm('H','P',P8,'Q',x8,'water'); 
s8=refpropm('S','P',P8,'Q',x8,'water'); 
T8=refpropm('T','P',P8,'Q',x8,'water'); 
%Yoðuþturucu ýsý çýkýþý 
Qy=m8(h6-h8); 
fprintf('8 çýkýþý doymuþ sývý \n');  
%----------------------------------------------------------------------- 
%9. Hal - 2. pompa çýkýþý 
P9=P1; 
s9=s8; 
T9=refpropm('T','P',P9,'S',s9,'water'); 
h9=refpropm('H','P',P9,'S',s9,'water'); 
m9=m8; 
%Pompa iþi  
Wp2=m9*(h9-h8);  
P9doy=refpropm('P','T',T9,'Q',0,'water');  
if P9 > P9doy 
fprintf('9 çýkýþý sýkýþtýrýlmýþ sývý\n'); 
else  
fprintf('9 çýkýþý kýzgýn buhar\n');  
end 
%----------------------------------------------------------------------- 
%10. Hal - 1. pompa çýkýþý 
P10=P1; s10=s7;  
T10=refpropm('T','P',P10,'S',s10,'water'); 
T10doy=refpropm('T','P',P10,'Q',0,'water'); 
h10=refpropm('H','P',P10,'S',s10,'water'); 
m10=m7; 
%Pompa iþi  
Wp1=m10*(h10-h7); 
P10doy=refpropm('P','T',T10,'Q',0,'water'); 
if P10 > P10doy 
fprintf('10 çýkýþý sýkýþtýrýlmýþ sývý\n'); 
else 
end 
fprintf('10 çýkýþý kýzgýn buhar\n'); 
%----------------------------------------------------------------------- 
%11. Hal - karýþma odasý 
P11=P1;  
m11=m10+m9;  
h11=(m10h10+m9h9)/m11;  
T11=refpropm('T','P',P11,'H',h11,'water');  
s11=refpropm('S','T',T11,'P',P11,'water'); 
P11doy=refpropm('P','T',T11,'Q',0,'water'); 
if P11 > P11doy  
fprintf('11 çýkýþý sýkýþtýrýlmýþ sývý\n');  
else 
fprintf('11 çýkýþý Kýzgýn buhar\n'); 
end 
%----------------------------------------------------------------------- 
%1-11. Hal – Kazan 
Qkazan=m1*(h1-h11); 
%-----------------------------------------------------------------------  
%Enerji girdisi 
Egiren=Qkazan+Wp1+Wp2; 
Ecikan=Qpr+Qy+Wt1+Wt2; 
%Üretilen net güç Wnet=Wt1+Wt2-Wp1-Wp2; 
%faydalanma oraný ef=(Wnet+Qpr)/Qkazan; 
%Doðalgaz yakýtlý kazan tüketim ve enerji maliyeti etakazan=0.9; 
LHV=34500000;%J/m3 
myakit1=Qkazan/(etakazanLHV)3600;%m3/saat 
%Doðalgaz ücreti 
mdg=25;%TL/m3 
Mkazan=myakit1mdg;%TL 
%Elektrik maliyeti - þebekeden alýnma durumu 
mel=5/1000;%TL/Wh  
Mel=Wnetmel;%TL 
%Net iþletme maliyet - proses ýsý elde etmek için 
Mnet=Mkazan-Mel; 
%Eðer proses ýsý doðrudan doðalgazdan elde edilseydi 
Mpro=mdg*(Qpr/(etakazan*LHV)*3600); 
%Ýþletme karý 
Mkar=Mpro-Mnet; 
fprintf('Wt1 (MW) = %.2f\n', Wt1/1000000); 
fprintf('Wt2 (MW) = %.2f\n', Wt2/1000000); 
fprintf('Qy (MW) = %.2f\n', Qy/1000000); 
fprintf('Wp2 (MW) = %.2f\n', Wp2/1000000); 
fprintf('Wp1 (MW) = %.2f\n', Wp1/1000000); 
fprintf('Qkazan (MW) = %.2f\n', Qkazan/1000000);  
fprintf('Wnet (MW) = %.2f\n', Wnet/1000000); 
fprintf('Qpr (MW) = %.2f\n', Qpr/1000000);  
fprintf('ef (yüzde) = %.2f\n', ef*100); fprintf('Saatlik Kar (TL) = %.2f\n', Mkar);