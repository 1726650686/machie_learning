%NOTE:ÿһ��ɾ�������һ���Ա�������������ɲ����������Է����仯������״̬�£���Ҫ���ϵ�ȥ�ж�
%��ÿһ�ε���Ӻ�ɾ�����������������жϣ����Ҷ���϶ȵ�Ӱ�죬�������е��鷳��
%���Լ��˲��裬ֱ��ɾ���Ա���֮�󣬶Բ������������жϣ�Ȼ��ѡ����϶���õ��Ա�����Ϊ���
function IDS = variables_selecting_both(X,Y,a)
    [r c] = size(X);
    INDEX = [1:c];
    XI = [INDEX;X];
    Xi = [XI];
    ra_ = adjusted_RSquare(X,Y)%���Ըĳ�bic,Ч�����һЩ
    
    while 1
        [ri ci] = size(Xi);
        Xij = Xi;
        flag = 1;
        for j = 2:ci
            Xi_t = Xi;
            %id = Xi_t(1,j)
            Xi_t(:,j) = []; % ���ĳһ��
            st = mutil_linear_significance_test(Xi_t(2:r+1,:),Y,0.05);
            if st == 1
                RS = regression_params_significance_test(Xi_t(2:r+1,:),Y,0.05)
                index = [];
                [rsr rsc] = size(RS);
                for i = 1:rsr
                    if RS(i,2) == 0
                        index = [index i];%ȥ����������������ϳ̶�
                    end
                end
                k = find(index == 1)
                if ~isempty(k)
                    index(1) = [];%��һ�в���ȥ��
                end
                Xi_t(:,index) = []
                ra = adjusted_RSquare(Xi_t(2:r+1,:),Y)
                vpa(ra)
                if ra > ra_ %�����������
                    Xij = Xi_t;
                    ra_ = ra;
                    flag = 0
                end
            end
        end

        if flag == 0
            Xi = Xij; %����������� ����ѭ��
        else
            break; %��϶��޷���ߣ�������ֹ
        end
    end
    %ra_
    IDS = [Xi(1,:)]
end