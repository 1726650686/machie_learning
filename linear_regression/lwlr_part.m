%�ֲ���Ȩ��ʹ��Ԥ������������Ծۼ��ĵط�ƫ��
%����ֻ���ò������ݣ��Ӷ��������һ��˼·��
%ʹ��ols������֮������������������Ȩ���Ӷ����������
function YH = lwlr_part(tp,X,Y,k,range)
    XY = [X Y];
    [m n] = size(X);
    P = least_squares_estimation(X,Y);
    Yhat = tp*P;
    %�������Ա㽫����������������������
    XYS = sortrows(XY,n+1);
    lt = XYS(:,n+1) < Yhat + range;
    gt = XYS(:,n+1) > Yhat - range;
    logic = lt & gt;
    XYL = XY(logic,:);
    XL = XY(logic,[1:n]);
    YL = XY(logic,n+1);
    [lm ln] = size(XYL)
    XW = zeros(lm,ln-1);
    %w = inv(X'WX)*X'WY
    for i = 1:lm
        L = tp - XL(i,:);
        gs = exp(L*L'/(-2*(k.^2)));
        XW(i,:) = XL(i,:) .* gs;
    end
    w = inv(XW'*XL)*XW'*YL;
    YH = tp*w;
end