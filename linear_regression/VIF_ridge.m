%����ѡ����ع���k��k�ڡ�1 10��֮��Ϊ�ã�Խ����1Խ��
function V = VIF_ridge(X,k)
    [r c] = size(X);
    V = []
    for i = 1:c
        Xj = X;
        Xi = X(:,i);
        Xj(:,i) = [];
        Xj = [ones(r,1) Xj];
        
        P = inv(Xj'*Xj + k*eye(c,c))*Xj'*Xi;
        Y_ = MEAN(Xi);
        SSR = sum((Xj*P - Y_).^2);
        SST = sum((Xi - Y_).^2);
        R = SSR/SST;
        V = [V;i 1/(1 - R)];
    end
    V;
end