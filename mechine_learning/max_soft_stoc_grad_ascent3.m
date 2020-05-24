function [WEIGHTS B] = max_soft_stoc_grad_ascent3(DATA,WEIGHTS,B,a)
    [rows col]= size(DATA);
    LABELS = DATA(:,1);
    DATA_ = DATA(:,[2:col]);
    [r c] = size(WEIGHTS);
    for k = 1:rows
        LB = label_convert(LABELS(k),r);
        SM = WEIGHTS * DATA_(k,:)' + B;
        [v index] = max(SM);
        sm_max = SM(index);
        sm = exp(SM - sm_max) / sum(exp(SM - sm_max));
        S = zeros(r,r);
        
        %����soft max�ĵ�����
        %�����p168��ʹ�õ����Խǻ���һ�����Խǻ������������
        %��ʵ������ǣ�ÿ������������Ӱ�쵼�����Ӷ������ضԽ�������Ҳ�����ݣ�������0��
        for j = 1:r
            for i = 1:r
                if i == j
                    S(j,i) =  sm(i) * (1 - sm(j));
                else
                    S(j,i) =  - sm(j) * sm(i);
                end
            end
        end

        %�������ʹ���ݶ��½�����Ҫ���ϸ��ţ����������������Ҫ���š�
        %�������������½�����Ҫ���Ƶ���ʱ�����ȷ����������������趨Ϊ - Loss function������Ƶ��Ĺ����л���ַ��ű�������
        %���������ţ������ѧ���ݶ��½������û���������ţ���ȻҲ�����ݶ��½���������ѧ���������ݶ�̧����
        e = (LB - sm);
        s = S * e;
        WEIGHTS = WEIGHTS + a * (s * DATA_(k,:));
        B = B + a * s;
    end
    
    [S C] = validate(DATA,WEIGHTS,B);
    S/rows
    C/rows
    
end

function z = label_convert(label,r)
    z = zeros(r,1);
    z(label) = 1;
end

function [S C]= validate(DATA,WEIGHTS,B)
    [rows col]= size(DATA);
    LABELS = DATA(:,1);
    DATA_ = DATA(:,[2:col]);
    [r c] = size(WEIGHTS);
    S = 0;
    acc = 0;
    for j = 1:rows
        SM = WEIGHTS * DATA_(j,:)' + B;
        [v i] = max(SM);
        sm_max = SM(i);
        sm = exp(SM - sm_max) / sum(exp(SM - sm_max));
        LB = label_convert(LABELS(j),r);
        
        s = sum((sm - LB).^2);
        S = S + s;
        
        [v i] = max(sm);
        if i == LABELS(j)
            acc = acc + 1;
        end
    end
    C = acc;
end