function [ele_conflicts]= conflict_no_element(i,j,problem_matrix)

ele_conflicts=0;
element=problem_matrix(i,j);
flag=zeros(9,9);

for y=1:9
    if y~=i
        if problem_matrix(y,j)== element
            ele_conflicts = ele_conflicts + 1;
        end
        flag(y,j)=1;
    end
    if y~=j
        if problem_matrix(i,y)== element
            ele_conflicts = ele_conflicts + 1;
        end
        flag(i,y)=1;
    end
end


if (i<4) && (j<4)
    for p=1:3
        for q=1:3
            if flag(p,q)==0
                if problem_matrix(p,q)== element
                    ele_conflicts = ele_conflicts + 1;
                end
                flag(p,q)=1;
            end
        end
    end
end
if (i<4) && (3<j) && (j<7)
    for p=1:3
        for q=4:6
            if flag(p,q)==0
                if problem_matrix(p,q)== element
                    ele_conflicts = ele_conflicts + 1;
                end
                flag(p,q)=1;
            end
        end
    end
end
if (i<4) && (6<j) && (j<10)
    for p=1:3
        for q=7:9
            if flag(p,q)==0
                if problem_matrix(p,q)== element
                    ele_conflicts = ele_conflicts + 1;
                end
                flag(p,q)=1;
            end
        end
    end
end
if (3<i) && (i<7) && (j<4)
    for p=4:6
        for q=1:3
            if flag(p,q)==0
                if problem_matrix(p,q)== element
                    ele_conflicts = ele_conflicts + 1;
                end
                flag(p,q)=1;
            end
        end
    end
end
if (3<i) && (i<7) && (3<j) && (j<7)
    for p=4:6
        for q=4:6
            if flag(p,q)==0
                if problem_matrix(p,q)== element
                    ele_conflicts = ele_conflicts + 1;
                end
                flag(p,q)=1;
            end
        end
    end
end
if (3<i) && (i<7) && (6<j) && (j<10)
    for p=4:6
        for q=7:9
            if flag(p,q)==0
                if problem_matrix(p,q)== element
                    ele_conflicts = ele_conflicts + 1;
                end
                flag(p,q)=1;
            end
        end
    end
end
if (6<i) && (i<10) && (j<4)
    for p=7:9
        for q=1:3
            if flag(p,q)==0
                if problem_matrix(p,q)== element
                    ele_conflicts = ele_conflicts + 1;
                end
                flag(p,q)=1;
            end
        end
    end
end
if (6<i) && (i<10) && (3<j) && (j<7)
    for p=7:9
        for q=4:6
            if flag(p,q)==0
                if problem_matrix(p,q)== element
                    ele_conflicts = ele_conflicts + 1;
                end
                flag(p,q)=1;
            end
        end
    end
end
if (6<i) && (i<10) && (6<j) && (j<10)
    for p=7:9
        for q=7:9
            if flag(p,q)==0
                if problem_matrix(p,q)== element
                    ele_conflicts = ele_conflicts + 1;
                end
                flag(p,q)=1;
            end
        end
    end
end


