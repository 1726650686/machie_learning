%���� ����ŷʽ�����pcoa��Ч��
% 20%ΪЧ���ܲ� 10%Ч��һ�� 5%ΪЧ���ȽϺ� 2��5%Ч���� 0%����
function S = strain_CMDS(D,M)
    S1 = (D - M).^2;
    S2 = D.^2;
    
    SS1 = sum(sum(S1)');
    SS2 = sum(sum(S2)');
    
    S = sqrt(SS1/SS2);
end