%����ɾ�������쳣��ļ�⣬�ж�ɾ���õ�֮�󣬹��Ʋ����ı仯���
function PS = error_point_checking_params_base_deleting(X,Y)
    [r c] = size(X);
    P = least_squares_estimation(X,Y);
    [pr pc] = size(P);
    IX = inv(X'*X);
    H = hat_matrix(X);

    E = Y - X*P;
    XE = X.*E;
    D = (1 - diag(H)).^(-1);
    R = IX * (XE .* D)';
    O = ones(r,pc)
    
    PS = [ O .* P' (O .* P' - R')];
end