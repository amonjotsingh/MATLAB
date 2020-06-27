%
Generate and plot cos(0.1n), -20 ≤ n ≤ 20. Is this sequence periodic? What do
you conclude from the plot? If necessary, examine the values of the sequence in
MATLAB to arrive at your answer.
-
N= 2 pi / 0.1 = 20 pi
20 pi is not a rational number so it wouldn't we considered periodic 
%
 range = -20 : 1 : 20;
 x1 = cos(0.1*range);
 stem(range, x1);title("cosine plot");
