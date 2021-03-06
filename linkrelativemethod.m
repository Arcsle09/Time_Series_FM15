%%%%%%%WAMP to find Seasional Variations by Link Relative Method%%%%%%
clear all
close all
clc
y = input('Enter the number of years:');

m = 4; %% We have quarterly data

% D = zeros(y,m);
% for i = 1:y
%     for j = 1:m
%         fprintf('Enter the data for year %d and quarter %d:',i,j);
%         D(i,j) = input(' '); 
%     end
% end
D = [45    54    72    60;
     48    56    63    56; 
     49    63    70    65; 
     52    65    75    72; 
     60    70    84    86]

% STEP1 ==> Find out the Link Relative for above data%%%

LR = zeros(y,m);
fprintf('\nLink Relatives:');
for i = 1:y
    for j = 2:m
        LR(i,j) = D(i,j)/D(i,j-1);
        if(j==m)
            for k = 2:y
                LR(k,1) = D(k,1)/D(k-1,m);
            end
        end
    end
end
 
LR = LR*100;
LR

fprintf('\nThe Quarterly Average of Link Relatives:')
%STEP2 ==> Find out the Average of Link Relative
 LR_Avg(1) = sum(LR(:,1))/(y-1);
    for i = 2:m
    LR_Avg(i) = sum(LR(:,i))/y;
    end
LR_Avg

%STEP3 ==> Find out the Chain Relative 
fprintf('\nChain Relatives:');
CR(1) = 100;
for i = 2:m
    CR(i) = (LR_Avg(i)*CR(i-1))/100;
end
CR

%STEP4 ==> Find out the New Chain Relative for first Quarter
fprintf('\nNew Chain Relative for first quarter:');
NCR(1) = (CR(end)*LR_Avg(1))/100

%STEP5 ==> Find the Correction Factor
fprintf('\nThe Quarterly Correction Factor:');
Corr_Fact = (NCR(1) - 100)/m 

%STEP6 ==> Find the Corrected Chain Relatives
fprintf('\nThe Corrected Chain Relatives:');
Corr_CR = zeros(1,m);
for i = 1:m
    Corr_CR(i) = CR(i) - ((i-1)*Corr_Fact);
end
Corr_CR

%STEP7 ==> Find the Seasional Index 
fprintf('\nThe Seasonal Indexes are:');
Corr_CR_Avg = sum(Corr_CR)/m;

SI = zeros(1,m);
for i = 1:m
    SI(i) = (Corr_CR(i)/Corr_CR_Avg)*100;
end
SI

%%%%%%%%%%%%%%  OUTPUT  %%%%%%%%%%%%%%%%%%%%

% Enter the number of years:5
% 
% m =
% 
%      4
% 
% Enter the data for year 1 and quarter 1: 45
% Enter the data for year 1 and quarter 2: 54
% Enter the data for year 1 and quarter 3: 72
% Enter the data for year 1 and quarter 4: 60
% Enter the data for year 2 and quarter 1: 48
% Enter the data for year 2 and quarter 2: 56
% Enter the data for year 2 and quarter 3: 63
% Enter the data for year 2 and quarter 4: 56
% Enter the data for year 3 and quarter 1: 49
% Enter the data for year 3 and quarter 2: 63
% Enter the data for year 3 and quarter 3: 70
% Enter the data for year 3 and quarter 4: 65
% Enter the data for year 4 and quarter 1: 52
% Enter the data for year 4 and quarter 2: 65
% Enter the data for year 4 and quarter 3: 75
% Enter the data for year 4 and quarter 4: 72
% Enter the data for year 5 and quarter 1: 60
% Enter the data for year 5 and quarter 2: 70
% Enter the data for year 5 and quarter 3: 84
% Enter the data for year 5 and quarter 4: 86
% 
% D =
% 
%     45    54    72    60
%     48    56    63    56
%     49    63    70    65
%     52    65    75    72
%     60    70    84    86
% 
% 
% Link Relatives:
% LR =
% 
%          0  120.0000  133.3333   83.3333
%    80.0000  116.6667  112.5000   88.8889
%    87.5000  128.5714  111.1111   92.8571
%    80.0000  125.0000  115.3846   96.0000
%    83.3333  116.6667  120.0000  102.3810
% 
% 
% The Quarterly Average of Link Relatives:
% LR_Avg =
% 
%    82.7083  121.3810  118.4658   92.6921
% 
% 
% Chain Relatives:
% CR =
% 
%   100.0000  121.3810  143.7949  133.2865
% 
% 
% New Chain Relative for first quarter:
% NCR =
% 
%   110.2390
% 
% 
% The Quarterly Correction Factor:
% Corr_Fact =
% 
%     2.5598
% 
% 
% The Corrected Chain Relatives:
% Corr_CR =
% 
%   100.0000  118.8212  138.6754  125.6072
% 
% 
% The Seasonal Indexes are:
% SI =
% 
%    82.7979   98.3815  114.8204  104.0002



