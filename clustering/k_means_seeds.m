%��������Ҫ�ж�A��column���ܺ�n�൱�������൱ʱclutering���������ʧ��
%p ��ʼ���ʵ�ķ�ʽ��0�ǽ�Aƽ���ָȻ��ÿһ���ƽ��ֵ��Ϊ�ʵ㣬1�����ѡȡ
function M = k_means_seeds(A,p,n)
    [r c] = size(A);
    gn = floor(r/n);
    switch p
        case 0
            M = zeros(n,c);%centroid
            for i = 1:n %��ʼ�� centroid ����ʼ�����顣
                if i == 1
                    item = A([1:gn],:);
                    M(i,:) = mean(item);
                else
                    item = A([(i - 1)*gn + 1 : i*gn],:);
                    M(i,:) = mean(item);
                end
            end
        case 1
            M = zeros(n,c);%centroid
            ms = [];
            %�����ѡ���ʵ㣬���ﻹ���ܴ���һ�����⣬���ԭʼ�����д��ڴ�����ͬ�����ݣ������M���ܳ�����ͬ������ͨ������²�����֡�
            while size(ms,1) ~= n
                m = floor(rand(1)*r);
                if find(ms == m)
                else
                    if m ~= 0
                        ms = [ms;m];
                    end
                end
            end
            M = A(ms,:);    
        otherwise
            M = zeros(n,c);%centroid
            for i = 1:n %��ʼ�� centroid ����ʼ�����顣
                if i == 1
                    item = A([1:gn],:);
                    M(i,:) = mean(item);
                else
                    item = A([(i - 1)*gn + 1 : i*gn],:);
                    M(i,:) = mean(item);
                end
            end
    end
end