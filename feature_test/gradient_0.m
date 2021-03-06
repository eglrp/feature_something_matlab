function [px_,py_] = gradient_0(img,s)
%0度梯度，s是步长
img =  double(img);

rows= size(img,1);
cols = size(img,2);
px_ = zeros(rows,cols);
py_ = zeros(rows,cols);
for i=1:rows
    for j=1:cols
        if (i<=s||j<=s||i>=rows-s+1||j>=cols-s+1)
           continue;
        end
        px_(i,j) = ( img(i,j+s) - img(i,j-s) )/(2*s);
        py_(i,j) = ( img(i+s,j) - img(i-s,j) )/(2*s);
    end
end

end