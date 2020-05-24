%������Ⱥ����������������С�ıȽϿ죬˵����ȺЧ�����ԣ�������ٵ�����˵�����ӷ�ȺЧ��������
function R = k_means_within_group_square(A,p,n)
    R = []
    for i = 1:n
        [M G] = k_means(A,p,i);
        D = within_group_distance(M,G);
        R = [R;i D];
    end
end

function D = within_group_distance(M,G)
    [r c] = size(M);
    [gr gc] = size(G);
    D = 0;
    for j = 1:gr
        GM = cell2mat(G(j));
        length = size(GM,1);
        for k = 1:length
            d = GM(k,:) - M(j,:);
            D = D + d*d';
        end
    end

end