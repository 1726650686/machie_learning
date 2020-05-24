%�ֲ���Ȩ��ʹ��Ԥ������������Ծۼ��ĵط�ƫ��
function YH = lwlr(tp,X,Y,k)
    [m n]= size(X);
    XW = zeros(m,n);
    %w = inv(X'WX)*X'WY
    for i = 1:m
        L = tp - X(i,:);
        gs = exp(L*L'/(-2*(k.^2)));
        XW(i,:) = X(i,:) .* gs;
    end
    w = inv(XW'*X)*XW'*Y;
    YH = tp*w;
end