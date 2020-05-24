%����в�ľ��� residual mean square
%�����z�Ǽ�����ones��x��1��,����r - c��
%��Щ���ϻ�дr�������ǵ�r�Ǿ���û�м�ones��ʱ���ά�ȣ����Ի�n - r -1
function S = MSRes(Z,Y,P)
    [r c] = size(Z);
    y_hat = Z*P;
    s = (Y - y_hat);
    S = sum(s.^2)/(r - c);
end