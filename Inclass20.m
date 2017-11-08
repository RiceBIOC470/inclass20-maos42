%Inclass 20

%In this folder you will find a .mat file with x and y data

% For all of the questions below, use any options as necessary to get a
% good fit - starting points, lower bounds etc. 

% 1. Define a custom model and try to fit the data to a Michaelis function 
% y = V*x/(K+x). 

MMm='(V*x)/(K+x)';
fitmodel=fittype(MMm);

[fitout,fitmetric]=fit(xx',yy',fitmodel, 'Lower',[0, 0, 0]); %we know that the values have to be positive
plot(fitout,xx',yy');
r2=[fitmetric.rsquare] %good
r2adj=[fitmetric.adjrsquare] %good


% 2. Use a custom model to try to fit the data to a Hill function with
% exponent 2: y = V*x^2/(K^2+x^2)

MMm='(V*x^2)/(K^2+x^2)';
fitmodel=fittype(MMm);

[fitout]=fit(xx',yy',fitmodel,'Lower',[0, 0, 0]);
plot(fitout,xx',yy');
r2=[fitmetric.rsquare] %good
r2adj=[fitmetric.adjrsquare] %good

% 3. Now treat the exponent as a free parameter and perform the fit again,
% that is fit to the model y = V*x^n/(K^n+x^n)

MMm='(V*x^n)/(K^n+x^n)';
fitmodel=fittype(MMm);

[fitout]=fit(xx',yy',fitmodel,'Lower',[0, 0, 0], 'Upper',[20, 20, 20]); %without the fixes it can't solve it
plot(fitout,xx',yy');
r2=[fitmetric.rsquare] %good
r2adj=[fitmetric.adjrsquare] %good

% 4. Redo parts 1 and 2, but using your model from 3 and fixing the value of
% n to either 1 or 2.

%when n=1
MMm='(V*x^1)/(K^1+x^1)'; %this is the same as 1 
fitmodel=fittype(MMm);

[fitout,fitmetric]=fit(xx',yy',fitmodel,'Lower',[0, 0, 0]);
plot(fitout,xx',yy');
r2=[fitmetric.rsquare] %good
r2adj=[fitmetric.adjrsquare] %good

%it can automatically find a good fit because the n has been fixed form the
%beginning

%when n=2
MMm='(V*x^2)/(K^2+x^2)';
fitmodel=fittype(MMm);

[fitout,fitmetric]=fit(xx',yy',fitmodel,'Lower',[0, 0, 0]);
plot(fitout,xx',yy');
r2=[fitmetric.rsquare] %good
r2adj=[fitmetric.adjrsquare] %good

%it can automatically find a good fit because the n has been fixed form the
%beginning

