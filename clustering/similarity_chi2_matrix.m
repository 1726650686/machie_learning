%��ÿһ�е�variable��������������ָ�ֵ��˵��1 0�ĳ����෴����������-1��˵����ȫ�෴��
function M = similarity_chi2_matrix(A)
    [r c] = size(A);
    M = zeros(c,c);
    for i = 1:c
        for j = 1:c
            M(i,j) = similarity_chi2(A(:,i),A(:,j));
        end
    end
end