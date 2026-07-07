x=zeros(150,4);
myfile=fopen('irisdataset.txt','r');
x=fscanf(myfile,'%f\t%f\t%f\t%f',size(x));
figure,hold on;

grid on;
hold off;

randomRow = randi([1,150]);
c1 = [x(randomRow,1) x(randomRow,2) x(randomRow,2) x(randomRow,4)];

randomRow = randi([1,150]);
c2 = [x(randomRow,1) x(randomRow,2) x(randomRow,2) x(randomRow,4)];

randomRow = randi([1,150]);
c3 = [x(randomRow,1) x(randomRow,2) x(randomRow,2) x(randomRow,4)];

d1 = zeros(1,150);
d2 = d1;
d3 = d1;
for i = 1:150
    d1(1,i) = sqrt((c1(:,1) - x(i,1)) * (c1(:,1) - x(i,1)) + (c1(:,2) - x(i,2)) * (c1(:,2) - x(i,2)) + (c1(:,1) - x(i,3)) * (c1(:,1) - x(i,3)) + (c1(:,2) - x(i,4)) * (c1(:,2) - x(i,4))) ;
    d2(1,i) = sqrt((c2(:,1) - x(i,1)) * (c2(:,1) - x(i,1)) + (c2(:,2) - x(i,2)) * (c2(:,2) - x(i,2)) + (c2(:,1) - x(i,3)) * (c2(:,1) - x(i,3)) + (c2(:,2) - x(i,4)) * (c2(:,2) - x(i,4))) ;
    d3(1,i) = sqrt((c3(:,1) - x(i,1)) * (c3(:,1) - x(i,1)) + (c3(:,2) - x(i,2)) * (c3(:,2) - x(i,2)) + (c3(:,1) - x(i,3)) * (c3(:,1) - x(i,3)) + (c3(:,2) - x(i,4)) * (c3(:,2) - x(i,4))) ;
end
d = [d1; d2; d3];
g = d;
for j = 1:150
    min = 50000;
    index = 0;
    for i = 1:3
        if(d(i,j) < min)
            min = d(i,j);
            index = i;
        end
    end
    for i = 1:3
         g(i,j) = 0;
    end
    g(index,j) = 1;
end

%CLUSTERING LOOP
for w=1:20 
tempG = g;

for j = 1:150
    for i = 1:3
        if(g(i,j)==1 && i==1)
          newX1 = (x(j,1) + c1(1,1))/2;
          newX2 = (x(j,2) + c1(1,2))/2;
          newX3 = (x(j,3) + c1(1,3))/2;
          newX4 = (x(j,4) + c1(1,4))/2;
          c1 = [newX1 newX2 newX3 newX4];
        elseif(g(i,j)==1 && i==2)
          newX1 = (x(j,1) + c2(1,1))/2;
          newX2 = (x(j,2) + c2(1,2))/2;
          newX3 = (x(j,3) + c2(1,3))/2;
          newX4 = (x(j,4) + c2(1,4))/2;
          c2 = [newX1 newX2 newX3 newX4];
        elseif(g(i,j)==1 && i==3)
          newX1 = (x(j,1) + c3(1,1))/2;
          newX2 = (x(j,2) + c3(1,2))/2;
          newX3 = (x(j,3) + c3(1,3))/2;
          newX4 = (x(j,4) + c3(1,4))/2;
          c3 = [newX1 newX2 newX3 newX4];
        end
    end
end
d1 = zeros(1,150);
d2 = d1;
d3 = d1;
for i = 1:150
    d1(1,i) = sqrt((c1(:,1) - x(i,1)) * (c1(:,1) - x(i,1)) + (c1(:,2) - x(i,2)) * (c1(:,2) - x(i,2)) + (c1(:,1) - x(i,3)) * (c1(:,1) - x(i,3)) + (c1(:,2) - x(i,4)) * (c1(:,2) - x(i,4))) ;
    d2(1,i) = sqrt((c2(:,1) - x(i,1)) * (c2(:,1) - x(i,1)) + (c2(:,2) - x(i,2)) * (c2(:,2) - x(i,2)) + (c2(:,1) - x(i,3)) * (c2(:,1) - x(i,3)) + (c2(:,2) - x(i,4)) * (c2(:,2) - x(i,4))) ;
    d3(1,i) = sqrt((c3(:,1) - x(i,1)) * (c3(:,1) - x(i,1)) + (c3(:,2) - x(i,2)) * (c3(:,2) - x(i,2)) + (c3(:,1) - x(i,3)) * (c3(:,1) - x(i,3)) + (c3(:,2) - x(i,4)) * (c3(:,2) - x(i,4))) ;
end
d = [d1; d2; d3];
g = d;
for j = 1:150
    min = 50000;
    index = 0;
    for i = 1:3
        if(d(i,j) < min)
            min = d(i,j);
            index = i;
        end
    end
    for i = 1:3
         g(i,j) = 0;
    end
    g(index,j) = 1;
end

if(tempG==g)
    break;
else 
    tempG=g;
end
end
display(w);

hold on;
plot(c1(:,1), c1(:,2),c1(:,3),c1(:,4), 'o', 'MarkerFaceColor', 'black');
hold off;
hold on;
plot(c2(:,1), c2(:,2),c2(:,3),c2(:,4), 'o', 'MarkerFaceColor', 'black');
hold off;
hold on;
plot(c3(:,1), c3(:,2),c3(:,3),c3(:,4), 'o', 'MarkerFaceColor', 'black');
hold off;

counterG1=0;
counterG2=0;
counterG3=0;
for j = 1:150
    for i = 1:3
        if(g(i,j)==1 && i==1)
          counterG1=counterG1+1;
          hold on; plot(x(j,1), x(j,2),x(j,3),x(j,4), 'gs'); hold off;
        elseif(g(i,j)==1 && i==2)
          counterG2=counterG2+1;
          hold on; plot(x(j,1), x(j,2),x(j,3),x(j,4), 'rs'); hold off;
        elseif(g(i,j)==1 && i==3)
          counterG3=counterG3+1;
          hold on; plot(x(j,1), x(j,2),x(j,3),x(j,4), 'cs'); hold off;
        end
    end
end
display(counterG1);
display(counterG2);
display(counterG3);


    
    
    
    