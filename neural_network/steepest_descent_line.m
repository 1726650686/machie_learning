%��ֱ����С�������ڶ��κ���
function X = steepest_descent_line(F,MX,X0)
    J = jacobian(F)';
    H = eval(jacobian(J));
    G = eval(subs(J,MX,X0));%��ʼλ��
    P0 = -G;%����
    a = -(G'*P0)/(P0'*H*P0)%ѧϰ��
    if isnan(a)
       a = 0
    end
    X = X0 - a*G
    d = norm(X - X0);
    X0 = X;
    while d > 0.000001
        Gk = eval(subs(J,MX,X0));
        Pk = -Gk
        a = -(Gk'*Pk)/(Pk'*H*Pk)
        if isnan(a)
            a = 0
        end
        X = X0 - a*Gk
        d = norm(X - X0);
        X0 = X;
    end
    X;
end