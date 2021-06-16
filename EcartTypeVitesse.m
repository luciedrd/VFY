clear;
close all;

%%
T1 = readtable('posture  yeux ouverts_Raphaël  Varane   23May21_16_47_58.csv');
PL=str2double(table2array(T1(2:750,2:5)));
PR=str2double(table2array(T1(2:750,7:10)));

totalL=[];
totalR=[];
pourcentageLX=[];
pourcentageLY=[];
pourcentageRX=[];
pourcentageRY=[];
XL=[];
YL=[];
XR=[];
YR=[];


for i=1:length(PL) 
    totalL(i)=PL(i,1)+PL(i,2)+PL(i,3)+PL(i,4);
    pourcentageLX(i)=1-(PL(i,3)+PL(i,2))/totalL(i);
    pourcentageLY(i)=1-(PL(i,3)+PL(i,4))/totalL(i);
    XL(i)=( 22.5 + pourcentageLX(i)*120 );
    YL(i)=( 30+pourcentageLY(i)*260 );

end

for i=1:length(PR) 
    totalR(i)=PR(i,1)+PR(i,2)+PR(i,3)+PR(i,4);
    pourcentageRY(i)=1-(PR(i,3)+PR(i,4))/totalR(i);
    pourcentageRX(i)=1-(PR(i,3)+PR(i,2))/totalR(i);
    XR(i)=( 22.5 + pourcentageRX(i)*120 );
    YR(i)=( 30 + pourcentageRY(i)*260 );
 
end


speedR=[];
ecartTypeR=0;
for i=1:length(PR)-1 
    dXR=XR(i+1)-XR(i);
    dYR=YR(i+1)-YR(i);
    speedR(i)=sqrt(dXR*dXR+dYR*dYR)/0.04;
    ecartTypeR=ecartTypeR+((speedR(i))-3.2);
end

speedL=[];
ecartTypeL=0;
for i=1:length(PR)-1 
    dXL=XL(i+1)-XL(i);
    dYL=YL(i+1)-YL(i);
    speedL(i)=sqrt(dXL*dXL+dYL*dYL)/0.04;
    ecartTypeL=ecartTypeL+(speedL(i)-3.2);
end

ecartTypeR = sqrt(ecartTypeR/length(PR)-1);
ecartTypeL = sqrt(ecartTypeL/length(PL)-1);

ecartType=(ecartTypeR+ecartTypeL)/2;
