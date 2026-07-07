class1 = [1 1; 1 -1; 4 5];
class2 = [2 2.5; 0 2 ; 2 3];
plot(class1(:,1), class1(:,2),'o','MarkerEdgeColor','b', 'MarkerFaceColor', 'b', 'MarkerSize',7);
grid on;
hold on;
plot(class2(:,1), class2(:,2),'s','MarkerEdgeColor','r', 'MarkerFaceColor', 'r', 'MarkerSize',5);
hold off;

y = zeros(6,6);
y = [
class1(1,1)*class1(1,1) class1(1,2)*class1(1,2) class1(1,1)*class1(1,2) class1(1,1)
class1(1,2) 1;
class1(2,1)*class1(2,1) class1(2,2)*class1(2,2) class1(2,1)*class1(2,2) class1(2,1)
class1(2,2) 1;
class1(3,1)*class1(3,1) class1(3,2)*class1(3,2) class1(3,1)*class1(3,2) class1(3,1)
class1(3,2) 1;

-class2(1,1)*class2(1,1) -class2(1,2)*class2(1,2) -class2(1,1)*class2(1,2) -class2(1,1)
-class2(1,2) -1;
-class2(2,1)*class2(2,1) -class2(2,2)*class2(2,2) -class2(2,1)*class2(2,2) -class2(2,1)
-class2(2,2) -1;
-class2(3,1)*class2(3,1) -class2(3,2)*class2(3,2) -class2(3,1)*class2(3,2) -class2(3,1)
-class2(3,2) -1;
];

%--------------------------------------

w= ones(1,6);
alpha= 1/6;
flag = 0;
counter = 0;
while counter < 200
counter = counter + 1;
flag = 0;
for i = 1:6
g = y(i,:)*w' ;
if g < 0
w = w + alpha * y(i,:);
else
flag = flag + 1;
 end;
end;
 if (flag == 6)
     break ;
 end;
 end;
 display(w);

 display(counter);