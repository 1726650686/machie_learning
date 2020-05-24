%���ﰵ����z0ͨ��ĳW.^1/2ת����wz0��֮����ܷ���ģ�͵�Ҫ��
%����p = P' * z0�������w^1/2����ô��õ�pҲ�Ǻ���w^1/2��
%���sv1Ҳ�Ǻ���w^1/2��CI�ó��Ľ���Ͱ�����w^1/2��
%���������Ҫ�������ԭ��ȥ�������w^1/2�ֻᱻ�������������㷨����д������
%����ʵ������������Ҫ��Ԥ�������Ȩ���ܷ���ģ�ͣ��õ��Ľ��Ҫ����Ȩȥ��
%���˼��ᴩ�������ع飬�����Իع鵽������
function CI = estimate_weight(Z,Y,W,z0,a)
    WX = Z .* W.^(1/2);
    WY = Y .* W.^(1/2);
    P = least_squares_estimation(WX,WY);
    [r c] = size(Z);
    p = P' * z0
    t = abs(tinv((1-a/2),r-c));
    y_hat = Z*P;
    s = (Y - y_hat);
    ss = sum(W .* s.^2)/(r - c);
    %(z0'*inv(Z'*Z)*z0);
    %z0'*inv(Z'*Z)*z0
    %z0'*inv(WX'*WX)*z0
    %sv = sqrt((z0'*inv(Z'*Z)*z0)*ss)
    sv1 = sqrt((z0'*inv(WX'*WX)*z0)*ss)
    
    CI = [p-t*sv1 p+t*sv1];
end