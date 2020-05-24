%dԽ���������ݵ�Խ���׾ۺ���һ�𣬴Ӷ����������ݵ�����
%���ǳ���dԽ��Խ�ʺϽ��������ݵ������ƶ��������������ݡ�
%���ŵ��������d��Խ��ԽС����������΢��
%aҲ��������һ��ʼ�ܴ����ŵ��������Խ��ԽС��
%�Ƚ�d���ٽ�a����d��֤��������Էֿ�ֿ�������������ݿռ䡣d����ȡ0��������עһ����Ԫ������ע�ܱߡ�
%��a�൱��΢����
%
%
%��ͬ��lvq2��sofmû��Զ�����ݵ�Ļ��ƣ����Ա���������һ��������ɢ���������ݿռ�����ơ�
%ͨ����ÿ���������ݵ��ܱ����ݵ��ǩ��ͳ�ƣ����Ի�ø����ݵ㸽����һ�����ݱȽ϶࣬�Ӷ�ͨ����ǩʵ�����ݿ��ӻ���
%���ֿ��ӻ����Խ���γ�ȵ�clustering���ݣ�������ά�����鿴��
function [W U]= sofm(DATA,W,d,a)
    [r c] = size(DATA);
    [l w h q] = size(W);
    U = zeros(h,q);
    for k = 1:r
        p = DATA(k,[2,3]);
        [i j] = compet(W,p);
        [W U]= domain(W,U,i,j,DATA(k,:),d,a);
    end
end

function [i j] = compet(W,p)
    [l w h n] = size(W);
    M = zeros(h,n);
    for i = 1:h
        for j = 1:n
           M(i,j) = -norm(W(:,:,i,j) - p');
        end
    end
    [v i] = max(M);
    [vv j] = max(v');
     i = i(j);
end

function [W M]= domain(W,M,i,j,P,d,a)
    [x y r c] = size(W);
    id = i - d;
    if id <= 0
        id = 1;
    end
    jd = j - d;
    if jd <= 0
        jd = 1;
    end
    id_ = i+d;
    if i + d >= r
        id_ = r;
    end
    jd_ = j+d;
    if j + d >= c
        jd_ = c;
    end
    
    for ii = id:id_
        for ji = jd:jd_
            W(:,:,ii,ji) = W(:,:,ii,ji) + a*(P([2,3])' - W(:,:,ii,ji));
            M(ii,ji) = P(1);
        end
    end
    
end