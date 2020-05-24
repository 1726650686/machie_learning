%ʹ��chi2�����������pcoa���������ֵ����ʵ�ʵ�ֵƫ��Ƚ����ԣ���ô�ܾ�ԭ����
%AΪ 1 - ԭʼ�����ϵ����������ĵ�Aͨ����A = 1 - phi�õ���phiΪ���ϵ������
%�Ƿ������similarity_coefficient��Ҫ�������Ҿ���Ӧ�ÿ�����������
function R = strain_CMDS_coefficient(A,M,a)
    n = size(A,1);
    df = (n.^2 - n)/2 - 1;
    
    A(triu(A)==0) = 1;
    M(triu(M)==0) = 1;
    S = 2*(log(A) - log(M));
    SSUM = sum(sum(S)')
    chi2p = chi2inv(1-a,df)
    
    if SSUM < chi2p
        R = 0;
    else
        R = 1;
    end
end