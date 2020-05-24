%n != 1,=1û������
%p ��ʼ���ʵ�ķ�ʽ��0�ǽ�Aƽ���ָȻ��ÿһ���ƽ��ֵ��Ϊ�ʵ㣬1�����ѡȡ
function [M G] = k_means(A,p,n)
    [r c] = size(A);
    gn = floor(r/n);
    
    G = [];
    for i = 1:n %��ʼ�� centroid ����ʼ�����顣
        if i == 1
            cell = A([1:gn],:);
            G = [{cell}];
        else
            if i == n %���һ�飬����ʣ�µĶ�����
                cell = A([(i - 1)*gn + 1 : r],:);
                G = [G;{cell}];
            else
                cell = A([(i - 1)*gn + 1 : i*gn],:);
                G = [G;{cell}];
            end
        end
    end
    M = k_means_seeds(A,p,n);%centroid seeds
  
    M_ = zeros(n,c);
    G_ = [];
    while ~isequal(M,M_) %ʵ�ʹ��̵��У�����ܿ����޷���ȣ�������һ���ɽ��ܵ���Χ
        M_ = M;
        G_ = [];
        for i = 1:n%��գ���ʼ��
            G_ = [G_;{zeros(1,c) + Inf}];
        end
        
        for i = 1:n
            CM = cell2mat(G(i));%�ó���һ��group��sample��n���ʵ�������
            length = size(CM,1);
            for j = 1:length
                T = [];
                cm = CM(j,:);
                for k = 1:n %����һ��centroid�����
                    d = norm( (cm - M(k,:))' );%ŷʽ����
                    T = [T;d];
                end
                %���������ʵ����Ƚϣ�����һ���ʵ�������ͻ��鵽��һ��
                [m index] = min(T);
                CM_ = cell2mat(G_(index));
                if isequal(CM_,(zeros(1,c) + Inf))%����ǵ�һ��
                    CM_ = cm;
                else
                    CM_ =[CM_;cm];
                end
                G_(index) = {CM_};
            end
        end
        %�����ʵ��λ��
        G = G_;
        for i = 1:n
            CM = cell2mat(G(i));
            if size(CM,1) == 1 %ֻ��һ��sample����ô�ʵ���Ǹ�����
               M(i,:) = CM;
            else
               M(i,:) = mean(CM);
            end
        end
    end
    M;
    G;
end