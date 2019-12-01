clc
clear all

% INPUT THE PROBLEM MATRIX HERE
problem_matrix=[5,3,0,0,7,0,0,0,0;...
                6,0,0,1,9,5,0,0,0;...
                0,9,8,0,0,0,0,6,0;...
                8,0,0,0,6,0,0,0,3;...
                4,0,0,8,0,3,0,0,1;...
                7,0,0,0,2,0,0,0,6;...
                0,6,0,0,0,0,2,8,0;...
                0,0,0,4,1,9,0,0,5;...
                0,0,0,0,8,0,0,7,9];

% conflict_no() RETURNS THE NUMBER OF CONFLICTS PRESENT IN THE PROBLEM 
k=conflict_no(problem_matrix);

% POPULATION INITIALIZATION
pop_size= 200; % SET POPULATION SIZE HERE (SET AN EVEN NUMBER)
population_set= zeros(pop_size,9,9);
population_set= initialize_pop(population_set,problem_matrix,pop_size); % INITIALIZE FUNCTION CALL

% SET NUMBER OF GENERATIONS
gen= 1500;

for i=1:gen
    
    % SELECTION OPERATION
    % STEP 1 (CALCULATE FITNESS OF EACH INDIVIDUAL IN POPULATION)
    fitness= zeros(pop_size,1);
    test= zeros(9,9);
    for j=1:pop_size
        test=population_set(j,:,:);
        test= squeeze(test);
        fitness(j,1)= calculate_fitness(test);
    end
    max_fit=max(fitness);
    max_fit
    i
    for j=1:pop_size
        if fitness(j,1)==max_fit
            max_fit_mat= squeeze(population_set(j,:,:));
        end
    end
    
    % STEP 2 (ROULETTE WHEEL)
    fitness_sum= sum(fitness);
    prob_matrix= fitness/fitness_sum;
    cum_prob= cumsum(prob_matrix);
    indices= zeros(2,(pop_size/2));
    for k=1:(pop_size/2) % EACH PAIR OF PARENTS PRODUCES 2 CHILDREN
    r1=rand();
    for j=1:pop_size-1
        if r1>= cum_prob(j,1) && r1<= cum_prob(j+1,1)
            index1= j+1;
            break
        end
    end
    if r1<= cum_prob(1,1)
        index1=1;
    end
    if r1>= cum_prob(pop_size,1)
        index1=pop_size;
    end
    indices(1,k)=index1;
    r2=rand();
    for j=1:pop_size-1
        if r2>= cum_prob(j,1) && r2<= cum_prob(j+1,1)
            index2= j+1;
        end
    end
    if r2<= cum_prob(1,1)
        index2=1;
    end
    if r2>= cum_prob(pop_size,1)
        index2=pop_size;
    end
    indices(2,k)=index2;
    end % INDEX CALCULATION FINISHED
    
    new_population_set=population_set; % EXPLAINED AT END
    % CROSSOVER
    for j=1:(pop_size/2)
        parent1=population_set(indices(1,j),:,:);
        parent1=squeeze(parent1);
        parent2=population_set(indices(2,j),:,:);
        parent2=squeeze(parent2);
        f1= calculate_fitness(parent1);
        f2= calculate_fitness(parent2);
        p= f1/(f1+f2);
        child1=parent1;
        child2=parent2;
        t=rand();
        if t<=0.5
            for k=1:9
                r= rand();
                if r<=p
                    child1(k,:)= parent1(k,:);
                    child2(k,:)= parent2(k,:);
                else
                    child1(k,:)= parent2(k,:);
                    child2(k,:)= parent1(k,:);
                end
            end
        else
            for k=1:9
                r= rand();
                if r<=p
                    child1(:,k)= parent1(:,k);
                    child2(:,k)= parent2(:,k);
                else
                    child1(:,k)= parent2(:,k);
                    child2(:,k)= parent1(:,k);
                end
            end
        end
    
    
    % MUTATION
    mutation_prob= 0.08;
    for jj=1:9
        for k=1:9
            if problem_matrix(jj,k)==0
                r=rand();
                if r<=mutation_prob
                    child1(jj,k)= randperm(9,1);
                end
            end
        end
    end
    for jj=1:9
        for k=1:9
            if problem_matrix(jj,k)==0
                r=rand();
                if r<=mutation_prob
                    child2(jj,k)= randperm(9,1);
                end
            end
        end
    end
    
    % SETTING THE NEW POPULATION
    f1= calculate_fitness(parent1);
    f2= calculate_fitness(parent2);
    f3= calculate_fitness(child1);
    f4= calculate_fitness(child2);
    f=[f1,f2,f3,f4];
    f=sort(f);
    a=f(3);
    b=f(4);
    if a==f1
        new_pop_1=parent1;
    end
    if a==f2
        new_pop_1=parent2;
    end
    if a==f3
        new_pop_1=child1;
    end
    if a==f4
        new_pop_1=child2;
    end
    if b==f1
        new_pop_2=parent1;
    end
    if b==f2
        new_pop_2=parent2;
    end
    if b==f3
        new_pop_2=child1;
    end
    if b==f4
        new_pop_2=child2;
    end
    new_population_set(j,:,:)=new_pop_1;
    new_population_set((pop_size/2)+j,:,:)=new_pop_2;
    end
    population_set= new_population_set;
end
max_fit_mat