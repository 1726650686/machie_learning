%VIF>5�����ڶ��ع�����
function V = VIF(X)
    [r c] = size(X);
    V = []
    for i = 1:c
        Xj = X;
        Xi = X(:,i);
        Xj(:,i) = [];
        Xj = [ones(r,1) Xj];
        R = R_square(Xj,Xi);
        
        V = [V;i 1/(1 - R)];
    end
    V;
end