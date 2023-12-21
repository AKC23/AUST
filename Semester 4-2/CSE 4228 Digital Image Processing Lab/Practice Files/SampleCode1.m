a=floor(rand(5)*10);
% disp(a)
b=ones(5)*9;
disp(b)
c=a*b;
[row,col]=size(c);
z=zeros(row,col);
for i=1:row
    for j=1:col
       if i==j
           z(i,j)=(c(i,j));
       end
    end    
end
disp(z)