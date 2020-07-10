%%HISTOGRAMS AND PLOTS OF SORTED DATA

function plot_data1(B)
subplot(2,2,1)
histogram(B.MAGNITUDE)
title("DATA OF YEAR")
xlabel("MAGNITUDE")
ylabel("number of earthquakes")
subplot(2,2,2)
s1=size(B)
m=B.MAGNITUDE;


M = zeros(1,10);
colNames = {'YEAR','MONTH','DAY','HOUR','MINUITE','SECOND','LATITUDE','LONGITUDE','DEPTH','MAGNITUDE'};
M5= array2table(M,'VariableNames',colNames)
M1 = M5; 
M2 = M1; 
M3 = M2; 
M4 = M3;
for k=1:s1(1,1)
    
    if m(k,1)>5
        M5=[M5;B(k,:)];
        
    elseif (m(k,1)<5)&& (m(k,1)>4)
     M4=[M4;B(k,:)];
    
    elseif (m(k,1)<4)&& (m(k,1)>3)
     M3=[M3;B(k,:)];
    elseif (m(k,1)<3)&& (m(k,1)>2)
     M2=[M2;B(k,:)];
    else
        M1=[M1;B(k,:)]; 
    end
end

M5(1,:)=[];
M4(1,:)=[];
M3(1,:)=[];
M2(1,:)=[];
M1(1,:)=[];

subplot(2,2,2)
scatter(M5.LONGITUDE,M5.LATITUDE,"filled")
title("Earthquake Location & Magnitude")
xlabel('LONGITUDE')
ylabel('LATITUDE')

hold on

scatter(M4.LONGITUDE,M4.LATITUDE)
scatter(M3.LONGITUDE,M3.LATITUDE)
scatter(M2.LONGITUDE,M2.LATITUDE)
scatter(M1.LONGITUDE,M1.LATITUDE)

legend('M>5','4<M<5','3<M<4','2<M<3','M<2')
subplot(2,2,3)
histogram(B.MONTH)
xlabel('MONTH')
ylabel('number of earthquakes')


subplot(2,2,4)
histogram(B.HOUR)
xlabel('HOUR')
ylabel('number of earthquakes')
end
