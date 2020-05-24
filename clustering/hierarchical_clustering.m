%MΪ����Ԫ��֮���໥����ľ���
%p 0���룬1�����ԣ�2����
%m 0:single_linkage 1:complete_linkage 2:average_linkage
function T = hierarchical_clustering(M,p,m)
    length = size(M,1);
    index = num2cell(1:length);
    A = M
    T = {};
    switch p
        case 0 %ʹ�þ���
            C = {}
            for k = 1:length-1
                A = clear_upper_triangular(A,Inf);
                [mx i] = min(A);
                [my iy] = min(mx);
                x = i(iy);
                y = iy;
                
                x_ = cell2mat(index(x));%index�е�Ԫ�ؿ�����һ��group
                y_ = cell2mat(index(y));
                %[x_ y_]
                CA = {A(x,y),[x_ y_]};
                C = [C; CA];%����,Ԫ��
                index = mutil_value_set_null(index,x,y);
                [x_,y_]
                index = [[x_,y_] index]%�ϲ�Ԫ��
                
                %�������
                %[r c] = size(index)
                lk = length-k;
                A_ = zeros(lk,lk);
                for i_ = 1:lk
                    Gi = index(i_);
                    for j_ = 1:lk
                        Gj = index(j_);
                        E = [];
                        switch m
                            case 0
                                E = single_linkage(M,cell2mat(Gi),cell2mat(Gj));
                            case 1
                                E = complete_linkage(M,cell2mat(Gi),cell2mat(Gj));
                            case 2
                                E = average_linkage(M,cell2mat(Gi),cell2mat(Gj));
                            otherwise
                                E = single_linkage(M,cell2mat(Gi),cell2mat(Gj));
                        end
                        A_(i_,j_) = E;
                    end
                end
                A = A_
            end
        case 1%ʹ�����ϵ��
            C = {}
            for k = 1:length-1
                A = clear_upper_triangular(A,-Inf);
                [mx i] = max(A);
                [my iy] = max(mx);
                x = i(iy);
                y = iy;
                
                x_ = cell2mat(index(x));%index�е�Ԫ�ؿ�����һ��group
                y_ = cell2mat(index(y));
                %[x_ y_]
                CA = {A(x,y),[x_ y_]};
                C = [C; CA];%����,Ԫ��
                index = mutil_value_set_null(index,x,y);
                [x_,y_]
                index = [[x_,y_] index]%�ϲ�Ԫ��
                
                %�������
                %[r c] = size(index)
                lk = length-k;
                A_ = zeros(lk,lk);
                for i_ = 1:lk
                    Gi = index(i_);
                    for j_ = 1:lk
                        Gj = index(j_);
                        E = [];
                        switch m
                            case 0
                                E = single_linkage(M,cell2mat(Gi),cell2mat(Gj));
                            case 1
                                E = complete_linkage(M,cell2mat(Gi),cell2mat(Gj));
                            case 2
                                E = average_linkage(M,cell2mat(Gi),cell2mat(Gj));
                            otherwise
                                E = complete_linkage(M,cell2mat(Gi),cell2mat(Gj));
                        end
                        A_(i_,j_) = E;
                    end
                end
                A = A_
            end
    end
    T = C
end

%ѡ����Ⱥ���ݺ����������С���룬���������������Ⱥ���ݺ�������ľ���
function D = single_linkage(M,Gi,Gj)
    V = [];
    if isequal(Gi,Gj)
        V = [V;0];
    else
        length_i = size(Gi,2);
        length_j = size(Gj,2);
        for i = 1:length_i
            for j = 1:length_j
                V = [V;M(Gi(1,i),Gj(1,j))];
            end
        end
    end
    D = min(V);
end

function D = complete_linkage(M,Gi,Gj)
    V = [];
    if isequal(Gi,Gj)
        V = [V;0];
    else
        length_i = size(Gi,2);
        length_j = size(Gj,2);
        for i = 1:length_i
            for j = 1:length_j
                V = [V;M(Gi(1,i),Gj(1,j))];
            end 
        end
    end
    D = max(V);
end

%ÿ��group�еĵ㵽����group�еĵ�ľ��룬����ȫ�����ӵĿ���
function D = average_linkage(M,Gi,Gj)
    S = 0;
    length_i = size(Gi,2);
    length_j = size(Gj,2);
    for i = 1:length_i
        for j = 1:length_j
            S = S + M(Gi(1,i),Gj(1,j));
        end 
    end
    D = S / (length_i * length_j);
end

function IND = mutil_value_set_null(IND,x,y)
    IND(1,[x,y]) = {[Inf]};
    for i = 1:2
        [r c] = size(IND);
        for j = 1:c
            if isequal(IND(j),{[Inf]});
                IND(j) = [];
                break
            end
        end
    end
end