%������Լ�⣬��������������󣬲���dw����ʱ�򣬵õ��Ľ���ڱ߽總�������ܻ�ó���ƫ��
%ע��۲츨���ع�ģ��ͨ��ols�õ��Ļع�ϵ��������бȽ���ȷ������ԵĻ����ع�ϵ�����������֡�
function R = BG_test(X,Y,k)
    [r c] = size(X);
    B = least_squares_estimation(X,Y);
    E = Y - X*B;
    k_ = k+1;
    Et = E(k_ : r);
    Et_k = [];
    l = r - k;
    for i = 1:k
        Eti = E([i : l+i-1],:);
        Et_k = [Et_k Eti];
    end
    X_Et_k = [X([k_ : r],:) Et_k];
    r2 = R_square(X_Et_k, Et)
    T = r - k;
    R = T*r2;
    
end