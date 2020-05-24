%ʹ��lvq2�㷨ʵ��clustering
%Ϊ�˱���������֮�����"����"���������Ҫͨ��shrinkage�����ʺ�yield�ر������ڡ�
%shrinkage��0��1֮�䣬ͨ�������0��5����С��shrinkage��ζ�������ٶȿ졣
%yield�رܣ�ͨ���رܻ���ʹ��������ʤ����Ԫ�ܲ��ϼ��ٻ�ʤ�ĸ��ʡ��Ӷ��ó������������Ԫ������������Ԫ������
%yield����ʵ�������ȷ�ϣ���ֵԽ��˵����һ��Խ�����׻�ʤ��
%
%���shrinkage�Ƚ�С����yield�Ƚϴ���Ȼÿ����Ԫ�����ܻ�ʤ���������׳��ֻ�ʤ��Ԫ�䶯̫�죬Ӱ������
%���shrinkage�Ƚϴ󣬶�yield�Ƚ�С�����ܳ�����Ԫ������
%����shrinkage��yield����Ҫ����ʵ�������ȷ����
function [W1 W2]= compet_lvq2(DATA,W1,W2,a,shrinkage,yield,TDATA)
    LABLES = DATA(:,1);
    [r c] = size(DATA);
    DATA_ = DATA(:,[2:c]);
    class_num = size(W2,1);
    subclass_num = size(W2,2)/class_num;
    B = zeros(class_num*subclass_num,1);
    
    %W2 = zeros(class_num,class_num*subclass_num);
    %for i = 1:class_num
    %    W2(i,[(i-1)*subclass_num+1 : i*subclass_num]) = 1;
    %end
    
    %W1 = randn(class_num*subclass_num,c-1);
    for i = 1:r
        L = compet(W1,DATA_(i,:));
        a2 = W2 * L;
        LB = label_convert(LABLES(i),class_num);
        if a2 == LB
            w1 = W1(logical(L),:);
            q = DATA_(i,:);
            W1(logical(L),:) = w1 + a * (q - w1);
        else
            [v ii] = max(LB);%ÿ��subclass�����������������Сֵ��w1������ĵط��ƶ���
            Ws = W1([((ii-1)*subclass_num +1) : ii*subclass_num],:);
            Bs = B([((ii-1)*subclass_num +1) : ii*subclass_num],1);
            [Ls Bs]= compet_in_subclass(Ws,DATA_(i,:),Bs,shrinkage,yield);
            %Ls = ones(subclass_num,1);
            w1 = Ws(logical(Ls),:);
            q = DATA_(i,:);
            %q = DATA_(i,:) .* ones(c-1,subclass_num);
            lg = [zeros((ii-1)*subclass_num,1);Ls];
            W1(logical(lg),:) = w1 + a * (q - w1);%��֣�����ȷ���ݵ㿿����
            lgb = [zeros((ii-1)*subclass_num,1);ones(subclass_num,1)];
            B(logical(lgb),1) = Bs;
            
            w1 = W1(logical(L),:);
            q = DATA_(i,:);
            W1(logical(L),:) = w1 - a * (q - w1);%��֣�Զ�����ݵ㡣
        end
    end
    
    acc = 0;
    [r c]= size(TDATA);
    TLABLES = TDATA(:,1);
    for i = 1:r
        L = compet(W1,TDATA(i,[2:c-1]));
        a2 = W2 * L;
        LB = label_convert(TLABLES(i),class_num);
        if a2 == LB
            acc = acc + 1;
        else
            %TDATA(i,:)
            %L = compet(W1,TDATA(i,[2:c-1]))
            %a2
        end
    end
    acc
    r
    acc/r
end

function L = compet(W1,d)
    [r c] = size(W1);
    L = [];
    for i = 1:r
        l = - norm(W1(i,:)' - d');
        L = [L;l];
    end
    [v,i] = max(L);
    L(:) = 0;
    L(i) = 1;
end

%���ƫ����b����ֹ���ֶ����������
%ÿ��������ƫ����������shrinkage��ÿ�λ�ʤ����Ԫ��Ҫ����һ�����ò�ֵyield���Ӷ���֤ÿ����Ԫ�����Ի�ʤ��
function [L Bs]= compet_in_subclass(Ws,d,Bs,shrinkage,yield)
    [r c] = size(Ws);,
    L = [];
    for i = 1:r
        l = - norm(Ws(i,:)' - d') + Bs(i);
        L = [L;l];
    end
    [v,i] = max(L);
    L(:) = 0;
    L(i) = 1;
    Bs(:) = Bs(:) * shrinkage;
    Bs(i) = Bs(i) - yield;
end

function z = label_convert(label,r)
    z = zeros(r,1);
    z(label) = 1;
end