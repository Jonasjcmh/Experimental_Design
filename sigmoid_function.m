close all
boxplot(Sensationbase100,Probability01);
title('(a)');
xlabel('Probability [0 - 1]');
ylabel('Perception Strength [0%-100%]');
h = findobj(gca,'tag','Median');
set(h,'linestyle','-','LineWidth',4);
set(h,'Color',[1 0 0])
hold on
plot([16.5,30,80,87.5,90,100],'k*-')
legend('Median tendence')
%%
figure(2)

plot(Probability01,Sensationbase100,'ko', 'MarkerSize',2,  'MarkerFaceColor', 'b');
title('(b)')
xlabel('Probability [0-1]')
ylabel('Perception Strength [0-100%]')
xlim([0.05 1.1])
ylim([0 130])
yticks([0 10 20 30 40 50 60 70 80 90 100 110 120 130])
xticks([0.1 0.2 0.4 0.6 0.8 1])
grid on
hold on



%Estimated sigmoid function
k=1/0.01088;  %%(1/c)
G=9.74;       %% b
D_m=-2.541;   %% a
x=linspace(0.1,1);
y=k ./(1+exp(-G*x-D_m));
plot(x,y,'color',[0.4660 0.6740 0.1880],'LineWidth',2.5)
plot([0.1 0.2 0.4 0.6 0.8 1],[16.5,30,80,87.5,90,100],'b--')
hold on

%median points
plot([0.1 0.2 0.4 0.6 0.8 1],[16.5,30,80,87.5,90,100],'ro', 'MarkerFaceColor', 'r')

legend('Experimental Data', ...
'Experimental tendence',... 
'Proposed function 1', ...
'Median points')
hold on
%%
figure(3)

plot(Probability01,Sensationbase100,'ko', 'MarkerSize',2,  'MarkerFaceColor', 'b');
title('(c)')
xlabel('Probability [0-1]')
ylabel('Perception Strength [0-100%]')
xlim([0.05 1.1])
ylim([0 130])
yticks([0 10 20 30 40 50 60 70 80 90 100 110 120 130])
xticks([0.1 0.2 0.4 0.6 0.8 1])
grid on
hold on%plot([0.1 0.2 0.4 0.6 0.8 1],[16.5,30,80,87.5,90,100],'b--')


%Estimated sigmoid function
k2=1/0.01115;   %%(1/c)
G2=9.182;        %% b
D_m2=-2.214 ;    %% a
x2=linspace(0.1,1);
y2=k ./(1+exp(-G*x-D_m));
plot(x,y2,'color',[0.4660 0.6740 0.1880],'LineWidth',2.5)
hold on

%median points
%plot([0.1 0.2 0.4 0.6 0.8 1],[16.5,30,80,87.5,90,100],'ro', 'MarkerFaceColor', 'r')

legend('Experimental Data', ...
'Experimental tendence',... 
'Proposed function 1', ...
'Median points')
hold on


%% Confussion matrix

figure(4)

hold off
yReal=yPred;
[cm,grp]=confusionmat(yReal,yObserved)
[m,n]=size(yReal)
cmp=(cm./(m/4))*100   %4 variables, percentage
grpm={'Horizontal';'Vertical';'Left';'Right'};
h=heatmap(grpm,grpm,cmp)
h.Colormap=parula
 h.FontSize = 12;
 h.Title = {'','Confusion Matrix Pattern recognition',''};
 h.YLabel = 'Real Pattern';
 h.XLabel = 'Observed Pattern';
 h.CellLabelFormat = '%.2f %%';
