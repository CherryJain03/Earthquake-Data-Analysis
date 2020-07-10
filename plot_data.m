%% HISTOGRAMS AND PLOTS OF DATA INSIDE OUR CIRCULAR REGION

function plot_data(B)

% INPUT circle centre's latitude and longitude and radius of circle 
%through dialogue cox

prompt = {'Enter longitude','Enter latitude','Enter radius in degree'};
dlgtitle = 'Input parameters of circle';
answer = inputdlg(prompt,dlgtitle)
input = cell2mat(answer(1,1));

longitude= str2num(input);
input = cell2mat(answer(2,1))
latitude =str2num(input);
input= cell2mat(answer(3));
r=str2num(input);



M = zeros(1,10);
colNames = {'YEAR','MONTH','DAY','HOUR','MINUITE','SECOND','LATITUDE','LONGITUDE','DEPTH','MAGNITUDE'};
M5= array2table(M,'VariableNames',colNames)
M1 = M5; 
M2 = M1; 
M3 = M2; 
M4 = M3;
N = M5;

%Getting the points lying inside the circle
s1=size(B)

for k=1:s1(1,1)
X=B.LONGITUDE(k,1);
Y=B.LATITUDE(k,1);
    if (X-longitude)^2 + (Y-latitude)^2 -r^2 < 0
       N=[N;B(k,:)]; 
    end
    
end    
% N is an array of the data of all points lying in our circular region
% HISTOGRAM OF MAGNITUDE   
subplot(2,2,1)
histogram(N.MAGNITUDE)

xlabel("MAGNITUDE")
ylabel("Number of Earthquakes")
subplot(2,2,2)

m=N.MAGNITUDE;

s2=size(N);

%segregate on the basis of magnitude of earthquake

for k=1:s2(1,1)
    
    if m(k,1)>5
        M5=[M5;N(k,:)];
        
    elseif (m(k,1)<5)&& (m(k,1)>4)
     M4=[M4;N(k,:)];
    
    elseif (m(k,1)<4)&& (m(k,1)>3)
     M3=[M3;N(k,:)];
    elseif (m(k,1)<3)&& (m(k,1)>2)
     M2=[M2;N(k,:)];
    else
        M1=[M1;N(k,:)]; 
    end
end

M5(1,:)=[];
M4(1,:)=[];
M3(1,:)=[];
M2(1,:)=[];
M1(1,:)=[];
M1(1,:)=[];

scatter(M5.LONGITUDE,M5.LATITUDE)
title("Earthquake Location & Magnitude")
xlabel('LONGITUDE')
ylabel('LATITUDE')
hold on
scatter(M4.LONGITUDE,M4.LATITUDE)
scatter(M3.LONGITUDE,M3.LATITUDE)
scatter(M2.LONGITUDE,M2.LATITUDE)
scatter(M1.LONGITUDE,M1.LATITUDE)


theta=linspace(0,2*pi,360)
x=r*cos(theta)+longitude;
y=r*sin(theta)+latitude;
plot(x,y)
axis equal
hold off
legend('M>5','4<M<5','3<M<4','2<M<3','M<2',"circle")

% HISTOGRAM of month
subplot(2,2,3)
histogram(N.MONTH)
xlabel('MONTH')
ylabel('Number of Earthquakes')
subplot(2,2,4)

% HISTOGRAM of hour
histogram(N.HOUR)
xlabel('hour')
ylabel('Number of Earthquakes')
end
