%Generate exp(j0.1πn), -100 ≤ n ≤ 100. Plot its real and imaginary parts using the
stem function. Is this sequence periodic? If it is, what is its fundamental period?
From the examination of the plot, what interpretation can you give to the integers
K and N above?
-
Frequency is given to be f= ω0 / 2 pi = 0.1 pi / 2 pi = 1/20
N= 1 / f = 1 / (1 / 20) = 20 
So plot’s fundamental period is 20 sample i.e it repeats after 20 samples 
K/N should be a rational number
CODE:%
range = [-100:1:100];
x = exp(0.1*j*pi*range);
figure ; stem(range, real(x)) ; title("real");

figure ; stem(range, imag(x)) ; title("imag")
