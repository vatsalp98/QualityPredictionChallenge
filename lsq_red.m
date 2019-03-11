%
%  lsq_red.m -- hl -- (Feb. 2019)
%

% load the red data into an array
red = csvread('red.csv'); 

% names of the columns in red array
titles = ["fixed acidity";"volatile acidity";"citric acid";"residual sugar";  ...
          "chlorides";"free sulfur dioxide";"total sulfur dioxide";"density"; ...
          "pH";"sulphates";"quality"];

% least-squares matrix A
cols = [1:10];
A = [ones(size(red(:,1))) red(:,cols)];

% known quality ratings
y = red(:,11); 
     
% solve for lsq coefficents using "\"
c = A \ y; 

% compute RMS error 
RMS = rms(A*c-y)

% insert the normal equations solve here: 
y = (A.'*A)*c

% insert the QR solve here: 
[Q,R]= qr(A);

% insert the permuted QR solve here: 
[Q,R,E] = qr(A,0);
% uncomment this line to generate permutation matrix P
I = eye(11,11); P = I(:,E);


% the below plotting tool MAY help you with the quality prediction
% challenge. The plot shows the relationship between the jj^th
% attribute and the quality rating. 
% You can visualize various relationships by changing jj

% If you use this tool, do not feel obligated to include the plots 
% in your report. 

jj = 3
figure(jj);  clf

plot(red(:,jj),red(:,end),'.')
title([titles{jj}, ' vs. quality rating'],'fontsize',15)
xlabel([titles(jj)],'fontsize',15)
ylabel('quality','fontsize',15)
grid on












