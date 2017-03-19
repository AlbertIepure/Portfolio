function accuracy = ranking_accuracy(I,H,tolerance_vector)

no_of_matches = 0;

total_no_images = size(I,1);

for i=1:total_no_images
    rank_H = find(H==I(i,1));
    d = tolerance_vector(i);
    if i-d <= rank_H && rank_H <= i+d
        no_of_matches = no_of_matches + 1;
    end
end
    
accuracy = no_of_matches/total_no_images;


