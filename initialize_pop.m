function [population_set]= initialize_pop(population_set,problem_matrix,pop_size)

for i=1:pop_size
    t= problem_matrix;
    for j=1:9
        for k=1:9
            if t(j,k)==0
                random= randperm(9,1);                    
                t(j,k)= random;    
            end
        end
    end
    population_set(i,:,:)=t;
end