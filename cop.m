clc
clear all

% ÇİFT ETKİLİ ABSORPSİYONLU SOĞUTMA SİSTEMİNİN ENERJİ VE EKSERJİ ANALİZİ
% DOUBLE EFFECT ABSORBTION REFRIGERATION SYSTEM ENERGY AND EXERGY ANALYSES

% Karışım Oranları (Concentration)

Xws=0.2785;                                                %awWS
Xss=0.6;                                                   %awSS
Xamn=0.9999;                                               %amn

% Çevre Sıcaklık ve Baıncı (Ambient Temperature and Pressure - T0,P0)

P0=101.33;                                                 %kPa
T0=291.15;                                                 %K

% % 1,2,3,4,5,6,18,19,20,21 
% h0a=refpropm('H','T',T0,'P',P0,'awSS.mix')/1000;         %kJ/kg
% s0a=refpropm('S','T',T0,'P',P0,'awSS.mix')/1000;         %kJ/kg*K
% 
% % 7,8,9,10,11,12,23
% h0b=refpropm('H','T',T0,'P',P0,'amn.mix')/1000;          %kJ/kg
% s0b=refpropm('S','T',T0,'P',P0,'amn.mix')/1000;          %kJ/kg*K
% 
% % 13,14,15,16,17,22
% h0c=refpropm('H','T',T0,'P',P0,'awWS.mix')/1000;         %kJ/kg
% s0c=refpropm('S','T',T0,'P',P0,'awwS.mix')/1000;         %kJ/kg*K

h0a=632.50;     %kJ/kg     
s0a=3.0991;     %kJ/kg*K

h0b=1674.7;     %kJ/kg
s0b=7.0223;     %kJ/kg*K

h0c=-25.335;    %kJ/kg
s0c=0.54454;    %kJ/kg*K

% ENERJİ ANALİZİ

% H1
m1=1;                                                      %kg/s
x1=0.6;                                                    %concentration
P1=200;                                                    %kPa
Qu1=0;                                                     %Quality
h1=refpropm('H','P',P1,'Q',Qu1,'awSS.mix')/1000;           %kJ/kg
s1=refpropm('S','P',P1,'Q',Qu1,'awSS.mix')/1000;           %kJ/kg*K
T1=refpropm('T','P',P1,'Q',Qu1,'awSS.mix');                %K

% -------------------------------------------------------------------------

% H2
Wp=2.022;                                                  %kW
m2=1;                                                      %kg/s
x2=0.6;                                                    %concentration
P2=700;                                                    %kPa
h2=(Wp+h1*m1)/m2;                                          %kJ/kg
T2=refpropm('T','P',P2,'H',h2*1000,'awSS.mix');            %K
s2=refpropm('S','P',P2,'H',h2*1000,'awSS.mix')/1000;       %kJ/kg*K

% -------------------------------------------------------------------------

% H3
m3=0.8;                                                    %kg/s
x3=0.6;                                                    %contentration
T3=T2;                                                     %K
h3=h2;                                                     %kJ/kg
s3=s2;                                                     %kJ/kg*K

% -------------------------------------------------------------------------

% H4
m4=0.8;                                                    %kg/s
x4=0.6;                                                    %concentration
P4=700;                                                    %kPa
T4=T3+10;                                                  %K
h4=refpropm('H','T',T4,'P',P4,'awSS.mix')/1000;            %kJ/kg
s4=refpropm('S','T',T4,'P',P4,'awSS.mix')/1000;            %kJ/kg*K

% -------------------------------------------------------------------------

% H5
m5=0.64;                                                   %kg/s
x5=0.6;                                                    %concentration
T5=T4;                                                     %K
h5=h4;                                                     %kJ/kg
s5=s4;                                                     %kJ/kg*K

% -------------------------------------------------------------------------

% H6
m6=0.64;                                                   %kg/s
x6=0.6;                                                    %concentration
P6=700;                                                    %kPa
T6=T5+10;                                                  %K
h6=refpropm('H','T',T6,'P',P6,'awSS.mix')/1000;            %kJ/kg
s6=refpropm('S','T',T6,'P',P6,'awSS.mix')/1000;            %kJ/kg*K

% -------------------------------------------------------------------------

% H7
Qhtg=550;                                                  %kW
m7=0.2852;                                                 %kg/s
x7=0.9999;                                                 %concentration
P7=700;                                                    %kPa
        
    % H13
    m13=0.3548;                                            %kg/s
    x13=0.2785;                                            %concentration
	P13=700;                                               %kPa
	T13=T6+20;                                             %K
	h13=refpropm('H','T',T13,'P',P13,'awWS.mix')/1000;     %kJ/kg
	s13=refpropm('S','T',T13,'P',P13,'awWS.mix')/1000;     %kJ/kg*K

h7=(m6*h6+Qhtg-(m13*h13))/m7;                              %kJ/kg
T7=refpropm('T','P',P7,'H',h7*1000,'amn.mix');             %K
s7=refpropm('S','P',P7,'H',h7*1000,'amn.mix')/1000;        %kJ/kg*K

% -------------------------------------------------------------------------

