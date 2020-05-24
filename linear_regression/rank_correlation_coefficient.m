%�ȼ����ϵ��
%����spearman���
%NOTE:���������㷨�Ĳ��裬�ڷֲ�ʽ�����²���ȡ����Ҫ����˼��������ڷֲ�ʽ������������㷨
function Rs = rank_correlation_coefficient(X,Y)
    [r c] = size(X);
    P = least_squares_estimation(X,Y)
    E = Y - X*P
    ABS_E = abs(E);
    ABS_E_RANK = sort(ABS_E);
    ABS_E_RANK_INN = [];
    
    for i = 1:r
        e = ABS_E(i,1);
        [col rw] = find(ABS_E_RANK(:,1) == e);
        ABS_E_RANK_INN = [ABS_E_RANK_INN;col(1,1)];
    end
    %�в��ڵȼ���rank���ϲ���һ������
    ABS_E_RANK_2 = [ABS_E ABS_E_RANK_INN]
    
    rs_ = -inf
    for j = 1:c
        Xi = X(:,c)
        X_RANK = sort(Xi);
        
        RANK = []
        for i = 1:r
            xi = Xi(i,1);
            [col rw] = find(X_RANK(:,1) == xi);
            %RANK = [RANK;col(1,1)];%���������ͬ��Ԫ�أ���ôrank��ͬ
            RANK = [RANK;mean(col)];%���ܳ�����ͬ��ֵ����ôȡrank�ľ�ֵ
        end
        
        %����ͬ���Ա���x�������rank�ϲ�
        Xi_RANK = [Xi RANK]
        %�ȼ���ƽ����
        d2 = sum((Xi_RANK(:,2) - ABS_E_RANK_2(:,2)).^2)
        rs = 1 - 6/(r*(r*r - 1)) * d2
        
        if rs_ < rs
            rs_ = rs
        end
    end

    Rs = rs_
end