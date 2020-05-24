%�Ա���ѡ����ǰ�㷨ѡ��
%��ѡ����϶���ߵ��Ա�����ϵ�ʱ���жϲ����������ԣ�ȥ���������Ĳ�����ʹ��ʣ�µ�
%Ҳ������Ϊһ����ѡ�Ա�����ϵļ򻯷�ʽ
function IDS = variables_selecting_forward(X,Y,a)
    [r c] = size(X);
    INDEX = [1:c];%��¼�Ա�����index
    IDS = [1];
    XI = [INDEX;X];
    Xi = [XI(:,1)];%��ʼ��
    Xj = [XI(:,2:c)];
    bic_ = 0;%��������ϵ���������һ�α���һ�ε�ϵ����ѭ����ֹ
    for i = 2:c
        Fj = [];
        for j = 1:c - i + 1
            Xj_t = [Xi(2:r+1,:) Xj(2:r+1,j)];
            st = mutil_linear_significance_test(Xj_t,Y,a);
            if st == 1
                bic = adjusted_RSquare(Xj_t,Y);
                Fj = [Fj;bic Xj(1,j)];%���������룬���ڶ�λ
            end
        end
        SR = sortrows(Fj,1,"des")%���򣬱���ѡ����������
        if isempty(SR) || SR(1,1) <= bic_
            %sr11 = SR(1,1)
            %ra_11 =  ra_
            break;%��ϳ̶��½����������������Ԫ�ش��ڣ�ֹͣ����Ա���
        else
            bic_ = SR(1,1)%��ϳ̶�����������������Ա���
        end
        
        IDS = [IDS SR(1,2)]%���е�������¼����
        %����Xi,Xj
        XI_ = [];
        XJ_ = [];
        for i = 1:c
            k = find(IDS == i);
            if ~isempty(k)
                XI_ = [XI_ XI(:,i)];
            else
                XJ_ = [XJ_ XI(:,i)];
            end
        end
        Xi = XI_;
        Xj = XJ_;
    end
end