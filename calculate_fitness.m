function [fit]= calculate_fitness(matrix)

max_conflicts=1620;
no_conf= conflict_no(matrix);
fit= max_conflicts - no_conf;
