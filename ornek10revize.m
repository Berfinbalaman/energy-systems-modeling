%Kojenerasyon sistem tasarýmý Örnek 10-8
%türbin isentropik verimi %75
%Pompa isentropik verimi %75
%-----------------------------------------------------------------------
%1.hal - Kazan çýkýþý
P1=7000;%kPa
T1=700+273.15;%K - örnekte 500K olunca 5 nolu çýkýþ sývý buhar 
%karýþýmý oluyor. 
%kütlesel debi
m1=10;%kg/s
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
m2=r12*m1;
P2=P1;%kPa
T2=T1;
h2=h1;
s2=s1;
%-----------------------------------------------------------------------
%3.hal - türbin giriþi
m3=(1-r12)*m1;
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
%5.hal - turbin 1. kademe ara çýkýþ - isentropik deðiþim
%kütlesel oran
r35=0.8;
m5=r35*m3;
P5=P4;
%isentropik geniþleme
s5s=s3;
T5s=refpropm('T','P',P5,'S',s5s,'water');
x5s=refpropm('Q','P',P5,'S',s5s,'water');
h5s=refpropm('H','P',P5,'S',s5s,'water');
%türbin isentropik verimi
etaturb=0.75;
h5a=h3-etaturb*(h3-h5s);
T5a=refpropm('T','P',P5,'H',h5a,'water');
T5doy=refpropm('T','P',P5,'Q',1,'water');
s5a=refpropm('S','P',P5,'H',h5a,'water');
x5a=refpropm('Q','P',P5,'H',h5a,'water');
if T5a > T5doy
    fprintf('5 çýkýþý Kýzgýn buhar\n');
else
    fprintf('5 çýkýþý doymuþ sývý buhar karýþýmý\n');
end
%Türbin iþi
Wt1=m5*(h3-h5a);
%-----------------------------------------------------------------------
%6. Hal - türbin 2. kademe çýkýþý
%kütlesel oran
r36=1-r35;
m6=r36*m3;
P6=5;%kPa
%isentropik geniþleme
s6s=s3;
T6s=refpropm('T','P',P6,'S',s6s,'water');
x6s=refpropm('Q','P',P6,'S',s6s,'water');
h6s=refpropm('H','P',P6,'S',s6s,'water');
%türbin isentropik verimi
etaturb=0.75;
h6a=h3-etaturb*(h3-h6s);
T6a=refpropm('T','P',P6,'H',h6a,'water');
T6doy=refpropm('T','P',P6,'Q',1,'water');
s6a=refpropm('S','P',P6,'H',h6a,'water');
x6a=refpropm('Q','P',P6,'H',h6a,'water');
if T6a > T6doy
    fprintf('6 çýkýþý Kýzgýn buhar\n');
else
    fprintf('6 çýkýþý doymuþ sývý buhar karýþýmý\n');
end
%Türbin iþi
Wt2=m6*(h3-h6a);
%-----------------------------------------------------------------------
%7. Hal - proces ýsýtýcý çýkýþý
P7=P4;
x7=0;
T7=refpropm('T','P',P7,'Q',x7,'water');
h7=refpropm('H','P',P7,'Q',x7,'water');
s7=refpropm('S','P',P7,'Q',x7,'water');
m7=m4+m5;
%Proses ýsýtýcý ýsý çýkýþý
Qpr=m4*h4+m5*h5-m7*h7;
fprintf('7 çýkýþý doymuþ sývý \n');
%-----------------------------------------------------------------------
%8. Hal - yoðuþturucu çýkýþý
P8=P6;
x8=0;
m8=m6;
h8=refpropm('H','P',P8,'Q',x8,'water');
s8=refpropm('S','P',P8,'Q',x8,'water');
T8=refpropm('T','P',P8,'Q',x8,'water');
%Yoðuþturucu ýsý çýkýþý
Qy=m8*(h6-h8);
fprintf('8 çýkýþý doymuþ sývý \n');
%-----------------------------------------------------------------------
%9. Hal - 2. pompa çýkýþý
%isentropik hal deðiþimi
P9=P1;
s9s=s8;
T9s=refpropm('T','P',P9,'S',s9s,'water');
h9s=refpropm('H','P',P9,'S',s9s,'water');
%pompa isentropik verimi
etapump=0.75;
h9a=h8+(h9s-h8)/etapump;
T9a=refpropm('T','P',P9,'H',h9a,'water');
P9doy=refpropm('P','T',T9a,'Q',0,'water');
s9a=refpropm('S','P',P9,'H',h9a,'water');
if P9 > P9doy
    fprintf('9 çýkýþý sýkýþtýrýlmýþ sývý\n');
else
    fprintf('9 çýkýþý kýzgýn buhar\n');
end
%Pompa iþi
m9=m8;
Wp2=m9*(h9a-h8);
%-----------------------------------------------------------------------
%10. Hal - 1. pompa çýkýþý
%Ýsentropik deðiþim
P10=P1; 
s10s=s7;
T10s=refpropm('T','P',P10,'S',s10s,'water');
h10s=refpropm('H','P',P10,'S',s10s,'water');
%pompa isentropik verimi
etapump=0.75;
h10a=h7+(h10s-h7)/etapump;
T10a=refpropm('T','P',P10,'H',h10a,'water');
P10doy=refpropm('P','T',T10a,'Q',0,'water');
s10a=refpropm('S','P',P10,'H',h10a,'water');
if P10 > P10doy
    fprintf('10 çýkýþý sýkýþtýrýlmýþ sývý\n');
else
    fprintf('10 çýkýþý kýzgýn buhar\n');
end
%Pompa iþi
m10=m7;
Wp1=m10*(h10a-h7);
%-----------------------------------------------------------------------
%11. Hal - karýþma odasý
P11=P1;
m11=m10+m9;
h11=(m10*h10+m9*h9)/m11;
T11=refpropm('T','P',P11,'H',h11,'water');
s11=refpropm('S','T',T11,'P',P11,'water');
P11doy=refpropm('P','T',T11,'Q',0,'water');
if P11 > P11doy
    fprintf('11 çýkýþý sýkýþtýrýlmýþ sývý\n');
else
    fprintf('11 çýkýþý Kýzgýn buhar\n');
end
%-----------------------------------------------------------------------
%1-11. Hal - Kazan
Qkazan=m1*(h1-h11);
%-----------------------------------------------------------------------
%Enerji girdisi
Egiren=Qkazan+Wp1+Wp2;
Ecikan=Qpr+Qy+Wt1+Wt2;
%Üretilen net güç
Wnet=Wt1+Wt2-Wp1-Wp1;
%faydalanma oraný
ef=(Wnet+Qpr)/Qkazan;
%Doðalgaz yakýtlý kazan tüketim ve enerji maliyeti
etakazan=0.9;
LHV=34500000;%J/m3
myakit1=Qkazan/(etakazan*LHV)*3600;%m3/saat
%Doðalgaz ücreti
mdg=22.5;%TL/m3
Mkazan=myakit1*mdg;%TL
%Elektrik maliyeti - þebekeden alýnma durumu
mel=5.46/1000;%TL/Wh
Mel=Wnet*mel;%TL
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
fprintf('ef (yüzde) = %.2f\n', ef*100);
fprintf('Saatlik Kar (TL) = %.2f\n', Mkar);
 
 


