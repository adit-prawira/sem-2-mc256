%% s3859061
clear
close all 
clc

% Setting the rage of the x-axis
xMin=-10; 
xMax=10;
x=[xMin xMax];

% Since ax + by + c = 0, and a=0.5; b=-1; c=4, therefore y = -0.5x + 4
aa=-0.5; 
bb=4; 
y=aa*x+bb;

xSpan = round(xMax) - round(xMin);
yMid = mean(y); 
yMin = (yMid-xSpan)/2; 
yMax = (yMid+xSpan)/2;

% Set of points
points=[6,4;6,3;1,12;-2,5;1,4;1,7;2,0;9,2;0,9;0,7;4,2;5,10;0,5;6,7;8,6;8,2;1,1;2,6;0,0;3,5];
i=size(points,1);

% Plot Setup
fig=figure; hold on;
set(fig,'Position', [970  417  560  420]);
plot(x,y,'k','LineWidth',4); grid on;
axis([xMin-1 xMax+1 yMin-1 yMax+1]); axis square;
xl=xlabel('$x$'); yl=ylabel('$y$'); 
str=sprintf('$y = %g x + %g$',aa,bb);
tit=title(str);
set([xl,yl,tit],'Interpreter','LaTeX');

for ii=1:i
    ll(ii)=line('XData',points(ii,1),'YData',points(ii,2),...
        'LineStyle','none','LineWidth',2,...
        'Marker','o','MarkerSize',22,...
        'MarkerFaceColor','g','MarkerEdgeColor','b');
end
set(gca,'FontSize',16);


a=aa; b=-1; c=bb;
af = @(x,y) a*x+b*y+c; % ax + by + c

for ii=1:i
    xi=points(ii,1); 
    yi=points(ii,2);
    afi=af(xi,yi);
    values(ii)=afi;
    txt(ii)=text('String',sprintf('%g',afi),'Position',[xi,yi],...
        'HorizontalAlignment','center','VerticalAlignment','middle');
end

sprintf("========Calculated Values (Task-1 Answer)========")
disp(values)

%% Random point generation
j=1; 
xMaxRandi=round(xMax)-round(xMin)+1;
yMaxRandi=round(yMax)-round(yMin)+1;
xRandi=randi(xMaxRandi,1,1);
yRandi=randi(yMaxRandi,1,1);
xi=xRandi+round(xMin)-1;
yi=yRandi+round(yMin)-1;
sprintf('======== RANDOMLY GENERATED POINT: [%g %g] ========',xi,yi)

i=i+1; % added index for one new element

ll(i)=line('XData',xi,'YData',yi,...
    'LineStyle','none','LineWidth',4,...
    'Marker','o','MarkerSize',25,...
    'MarkerFaceColor','y','MarkerEdgeColor','m');
afi=af(xi,yi);
values(i)=afi;
txt(i)=text('String',sprintf('%g',afi),'Position',[xi,yi],...
             'HorizontalAlignment','center','VerticalAlignment','middle',...
             'FontWeight','bold','Color','r');
points=[points; xi yi];

% Make points yellow if it is positive
for ii=1:i
    if values(ii)>0
        set(ll(ii),'MarkerFaceColor','y',...
                   'MarkerEdgeColor',[0 0 1])
    end
end

% Make the superimpose value green if negative, yellow otherwise
if(values(i) > 0)
    set(ll(i),'MarkerFaceColor','y','MarkerEdgeColor','k');    
else
    set(ll(i),'MarkerFaceColor','g','MarkerEdgeColor','k');
end

sprintf("========Final Calculated Values that Superimpose the Randomly Generated Point========")
disp(values)