function [LineSign] = calc_lineside(Longitude, Latitude, x1, x2, y1, y2)

% A1 = [119.7767 -0.7050];
% A2 = [119.8465 -0.8800];
% A3 = [119.8694 -0.8720];
% A4 = [119.8030 -0.6953];

% x1 = A1(1);
% y1 = A1(2);
% 
% x2 = A2(1);
% y2 = A2(2);

b = -(x2-x1)/(y2-y1);
c = -x1 + (x2-x1)/(y2-y1)*y1;

LineSign=Longitude+b.*Latitude+c;

% LineSign_01 = ppp>0;
% LineSign_02 = ppp<0;

% figure
% hold on;
% pcolor(Longitude,Latitude,ppp2*1); shading flat;
% contour(Longitude,Latitude,WaterDepth,[0 0],'k');

end