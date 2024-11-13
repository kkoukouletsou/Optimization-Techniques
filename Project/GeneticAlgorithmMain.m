function [] = GeneticAlgorithmMain()
%a and c values
a = [1.25 1.25 1.25 1.25 1.25 1.5 1.5 1.5 1.5 1.5 1 1 1 1 1 1 1];
c = [54.13 21.56 34.08 49.19 33.03 21.84 29.96 24.87 47.24 33.97 26.89 32.76 39.98 37.12 53.83 61.65 59.73];

%initial population
for i = 1:1:10
     chr1(i, :) = Generation1;
end

%fitness function;
fitnessfunction = FitnessFunction(a, c, chr1);

%Roulette
[sum, I] = Roulette(fitnessfunction);

%Next Generation
i = 0;
while true
    i = i + 1;
    chr2 = NextGeneration(chr1, sum, I, 1, 100);
    
    %evaluation
    fitnessfunction2(i, :) = FitnessFunction(a, c, chr2);
    
    %Mutation
    int = randi([1 10]);
    chr2(int, :) = Mutation(chr2(int, :), c);
    
    %Crossover
    int2 = randi([1 10]);
    int3 = randi([1 10]);
    d1 = chr2(int2, :);
    d2 = chr2(int3, :);
    [chr2(int2, :), chr2(int3, :)] = Crossover(d1, d2, c, 1, 100);
    
    %termination condition
    if i > 1
        if norm((fitnessfunction2(i - 1, :) - fitnessfunction2(i, :))/fitnessfunction2(i - 1, :)) < 1 * 1.0e-20
            break;
        end
    end
    
    %Roulette
    [sum, I] = Roulette(fitnessfunction2);
    chr1 = chr2;
end

disp("Number of iterations is " + i);
disp("Final Chromosome is");
disp(chr2(10, :)); 

%optimal time calculations
time = 0;
for l = 1:1:17
    time = time + a(l) * chr2(10, l)/(1 - (chr2(10, l)/c(l)));
end
disp("Total time is " + time);

%last check that all conditions are met
if Check(chr2(1, :), c, 100) == 1
    disp("This is a valid solution.");
else
    disp("Solution is invalid.");
end

%plot
plot(fitnessfunction2(1, :), 'b--' , 'LineWidth', 1);        
title("$$Genetic\ Algorithm\ Plot$$", 'interpreter', 'latex');
xlabel("$$Generation$$", 'interpreter', 'latex');
ylabel("$$Fitness\ Function$$", 'interpreter', 'latex');
end

