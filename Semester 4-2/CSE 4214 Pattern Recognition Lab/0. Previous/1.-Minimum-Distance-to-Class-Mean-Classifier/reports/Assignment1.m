
 %Taking sample input
W=[2 2;3 1; 3 3; -1 -3 ; 4 2; -2 -2];
W1=[0 0;-2 2; -1 -1; -4 2;-4 3; 2 6];
plot(W(:,1),W(:,2),'g+')
hold on;
plot(W1(:,1),W1(:,2),'m+')
hold on;
title('Designing a Minimum Distance to Class Mean Classifier');
xlabel('X1');
ylabel('X2');
%mean calculation
m1=mean(W);
m2=mean(W1);
hold on

m3 = plot(m1(1),m1(2),'o','MarkerEdgeColor','r','LineWidth',1.5);
hold on

m4 = plot(m2(1),m2(2),'o','MarkerEdgeColor','g','LineWidth',1.5);

%sapmle input
X=[-1 -1;3 2;-2 1;8 2];
%Calculating Linear Discriminant Function
for i = 1:length(X)
g1=X(i,:)*m1'-0.5*m1*m1';
g2=X(i,:)*m2'-0.5*m2*m2';
if(g1>g2)
plot(X(i,1),X(i,2),'r*');  
else
plot(X(i,1),X(i,2),'c* ');
hold on;
end
end

%decision boudary...
coefficient = m1-m2;

constant = -0.5*det((m1' * m1)- (m2' * m2));

bon = [-4:2:8];

for i = 1:length(bon)
    N(:,i) = -((coefficient(1,1)* bon(:,i)+constant)/coefficient(1,2));                                                                              
end

decision_boundary = [bon',N'];

plot(decision_boundary(:,1),decision_boundary(:,2),'-.b');
hold off;



sample = [-1 -1;3 2;-2 1;8 2];


%Calculating Linear Discriminant Function

for i = 1:length(sample)
    g1 = sample(i,:)*y1'-.5*(y1*y1');
    g2 = sample(i,:)*y2'-.5*(y2*y2'); 

    if g1 > g2     
      plot(sample(i,1),sample(i,2),'x','MarkerEdgeColor','r','LineWidth',1.5);      
    else      
      plot(sample(i,1),sample(i,2),'x','MarkerEdgeColor','g','LineWidth',1.5);      
    end
end



%Decision Boundary Between Two-classes

coefficient = y1-y2;

constant = -0.5*det((y1' * y1)- (y2' * y2));

b = [-4:2:8];

for i = 1:length(b)
    y(:,i) = -((coefficient(1,1)* b(:,i)+constant)/coefficient(1,2));                                                                              
end

d_boundary = [b',y'];

plot(d_boundary(:,1),d_boundary(:,2),'-.b');
hold off;