% H8
m8=0.2852;                                                 %kg/s
x8=0.9999;                                                 %concentration
P8=700;                                                    %kPa

	% H21
 	m21=0.36;                                              %kg/s     
	x21=0.6;                                               %concentration
	P21=700;                                               %kPa
        
        % H20
        m20=0.16;                                          %kg/s
        x20=0.6;                                           %concentration
        T20=T4;                                            %K
        h20=h4;                                            %kJ/kg
        s20=s4;                                            %kJ/kg*K
                
        % H19
        m19=0.2;                                           %kg/s
        x19=0.6;                                           %concentration
        P19=700;                                           %kPa
        T19=T20;                                           %K
        h19=refpropm('H','T',T19,'P',P19,'awSS.mix')/1000; %kJ/kg
        s19=refpropm('S','T',T19,'P',P19,'awSS.mix')/1000; %kJ/kg*K
                
	h21=h20; % h19=h20=h21                                 %kJ/kg
	T21=T20; % T19=T20=T21                                 %K
	s21=s20; % s19=s20=s21                                 %kJ/kg*K
         
	% H22
	m22=0.1996;                                            %kg/s
	x22=0.3;                                               %concentration
	P22=700;                                               %kPa
	T22=T21+20;                                            %K
	h22=refpropm('H','T',T22,'P',P22,'awWS.mix')/1000;     %kJ/kg
	s22=refpropm('S','T',T22,'P',P22,'awWS.mix')/1000;     %kJ/kg*K
         
	% H23
	m23=0.1604;                                            %kg/s
	x23=0.9999;                                            %concentration
	P23=700;                                               %kPa
	T23=T22;                                               %K
	h23=refpropm('H','T',T23,'P',P23,'amn.mix')/1000;      %kJ/kg
	s23=refpropm('S','T',T23,'P',P23,'amn.mix')/1000;      %kJ/kg*K
         
h8=(m21*h21+m7*h7-(m22*h22+m23*h23))/m8;                   %kJ/kg
T8=refpropm('T','P',P8,'H',h8*1000,'amn.mix');             %K
s8=refpropm('S','P',P8,'H',h8*1000,'amn.mix')/1000;        %kJ/kg*K

% -------------------------------------------------------------------------

% H9
m9=0.2852;                                                 %kg/s
x9=0.9999;                                                 %concentration
P9=700;                                                    %kPa

	% H18
	m18=0.2;                                               %kg/s
	x18=0.6;                                               %concentration
	T18=T2;                                                %K
	h18=h2;                                                %kJ/kg
	s18=s2;                                                %kJ/kg*K
        
h9=(m8*h8+m18*h18-m19*h19)/m9;                             %kJ/kg
T9=refpropm('T','P',P9,'H',h9*1000,'amn.mix');             %K
s9=refpropm('S','P',P9,'H',h9*1000,'amn.mix')/1000;        %kJ/kg*K

% -------------------------------------------------------------------------

% H10
Qc=400;                                                    %kW
m10=0.4457;                                                %kg/s
x10=0.9999;                                                %concentration
P10=700;                                                   %kPa
h10=(m9*h9+m23*h23-Qc)/m10;                                %kJ/kg
T10=refpropm('T','P',P10,'H',h10*1000,'amn.mix');          %K
s10=refpropm('S','P',P10,'H',h10*1000,'amn.mix')/1000;     %kJ/kg*K

% -------------------------------------------------------------------------

% H11
m11=0.4457;                                                %kg/s
x11=0.9999;                                                %concentration
P11=200;                                                   %kPa
h11=h10;                                                   %kJ/kg
T11=refpropm('T','P',P11,'H',h11*1000,'amn.mix');          %K
s11=refpropm('S','P',P11,'H',h11*1000,'amn.mix')/1000;     %kJ/kg*K

% -------------------------------------------------------------------------

% H12
m12=0.4457;                                                %kg/s
x12=0.9999;                                                %concentration
P12=200;                                                   %kPa
Qe=650;                                                    %kW
h12=(m11*h11+Qe)/m12;                                      %kJ/kg
T12=refpropm('T','P',P12,'H',h12*1000,'amn.mix');          %K
s12=refpropm('S','P',P12,'H',h12*1000,'amn.mix')/1000;     %kJ/kg*K

% -------------------------------------------------------------------------

% H14
m14=0.3548;                                                %kg/s
x14=0.2785;                                                %concentration
P14=700;                                                   %kPa
h14=(m5*h5+m13*h13-m6*h6)/m14;                             %kJ/kg
T14=refpropm('T','P',P14,'H',h14*1000,'awWS.mix');         %K
s14=refpropm('S','P',P14,'H',h14*1000,'awWS.mix')/1000;    %kJ/kg*K

% -------------------------------------------------------------------------

% H15
m15=0.5544;                                                %kg/s
x15=0.2785;                                                %concentration
P15=700;                                                   %kPa
h15=(m14*h14+m22*h22)/m15;                                 %kJ/kg
T15=refpropm('T','P',P15,'H',h15*1000,'awWS.mix');         %K
s15=refpropm('S','P',P15,'H',h15*1000,'awWS.mix')/1000;    %kJ/kg*K

% -------------------------------------------------------------------------

% H16
m16=0.5544;                                                %kg/s
x16=0.2785;                                                %concentration
P16=700;                                                   %kPa
h16=(m3*h3+m15*h15-(m4*h4))/m16;                           %kJ/kg
T16=refpropm('T','P',P16,'H',h16*1000,'awWS.mix');         %K
s16=refpropm('S','P',P16,'H',h16*1000,'awWS.mix')/1000;    %kJ/kg*K

% -------------------------------------------------------------------------

% H17
m17=0.5544;                                                %kg/s
x17=0.2785;                                                %concentration
P17=200;                                                   %kPa
h17=h16;                                                   %kJ/kg
T17=refpropm('T','P',P17,'H',h17*1000,'awWS.mix');         %K
s17=refpropm('S','P',P17,'H',h17*1000,'awWS.mix')/1000;    %kJ/kg*K
Qa=m12*h12+m17*h17-(m1*h1);                                %kW

% -------------------------------------------------------------------------

COPen=Qe/(Qhtg+Wp) 
