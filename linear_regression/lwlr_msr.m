%�ֲ���Ȩ��ʹ��Ԥ������������Ծۼ��ĵط�ƫ��
%��������˵���k��һ����������в�ƽ���͡�
%NOTE:�������inv(x'*x)�ӽ�����˵���в�ƽ����ͻȻ������Զ�k�ĵ�����Ҫע��
function YHS = lwlr_msr(X,Y,k)
    [m n]= size(X);
    YH = zeros(m,1);
    for i = 1:m
        YH(i) = lwlr(X(i,:),X,Y,k);
    end
    YHS = sum((YH - Y).^2);
end