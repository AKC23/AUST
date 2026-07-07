%Taking sample input and plotting

W=xlsread('50w.xls');
W1=xlsread('50w1.xls')


plot(W(:,1),W(:,2),'r*')
hold on
plot(W1(:,1),W1(:,2),'b+')
hold on


%calculating the mean

m1=mean(W);
m2=mean(W1);
hold on

m3 = plot(m1(1),m1(2),'O','MarkerEdgeColor','r','LineWidth',2.5);
hold on

m4 = plot(m2(1),m2(2),'O','MarkerEdgeColor','b','LineWidth',2.5);
hold on
%sapmle input

X=xlsread('50s1.xls');
%Calculating Linear Discriminant Function
for i = 1:length(X)
g1=X(i,:)*m1'-0.5*m1*m1';
g2=X(i,:)*m2'-0.5*m2*m2';
if(g1>g2)
plot(X(i,1),X(i,2),'g*');  
hold on
else
plot(X(i,1),X(i,2),'m+ ');
hold on;
end
end

%Decision Boundary

coefficient = m1-m2;

constant = -0.5*det((m1' * m1)- (m2' * m2));

bon = [-30:1:30];

for i = 1:length(bon)
    N(:,i) = -((coefficient(1,1)* bon(:,i)+constant)/coefficient(1,2));                                                                              
end

decision_boundary = [bon',N'];
title('Designing a Minimum Distance to Class Mean Classifier');
xlabel('X1');
ylabel('X2');
plot(decision_boundary(:,1),decision_boundary(:,2),'-');
hold off;
