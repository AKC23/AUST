%--------------- task1 ---------------
class1 = [1 2; 0 -1; 3 3];
class2 = [0 2; 0 5 ; 2.5 3];

plot(class1(:,1), class1(:,2),'o','MarkerEdgeColor','b', 'MarkerFaceColor', 'b', 'MarkerSize',5);
grid on;
hold on;
plot(class2(:,1), class2(:,2),'s','MarkerEdgeColor','r', 'MarkerFaceColor', 'r', 'MarkerSize',6);

hold off;


%--------------- task2 ---------------

y11 = [ class1(1,1)*class1(1,1) class1(1,2)*class1(1,2) class1(1,1)*class1(1,2) class1(1,1) class1(1,2) 1];
y12 = [ class1(2,1)*class1(2,1) class1(2,2)*class1(2,2) class1(2,1)*class1(2,2) class1(2,1) class1(2,2) 1];
y13 = [ class1(3,1)*class1(3,1) class1(3,2)*class1(3,2) class1(3,1)*class1(3,2) class1(3,1) class1(3,2) 1];

y21 = [ -class2(1,1)*class2(1,1) -class2(1,2)*class2(1,2) -class2(1,1)*class2(1,2) -class2(1,1) -class2(1,2) -1];
y22 = [ -class2(2,1)*class2(2,1) -class2(2,2)*class2(2,2) -class2(2,1)*class2(2,2) -class2(2,1) -class2(2,2) -1];
y23 = [ -class2(3,1)*class2(3,1) -class2(3,2)*class2(3,2) -class2(3,1)*class2(3,2) -class2(3,1) -class2(3,2) -1];

yAll = [y11; y12; y13; y21; y22; y23;];

display(y11);
display(y12);
display(y13);
display(y21);
display(y22);
display(y23);


%----------------task 3 ----------------


%--------------ONE AT A TIME--------------
w = [1 1 1 1 1 1];
alpha = 1;
counter = 0;
flag = 0;
for j = 1:111111
    flag=0;
    counter = counter+1;
    for j = 1:6
    g = yAll(j,:)*w' ;
        if g < 0
            w = w + alpha * yAll(j,:);
        else
            flag = flag + 1;
        end
    end
    
    if (flag == 6)
        break ;
    end
end
fprintf('During One at time, Counter is at %d\n', counter);


%------------MANY AT A TIME---------------

w = [1 1 1 1 1 1];
alpha= 1;
flag = 0;
counter = 0;
temp = 0;

for i = 1:111111
    counter = counter + 1;
    flag = 0;
    for j = 1:6
        g = yAll(j,:)*w' ;
        if g < 0
            temp = temp + yAll(j, :);
        else
            flag = flag + 1;
        end
    end
    if (flag == 6)
        break ;
    end
	w = w + alpha * temp;
end
fprintf('During many at a time, counter is at %d\n', counter);


%----------task 4-------------------

hold on;
syms class1 class2;
s=sym(w(1,1)*class1*class1+w(1,2)*class2*class2+w(1,3)*class1*class2+w(1,4)*class1+w(1,5)*class2+w(1,6));
s2=solve(s,class2);
xvals1=[-10:0.01:10];
xvals2(1,:)=subs(s2(1),class1,xvals1);
plot(xvals1,xvals2(1,:),'k');
grid on, hold off

%--------task 4----------------------

x=[0.1 0.17 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0];
one_at_a_time=[147 132 112 124 105 105 194 194 194 194 127];
many_at_a_time=[166 114 118 123 146 146 106 106 106 106 154];  
plot(x,one_at_a_time,x,many_at_a_time); 

legend('one at a time','many at a time');  
title('one at a time VS many at a time');
grid; 
xlabel('learning rate');
ylabel('steps taken to compute g(x)'); 




