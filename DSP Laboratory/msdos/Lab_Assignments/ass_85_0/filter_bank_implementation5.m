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
% your task is to implemnt analysis filter bank efficiently
function [lp,hp]=analysis_fb(inp)
% input is the signal to the analysis filter bank
% lp is the output of the low pass section of the analysis filter bank
% hp is the output of the high pass section of the analysis filter bank
h0_even = [-1 6 -1]/8;
h0_odd = [2 2]/8;
h1_even = [1 1]/2;
h1_odd = [-2]/2;

signal_1 = downsample(inp,2);
signal_h0_even = filter(h0_even,1,signal_1);
signal_h1_even = filter(h1_even,1,signal_1);

signal_2 = downsample([0,inp],2);
signal_h0_odd = filter(h0_odd,1,signal_2);
signal_h1_odd = filter(h1_odd,1,signal_2);

lp = signal_h0_even + signal_h0_odd;
hp = signal_h1_even + signal_h1_odd;

end

%% synthesis filter bank
function [lp_out,hp_out]=synthesis_fb(lp,hp)

% lp is the input to the low pass section of the synthesis filter bank
% hp is the input to the high pass section of the synthesis filter bank

% lp_out is the output of the low pass section of the synthesis filter bank
% hp_out is the output of the high pass section of the synthesis filter bank

f0_even = [1 1]/2;
f0_odd = [2]/2;
f1_even = [1 -6 1]/8;
f1_odd = [2 2]/8;

signal_f0_even = filter(f0_even,1,lp);
signal_f0_odd = filter(f0_odd,1,lp);

signal_f1_even = filter(f1_even,1,hp);
signal_f1_odd = filter(f1_odd,1,hp);

signal_1 = signal_f0_even + signal_f1_even;
signal_2 = signal_f0_odd + signal_f1_odd;

lp_out = upsample(signal_1,2);
hp_out = upsample(signal_2,2);
hp_out = filter([0 1],1,hp_out);
end