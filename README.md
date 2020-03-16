# Earthquake-Data-sort-
MATLAB CODE for sorting earthquake data and plots between different earthquake parameters
%% MAIN FUNCTION FOR SORTING THE EARTHQUAKE DATA

function B = data_sort()
    
%% IMPORT YOUR DATA HERE
        my_data = importdata('seismicity-2006-2017.txt')
        
        %to input arguments in the dialogue box
        prompt = {'Enter year','Enter magnitude','enter region'};
        dlgtitle = 'Input parameters';
        answer = inputdlg(prompt,dlgtitle)
        input = cell2mat(answer(1,1));
        year=str2num(input);
        input = cell2mat(answer(2,1))
        magnitude =str2num(input);
        region= cell2mat(answer(3));
        
       
        A=zeros(1,10);
           
                
%MAIN CODE                
                    for i=[1:18461] 

    %for sorting by year
    q= my_data.data(i,1);
    s=size(year);
    for j=[1:s(1,2)]
        if q==year(1,j)
    
        
%for sorting by basin
   w=my_data.data(i,7);
    r=my_data.data(i,8);
    z=0;
    %defining region for kachchh
    if region=="kachchh"
        if ((22.9<w) && (w<24.4))&& ((69.0<r)&&(r<71.5))
           
          z=1;
        end
         %defining region for saurashtra
    elseif region=="saurashtra"
        if ((19.6<w) && (w<23.0)) &&  ((69.0<r) && (r<72.5))
            z=1;
        end
    elseif region=="mainland" 
        if ((20.2<w) && (w<23.4)) && ((72.303<r) && (r<74.299))
            z=1;
        
        end
    elseif region=="all"
        z=1;
    else 
        disp('this region data is not available')
    end 
    
    if z==1
        
        %sorting by magnitude
          u=my_data.data(i,10);
          if u>magnitude
             
       
        A=[A;my_data.data(i,:)];
              end
              end
          end
         end
                    
                    end 
                    A(1,:)=[]
%Giving column names to sorted data                    
colNames = {'YEAR','MONTH','DAY','HOUR','MINUITE','SECOND','LATITUDE','LONGITUDE','DEPTH','MAGNITUDE'};
B = array2table(A,'VariableNames',colNames)

%% Various Plots for sorted data
figure(1)
plot_data1(B)

%dialogue box to ask if you want data for a specific radius
prompt = {'do you want data inside a perticular circular region'};
dlgtitle = 'Input yes or no';
answer = inputdlg(prompt,dlgtitle)
input = cell2mat(answer)
if input == 'yes'
    figure(2)
 % HISTOGRAMS AND PLOTS OF DATA INSIDE OUR CIRCULAR REGION
    plot_data(B)

end
end
