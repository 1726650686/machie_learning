%ע���ols������hebb������̫�󣬲�����Ҫ��pinv��ʹ�÷ֲ�ʽ������ʵ���Ѷȴ�
function INDEX = hebb(LABLES,DATA,V)
    W = LABLES*pinv(DATA);
    R_ = hardlims(W*V)
    
    distance = Inf;
    INDEX = Inf;
    n = size(LABLES,2);
    LR_ = R_ == 1;
    for i = 1:n
        LV = LABLES(:,i) == 1;
        hamming_distance = sum(xor(LV,LR_));
        if hamming_distance < distance
           distance = hamming_distance;
           INDEX = i;
        end
    end
end