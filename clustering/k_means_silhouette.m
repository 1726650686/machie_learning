% s(i) = [ b(i) - a(i) ] / max( a(i),b(i) )
% bΪȺ�еĵ㵽����Ⱥ����С����
% aΪȺ�еĵ㵽��Ⱥ�е��������ƽ������
% ����ÿһ�����ڷ�Ⱥ�еı��֣��������Ը�������Ⱥ������
function S = k_means_silhouette(G)
    %MM = average_within_group_distance(G)
    %LMM = lowset_average_btw_group_distance(G)
    
    [MM LMM] = item_clustering_distance(G)
    M = LMM - MM
    MAXMM = max([MM LMM]')'
    S = M .* MAXMM.^-1
end

%��������ÿһ���㵽�������ƽ������
function MM = average_within_group_distance(G)
    [gr gc] = size(G);
    MM = [];
    for j = 1:gr
        GM = cell2mat(G(j));
        [length wide]= size(GM);
        
        for k = 1:length
            DM = GM(k,:) .* ones(length,wide) - GM; %��Ⱥ����������Ĺ�ϵ
            D = 0;
            if isequal(DM,zeros(length,wide))
                D = 0;
            else
                D = sum(sqrt(sum((DM .* DM)')')) / length; %�������������ƽ������
            end
            MM = [MM;D];%ĳ���㵽ͬһ���������������ľ����ƽ��ֵ��
        end
    end
end

function LMM = lowset_average_btw_group_distance(G)
    [gr gc] = size(G);
    LMM = [];
    for i = 1:gr
        GM = cell2mat(G(i));
        length = size(GM,1);
        for j = 1:length
            VD = [];
            for k = 1:gr
                GM_ = cell2mat(G(k));
                [r_ c_] = size(GM_);
                DM = GM(j,:) .* ones(r_,c_) - GM_;% ĳ���㵽�����飨Ⱥ������������㡣
                D = sum(sqrt(sum((DM .* DM)')')) / r_;%����������Ⱥ�ĵ��ƽ������
                VD = [VD;D];
            end
            VD(i) = [];%ȥ���Լ����ڵ�Ⱥ
            LMM = [LMM;min(VD)];
        end
    end
end

function [MM LMM] = item_clustering_distance(G)
    [gr gc] = size(G);
    LMM = [];
    MM = [];
    for i = 1:gr
        GM = cell2mat(G(i));
        length = size(GM,1);
        for j = 1:length
            VD = [];
            for k = 1:gr
                GM_ = cell2mat(G(k));
                [r_ c_] = size(GM_);
                DM = GM(j,:) .* ones(r_,c_) - GM_;% ĳ���㵽�����飨Ⱥ������������㡣
                D = sum(sqrt(sum((DM .* DM)')')) / r_;%����������Ⱥ�ĵ��ƽ������
                VD = [VD;D];
            end
            MM = [MM;VD(i)];%��Ҫȥ���ĵ㣬ǡ�����Լ������ڵ�Ⱥƽ������
            VD(i) = [];%ȥ���Լ����ڵ�Ⱥ
            LMM = [LMM;min(VD)];
        end
    end
    [MM LMM];
end