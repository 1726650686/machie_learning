%ͨ���������㣬�γ�һ����������
%��Ҫ�ǶԻع麯��������
function CI = estimate(Z,Y,z0,a)
    [r c] = size(Z);
    P = least_squares_estimation(Z,Y);
    p = P' * z0
    t = abs(tinv((1-a/2),r-c));
    y_hat = Z*P;
    s = (Y - y_hat);
    ss = sum(s.^2)/(r - c);
    (z0'*inv(Z'*Z)*z0);
    sv = sqrt((z0'*inv(Z'*Z)*z0)*ss)
    
    CI = [p-t*sv p+t*sv];
end