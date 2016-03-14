clc
close all;
img = imread('data\test.jpg');%imread('data\scene1.row3.col3.ppm');
img = rgb2gray(img);
imshow(img);
hold on;

s = 2;
% 计算x,y方向梯度
[px,py] = gradient_0(img,s);
Magnitude_xy = sqrt(px.^2+py.^2);
MagThresh = 10;
SimThresh = 0.7*MagThresh;
%计算45度交叉方向梯度
[px_,py_] = gradient_45(img,s); 
Magnitude_x_y_ = sqrt(px_.^2+py_.^2);



x = [];
y = [];
for i=1:size(Magnitude_xy,1)
    for j=1:size(Magnitude_xy,2)
        if (Magnitude_xy(i,j)> MagThresh && Magnitude_x_y_(i,j)>MagThresh  ...
               && abs(px(i,j)- py(i,j))<SimThresh && abs(px_(i,j)- py_(i,j))<SimThresh )
            x = [x,j];
            y = [y,i];
        end
    end
end
plot(x,y,'r.');


figure;
img = imread('data\scene1.row3.col4.ppm');
img = rgb2gray(img);
imshow(img);
hold on;

% 计算x,y方向梯度
[px,py] = gradient_0(img,s);
Magnitude_xy = sqrt(px.^2+py.^2);
%MagThresh = 10;
%SimThresh = 0.8*MagThresh;
%计算45度交叉方向梯度
[px_,py_] = gradient_45(img,s); 
Magnitude_x_y_ = sqrt(px_.^2+py_.^2);



x = [];
y = [];
for i=1:size(Magnitude_xy,1)
    for j=1:size(Magnitude_xy,2)
        if (Magnitude_xy(i,j)> MagThresh && Magnitude_x_y_(i,j)>MagThresh  ...
               && abs(px(i,j)- py(i,j))<SimThresh && abs(px_(i,j)- py_(i,j))<SimThresh )
            x = [x,j];
            y = [y,i];
        end
    end
end
plot(x,y,'r.');
%{
% 计算x,y方向梯度
[px,py] = gradient(double(img),1,1);
Magnitude_xy = sqrt(px.^2+py.^2);
MagThresh = 10;
SimThresh = 0.8*MagThresh;
%计算45度交叉方向梯度
rows= size(img,1);
cols = size(img,2);
px_ = zeros(rows,cols);
py_ = zeros(rows,cols);
for i=1:rows
    for j=1:cols
        if (i==1||j==1||i==rows||j==cols)
           continue;
        end
        px_(i,j) = 0.7071 * ( img(i+1,j+1) - img(i-1,j-1) );
        py_(i,j) = 0.7071 * ( img(i+1,j-1) - img(i-1,j+1) );
    end
end
Magnitude_x_y_ = sqrt(px_.^2+py_.^2);

x = [];
y = [];
for i=1:size(Magnitude_xy,1)
    for j=1:size(Magnitude_xy,2)
        if (Magnitude_xy(i,j)> MagThresh && Magnitude_x_y_(i,j)>MagThresh  ...
               && abs(px(i,j)- py(i,j))<SimThresh && abs(px_(i,j)- py_(i,j))<SimThresh )
            x = [x,j];
            y = [y,i];
        end
    end
end
plot(x,y,'r.');
%}
%{
v = -2:0.2:2;
[x,y] = meshgrid(v);
z = x .* exp(-x.^2 - y.^2);
[px,py] = gradient(z,.2,.2);

contour(v,v,z)
hold on
quiver(v,v,px,py)
hold off
%}