%���ڶ��κ���
unction X = steepest_descent(F,a,MX,X0)
    J = jacobian(F)';
    %?���κ������ ѧϰ�� a
    %H = eval(jacobian(J));
    %[V D] = eig(H);
    %a1 = 2/D(2,2)
    
    X = X0 - a*eval(subs(J,MX,X0));
    d = norm(X - X0);
    X0 = X;
    while d > 0.000001
        X = X0 - a*eval(subs(J,MX,X0))
        d = norm(X - X0);
        X0 = X;
    end
    X;
end
