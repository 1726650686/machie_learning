%Pѵ��������
%Tѵ�����ݶ�Ӧ�����
%b1��һ���ƫ����

%P_��һ��brf�����ĵ�
%PRS�ڶ���Ĳ�������Ҫ��w��b
function [P_ PRS] = rbf_ols(P,T,b1,VALIDATE_SET_P,VALIDATE_SET_T)
    num = size(P,1);
    A = [];
    P_ = [];
    for i = 1:num
        D = [];
        for j = 1:num
            d = radbas(norm(P(i,:) - P(j,:))*b1);
            D = [D;d];
        end
        A = [A D];%ÿһ�д����� p��ĳ��w�ľ��� ����ֲ�ʽ�����£�����ֱ�����ת�ù���ľ���
    end
    G = [A' ones(num,1)];%�����������һ������A��Ҫת�ã����������γ��д����еľ���֮�����ols���������ֱ��ls�����
    TABLE = array2table(G);
    O = [];
    
    %ѡ����һ���㣬�ο�rbf_schmidt�е�˼·
    for i = 1:num
        mi = TABLE(:,i).Variables;
        hi = (mi' * T) / (mi' * mi);
        oi = (hi.^2 * (mi' * mi)) / (T'*T);
        O = [O;oi]; 
    end
    [value index] = max(O);
    O = [];
    mj = TABLE(:,index).Variables;
    pindex = str2double(extractAfter(TABLE(:,index).Properties.VariableNames,"G"));
    P_ = [P_;P(pindex,:)];
    TABLE(:,index) = [];
    E_ = Inf
    
    count = 0;%�����������n+1�ε������С��n�ε�������ֹ��������Ҫ�Ƿ�ֹ����ĳ�ε���ʹ�����������΢��󣬶���������ֿ��ٱ�С��
    flag = 0;
    for k = 1:num
        g_size = size(TABLE,2);
        for i = 1:g_size - 1
            mi = TABLE(:,i).Variables;
            r = (mj' * mi) / (mj' * mj);
            rm = r * mj;
            mi = mi - rm; %��mi��ͶӰ��mj�Ĳ��ָ�ȥ��,�Ӷ��γ�����
            TABLE(:,i).Variables = mi;
            
            hi = (mi' * T) / (mi' * mi);
            oi = ((hi.^2) * (mi' * mi)) / (T'*T);
            O = [O;oi];
        end
        [value index] = max(O);
        O = [];
        mj = TABLE(:,index).Variables;
        pindex = str2double(extractAfter(TABLE(:,index).Properties.VariableNames,"G"));
        P_ = [P_;P(pindex,:)]
        X2 = rbf_mse(P,T,b1,P_);
        E = test_validate(VALIDATE_SET_P,VALIDATE_SET_T,P_,b1,X2);
        PRS = X2;
        vpa(E_)
        vpa(E)
        if E < 0.01%����С������������
            break;
        end
        if E_ < E
            count = count + 1;%������������������3��������ֹ������
            if count == 3
                break;
            end
        else
            count = 0;
        end
        E_ = E;
        TABLE(:,index) = [];
    end
    
end

function X2 = rbf_mse(P,T,b1,P_)
    p_num = size(P_,1);
    num = size(P,1);
    
    A = [];
    for i = 1:num
       D = [];
       for j = 1:p_num
           d = radbas(norm(P(i,:) - P_(j,:))*b1);%ѵ�����ݵ����ĵ�ľ���
           D = [D;d];
       end
       A = [A D];
    end
    G = [A' ones(num,1)];
    
    %X2 = inv(G'*G)*G'*T;
    X2 = rbf_schmidt(G,T)
    %X2 = rbf_house_holder(G,T);
    %E = sum((T - G*X).^2);
end

function E = test_validate(VALIDATE_SET_P,VALIDATE_SET_T,W1,b1,X2)
    num = size(VALIDATE_SET_P,1);
    p_num = size(W1,1);
    A = [];
    for i = 1:num
       D = [];
       for j = 1:p_num
           d = radbas(norm(VALIDATE_SET_P(i,:) - W1(j,:))*b1);%ѵ�����ݵ����ĵ�ľ���
           D = [D;d];
       end
       A = [A D];
    end
    G = [A' ones(num,1)];
    Y = G * X2;
    E = sum((Y - VALIDATE_SET_T).^2)/num;
end
