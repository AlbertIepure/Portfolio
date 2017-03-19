function filter_bank_prototype_filter_design()

%% Protoype Filter Design 1 %%

% analysis filter bank
h0=[-1 2 6 2 -1]/8;
%h1= % find h1
h1=[1 -2 1]/2;

% synthesis filter bank
f0=[1 2 1]/2;
%f1= % find f1
f1=[1 2 -6 2 1]/8;

% verifying perfect reconstruction condition (Theorem  4.1 on Pag 105 ) 
 upper=conv(h0,f0);
 lower=conv(h1,f1);
 fvtool(upper)
 fvtool(lower)
 fvtool(upper+lower)

%% Protoype Filter Design 2 %%

% analysis filter bank
h0=[1+sqrt(3) 3+sqrt(3) 3-sqrt(3)  1-sqrt(3)]/(4*sqrt(2));
%h1= % find h1
h1=[1-sqrt(3) sqrt(3)-3 3+sqrt(3) -(1+sqrt(3))]/(4*sqrt(2));

% synthesis filter bank
% f0= % find f0
f0=fliplr(h0);
% f1= % find f1
f1=[-(1+sqrt(3)) 3+sqrt(3) -(3-sqrt(3))  1-sqrt(3)]/(4*sqrt(2));

% verifying perfect reconstruction condition (Theorem  4.1 on Pag 105 ) 
 upper=conv(h0,f0);
 lower=conv(h1,f1);
 fvtool(upper)
 fvtool(lower)
 fvtool(upper+lower)
 
end

