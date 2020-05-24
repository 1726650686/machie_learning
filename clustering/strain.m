%����n��pcoa��ŷʽ�����Ч��
function SS = strain(A,n)
    SS = []
    for i = 1:n
        [Y E] = classical_multidimensional_scaling(A,i);
        M = euclidean_distance_matrix(Y');
        S = strain_CMDS(A,M);
        SS = [SS;i S];
    end
end