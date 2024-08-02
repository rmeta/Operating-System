%% project
%% 3
clc;clear;close all;
q = [0, 2, 1, 6, 4, 0, 1, 0, 3, 1, 2, 1];
sizeS = 4;
table = FIFO(q,sizeS);
%% 4
clc;clear;close all;

tic
M = 100;
N = 1000;
alpha = 0.1;
q = LuckyNum_generator(M,N,alpha,1);

sizeS = 10;
table = FIFO(q,sizeS);
number_of_hits = sum(table(2,:)=="hit")
number_of_fault = N - number_of_hits
toc
%% all in one

clc;clear;close all;
answer=inputdlg({'Enter the size of ram bits:','Enter the size of sequence:','Enter the ceil:','Alpha:'},'Input',[1 35],{'10','1000','40','0.1'});
sizeS = str2double(answer{1});
N = str2double(answer{2});
M = str2double(answer{3});
alpha = str2double(answer{4});


tic
q = LuckyNum_generator(M,N,alpha,1);

% mu = mean(q);
% sigma = sqrt(var(q));


table = FIFO(q,sizeS);
number_of_hits = sum(table(2,:)=="hit")
number_of_fault = N - number_of_hits
toc
%%

q = LuckyNum_generator(M,N,alpha,0);
Sizes = 1 : 20;
faults = zeros(1,length(Sizes));
for s = Sizes
    table = FIFO(q,s);
    number_of_hits = sum(table(2,:)=="hit");
    number_of_fault = N - number_of_hits;
    faults(s) = number_of_fault;
end
figure;
plot(Sizes,faults);
xlabel("number of frames"); ylabel("number of page faults");

%%
% M = 10;
% N = 1000;
% SizeS = 4;
% alpha = 0.1;

NOF = zeros(1,100);
for itr = 1 : 100
    q = LuckyNum_generator(M,N,alpha,0);
    table = FIFO(q,sizeS);
    number_of_hits = sum(table(2,:)=="hit");
    number_of_fault = N - number_of_hits;
    NOF(itr) = number_of_fault;
end
    
mu = mean(NOF)
variance = var(NOF)