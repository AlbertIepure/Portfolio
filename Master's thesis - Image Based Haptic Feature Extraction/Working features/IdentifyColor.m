function color_name = IdentifyColor(r,g,b)

% http://colors.findthedata.com/d/s/White

% colors = [[0.521559619201694,0.635300913562578,0.779068654480989]; ... %blue
%           [0.522943243182542,0.415849440311606,0.308825831300139]; ... %brown
%           [0.529345624362207,0.679092180448990,0.397830418586965]; ... %green
%           [0.577943589404210,0.582826175488320,0.572043207185180]; ... %grey
%           [0.758823328877704,0.543789824456895,0.311744791570553]; ... %orange
%           [0.592125489115781,0.245772980413322,0.184990282052941]];    %red
% color_names = {'blue'; 'brown'; 'green'; 'grey'; 'orange'; 'red'};

% colors = [[49 140 231]./255; % bleue de france
%           [102 76 40]./255; % donkey brown
%           [80 125 42]./255; % sap green
%           [128 128 128]./255; %gray
%           [237 135 45]./255; % cadmium orange
%           [178 34 34]./255; % firebrick red
%           [242 243 244]./255]; %anti-flash white
%           
% color_names = {'blue'; 'brown'; 'green'; 'gray'; 'orange'; 'red'; 'white'};

colors = [[0 0 0]./255; % black 
          [158 151 100]./255; %beige
          [0 0 255]./255; % blue
          [150 75 0]./255; % brown
          [0 255 0]./255; % green
          [128 128 128]./255; %gray
          [255 127 0]./255; % orange
          [255 0 0]./255; % red
          [255 255 255]./255; % white
          [255 255 0]./255]; % yellow
          
          
color_names = { 'black'; 'beige'; 'blue'; 'brown'; 'green'; 'gray'; 'orange'; 'red'; 'white'; 'yellow'};

[l a b] = colorspace('Lab<-RGB',[r g b]);
colors_lab = colorspace('Lab<-RGB',colors);
distances = zeros(size(colors_lab,1),1);

for i=1:size(colors_lab,1)
    distances(i) = ColorDifference(l,a,b,colors_lab(i,1),colors_lab(i,2),colors_lab(i,3));
end

[~,pos] = min(distances);

color_name = char(color_names(pos));
    

      
