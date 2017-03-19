function filter_bank_implementation()

%% delta signal as an input
inp=[1 zeros(1,10)];

%% analysis filter bank
[ana_lp,ana_hp]=analysis_fb(inp);

%% synthesis filter bank
[syn_lp,syn_hp]=synthesis_fb(ana_lp,ana_hp);

%% add the two outputs
output=syn_lp+syn_hp;

%% plot the input and output result, what do you observe
stem(inp)
hold on 
stem(output, 'r')

end

%% analysis filter bank
% your task is to implemnt analysis filter bank nonefficiently
function [lp,hp]=analysis_fb(inp)
% input is the signal to the analysis filter bank
% lp is the output of the low pass section of the analysis filter bank
% hp is the output of the high pass section of the analysis filter bank

h0=[-1 2 6 2 -1]/8;
h1=[1 -2 1]/2;

signal_1 = filter(h0,1,inp);
signal_2 = filter(h1,1,inp);

lp = downsample(signal_1,2);
hp = downsample(signal_2,2);
end

%% synthesis filter bank
function [lp_out,hp_out]=synthesis_fb(lp,hp)

% lp is the input to the low pass section of the synthesis filter bank
% hp is the input to the high pass section of the synthesis filter bank

% lp_out is the output of the low pass section of the synthesis filter bank
% hp_out is the output of the high pass section of the synthesis filter bank

f0=[1 2 1]/2;
f1=[1 2 -6 2 1]/8;

signal_1 = upsample(lp,2);
signal_2 = upsample(hp,2);

lp_out = filter(f0,1,signal_1);
hp_out = filter(f1,1,signal_2);

end