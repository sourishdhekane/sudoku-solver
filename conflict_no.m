function [conflicts]= conflict_no(problem_matrix)

conflicts=0;
for i=1:9
    for j=1:9
        ele_conflict = conflict_no_element(i,j,problem_matrix);
        conflicts = conflicts + ele_conflict;
    end
end