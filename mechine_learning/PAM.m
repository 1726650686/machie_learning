function [K T KDATA_]= PAM(DATA,k_num)
    [rows cols] = size(DATA);
    k_index = ceil(rand(k_num,1) * rows);
    K = DATA(k_index,:);
    T = zeros(k_num,1);
    KDATA_ = {};
    while 1
        KDATA = {};
        for k = 1:k_num
            KDATA = [KDATA {[]}];
        end
        
        for i = 1:rows
            D = [];
            for j = 1:k_num
                d = euclidean(K(j,:),DATA(i,:));%���������Ǽ�����룬���Էֲ�ʽ�����£����Խ�K����ÿһ��block��Ȼ�󽫽��ɢ�У����ܵ����Σ��������α��ؼ��㡣
                D = [D;d];
            end
            [v in] = min(D);
            KD = cell2mat(KDATA(in));
            KD = [KD;DATA(i,:)];
            KDATA(in) = {KD};
        end
        K_ = zeros(k_num,cols);
        for i = 1:k_num
            KD = cell2mat(KDATA(i));
            [r c] = size(KD);
            for j = 1:r
                [k t]= swap_trace(KD); % !
                K_(i,:) = k;
                T(i,:) = t;
            end
        end
        
        %���K�㲻�ڱ仯����ֹ������
        logk = (K_ == K);
        logks = sum(sum(logk)');
        if logks == k_num*cols
            'break!'
            break;
        else
            K = K_;
        end
        KDATA_ = KDATA;
    end
end

function [k trace_value] = swap_trace(DATA)%��������Ƿֲ�ʽ�������ڽ�ÿ�������ڱ�����ɼ��㡣Ҳ����˵�����ڱ��ذ����ŵĵ��ҳ�����
    k = [];
    trace_value = Inf;
    [r c] = size(DATA);
    for i = 1:r
        D = DATA - DATA(i,:);
        DT = D' * D;
        tr = trace(DT);
        if tr < trace_value
            k = DATA(i,:);
            trace_value = tr;
        end
    end
end

function [k dist] = swap_dist(DATA)%ʹ�þ���������û��ʹ��ɢ�ȶ�����ô�ã���Ϊ���������ݱȽϷ�ɢ���Ƚ�ϡ�裬���ʱ��������Ч������ɢ�ȡ��ŵ����ڼ���򵥡�����Ҫȡ�������󣬶����������ϴ������������ԡ�
    k = [];
    dist = Inf;
    [r c] = size(DATA);
    for i = 1:r
        d = euclidean(DATA,DATA(i,:));
        if d < dist
            k = DATA(i,:);
            dist = d;
        end
    end
end

function d = euclidean(DATA,D)
    [cols rows] = size(DATA);
    DM = DATA - D;
    SUM = zeros(cols,1);
    for i = 1:rows
       SUM = SUM + DM(:,i).^2;
    end
    d = sum(sqrt(SUM));
end