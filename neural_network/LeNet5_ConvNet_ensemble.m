%k1 = unifrnd(-sqrt(6/((1+6)*5.^2)),sqrt(6/((1+6)*5.^2)),5,5,6);
%k32 = unifrnd(-sqrt(6/((6+32)*5.^2)),sqrt(6/((6+32)*5.^2)),5,5,6,32);
%W32 = unifrnd(-sqrt(6/(10+512)),sqrt(6/(10+512)),10,512);
%�����˵ڶ���������filter������12���ӵ���32����a=0��001������£����Ի��0��9152��׼ȷ��
%�������������relu��avg poolinng������max pooling���ڶ�������㻻����32��filter��
%���ڶ��������������36����ʱ�򣬻ᷢ�ֲ�������Ч�����ȷ�ʣ�˵����Ҫ�Ľ���һ�㡣
%����汾�жԵ�һ���filter�����������ӡ�
%
%improvement2 params:
%k12 = unifrnd(-sqrt(12/((1+12)*5.^2)),sqrt(6/((1+12)*5.^2)),5,5,12);
%k1248 = unifrnd(-sqrt(12/((12+48)*5.^2)),sqrt(12/((12+48)*5.^2)),5,5,12,48);
%��ȷ�ʿ�����ߵ�0��94
%
%
%������Ҫ��fc�ټ�һ�㡣
%fc����һ��mlp��
%ͨ��������һ��fc�㣬������overfit���
%����10000�����ݾͿ��Դﵽ0��93����ȷ�ʣ�����60000��֮��׼ȷ�ʷ����½��ˡ�
%������Ҫ��fc�������򻯣��ձ黯�������򻯣�
%
%
%����fc��Ĺ��򻯣��ձ黯��������ǰֹͣ�ķ�ʽ��
%ʹ��k20 k2050,����ʹ����ȷ�ʴﵽ0��95
%k20 = unifrnd(-sqrt(20/((1+20)*5.^2)),sqrt(20/((1+20)*5.^2)),5,5,20);
%k2050 = unifrnd(-sqrt(20/((20+50)*5.^2)),sqrt(20/((20+50)*5.^2)),5,5,20,50);
%
%
%���ø�˹�ֲ���ʼ����������߿��Ի��0��9716����ȷ��
%W500800n = randn(500,800) .* sqrt(0.01);
%W10500n = randn(10,500) .* sqrt(0.01);
%k20n = randn(5,5,12) .* sqrt(0.01);
%k2050n = randn(5,5,20,50) .* sqrt(0.01);
%�����ͨ��ѵ���õ��Ĳ�����Ϊ��һ��ѵ���ĳ�ʼ�������Ƿ��õ��ȽϺõĽ���أ�LeNet5_ConvNet_stop_early_randn2��֤�ò��롣
%
%
%������ѵ��������6�ε�ʱ�򣬻������ȷ����0��976���Ҳ�������˵������ѵ����������ȷ����ʹ����ȷ�ʵõ�������
%��������Ӧ�����ڲ��ϱƽ�һ���ֲ����Ž⡣
%������Ҫ��һ�ֳ�ʼ���ķ�ʽ������ͨ������ѵ�������ķ�ʽ�ƽ����Ž⣨������ȫ�����ţ�
%LeNet5_ConvNet_stop_early_randn3��ʹ��RELU AWARE SCALED INITIALIZATION���Գ�ʼ�������ķ�����������
%
%
%�����ֱ�ӽ�����������0��01��0��1������С��ȡֵ��ʹ��He��RELU AWARE SCALED INITIALIZATION���ķ������Ը������ݡ�
%ͬʱ��õĽ��Ҳ����һ�����ߣ�������߿��Ե���0.9818
%�����ʹ��randnƽ����ȷ����0��976��he�ķ���������ߵ�0��978��
%k20nr = randn(5,5,20) .* sqrt(2/(5*5));
%k2050nr = randn(5,5,20,50) .* sqrt(2/(5*5*20));
%W500800nr = randn(500,800) .* sqrt(2/800);
%W10500nr = randn(10,500) .* sqrt(2/500);
%ʹ��randn��ʹ��unifrndͨ��Ч��Ҫ��һЩ������early stop�ķ����������⣬��Ҫÿ��һ��ʱ�����һ��test
%drop out�ܷ���õĽ��over fit�����أ���Ҫͨ��LeNet5_ConvNet_drop_out_randn����֤��
%
%
%��drop out��������fc�㡣
%ͨ������drop out���ƣ�ʹ����ȷ�ʽ�һ����ߣ���߿��Դﵽ0��9843��ƽ������ά����0��9822��
%NOTE����Ҫע����ǣ�drop out��Ĳ�������������ã����������ϾͱȽϺã��������õñȽϵ�
%����0��5���ⷴ��ʹ�ý�������롣��Ϊdrop out��Ҫ�����������ϵ����⡣
%��������ڸ����⣬����һ��С�Ĳ���������������Ƿ��ϡ�
%������ô˵��Խ�ǹ�������أ�����ԽҪ���õ�С���Ӷ����ٹ���ϡ��������ϲ����أ�����Ӧ�����õýӽ�1��
%
%
%����˲�����ʼ�����⣬��������⡣�ܷ�ͨ������ͬ���²���ѵ��������������������ȷ���أ�
%������ԣ��Ƿ��������һ�����ƹ㣬�������ͬ���磬��ͬ��ʼ����ѵ�����������������ϣ��Ӷ������ȷ�ʡ�
%LeNet5_ConvNet_ensemble������֤�ò��롣
%
%
%��ѵ����2��ģ�ͣ�ģ��׼ȷ�ʷֱ�Ϊ0.9812��0.9829������ϲ���һ���á�
%���Խ���ȷ����ߵ�0��9885,���Կ���ʹ�����ģ�Ϳ��������ȷ�ʡ�
%�������һ�������ۣ������ȷ�ʽϸߵ�ģ�����ʹ�ã����������ȷ�ʡ�
%�ܷ񹹽�һ��LeNet5_ConvNet_ensemble5��ʹ��5��ģ������Ԥ�⣬�Ӷ�����ȷ����ߵ�0��99�����أ�
%
%
function [count,count_s,count_n,count1,count2] = LeNet5_ConvNet_ensemble(mnist,k11,B11,k21,B21,W1,B31,W21,B41,k12,B12,k22,B22,W2,B32,W22,B42)
    TEST = mnist.test;
    T_LABELS = TEST.labels;

    count = 0;
    count_n = 0;
    count_s = 0;
    count1 = 0;
    count2 = 0;
    for j = 1:10000
        R1 = conv_C1(TEST.images(:,:,j),k11);
        C1 = Relu(R1 + B11);
        S1 = max_pooling(C1);
        R2 = conv_C2(S1,k21);
        C2 = Relu(R2 + B21);
        S2 = max_pooling(C2);
        f = vctz_concat(S2);
        y_fc1 = Relu(W1*f + B31);
        y_hat = logsig(W21*y_fc1 + B41);
        [v ii] = max(y_hat);
        
        R12 = conv_C1(TEST.images(:,:,j),k12);
        C12 = Relu(R12 + B12);
        S12 = max_pooling(C12);
        R22 = conv_C2(S12,k22);
        C22 = Relu(R22 + B22);
        S22 = max_pooling(C22);
        f2 = vctz_concat(S22);
        y_fc12 = Relu(W2*f2 + B32);
        y_hat2 = logsig(W22*y_fc12 + B42);
        [v2 ii2] = max(y_hat2);
        
        if ii == ii2
            count_s = count_s + 1;
        else
            count_n = count_n + 1;
        end
        
        y_hat_a = y_hat + y_hat2;
        [vc iic] = max(y_hat_a);
        
        if (iic - 1) == T_LABELS(j)
            count = count + 1;
        end
        
        if (ii - 1) == T_LABELS(j)
            count1 = count1 + 1;
        end
        
        if (ii2 - 1) == T_LABELS(j)
            count2 = count2 + 1;
        end
    end
end

function B1 = b(l,w,h)
    B1 = zeros(l,w,h);
end

function R = conv_C1(I,k1)
    [fl fw fh fn] = size(k1);
    R = zeros(24,24,6);
    for p = 1:fh
        R(:,:,p) = convn(I,rot180(k1(:,:,p)),'valid');
    end
end

function R = conv_C2(S1,k2)
    [sl sw sh] = size(S1);
    [fl fw fh fn] = size(k2);
    R = zeros(sl-fl+1,sw-fw+1,fn);
    for k = 1:fn
        R_ = zeros(sl-fl+1,sw-fw+1,1);
        for n = 1:fh
            R_ = R_ + convn(S1(:,:,n),rot180(k2(:,:,n,k)),'valid');
        end
        R(:,:,k) = R_;
    end
end

function P = avg_pooling(C)
    [cl cw ch] = size(C);
    
    P = zeros(cl/2,cw/2,ch);
    for k = 1:ch
        for i = 1:(cl/2)
            for j = 1:(cw/2)
                c1 = C(2*i-1, 2*j-1, k);
                c2 = C(2*i-1, 2*j, k);
                c3 = C(2*i, 2*j-1, k);
                c4 = C(2*i, 2*j, k);
                a = (c1 + c2 +c3 +c4)/4;
                P(i,j,k) = a;
            end
        end
    end
end

%�滻avg_pooling��max pooling��avg poolingЧ��Ҫ�á�
function P = max_pooling(C)
    [cl cw ch] = size(C);
    
    P = zeros(cl/2,cw/2,ch);
    for k = 1:ch
        for i = 1:(cl/2)
            for j = 1:(cw/2)
                c1 = C(2*i-1, 2*j-1, k);
                c2 = C(2*i-1, 2*j, k);
                c3 = C(2*i, 2*j-1, k);
                c4 = C(2*i, 2*j, k);
                a = max([c1;c2;c3;c4]);
                P(i,j,k) = a;
            end
        end
    end
end

function R = vctz_concat(S2)
    R = [];
    h = size(S2,3);
    for i = 1:h
        s2 = S2(:,:,i);
        R = [R;s2(:)];
    end
end

function LV = label_vctz(n)
    LV = zeros(10,1);
    LV(n+1) = 1;
end

function S = reverse_vctz_concat(f)
    n = size(f,1)/16;
    S = zeros(4,4,n);
    for i = 0:n-1
        S([1:4],1,i+1) = f([i*16+1:i*16+4]);
        S([1:4],2,i+1) = f([i*16+5:i*16+8]);
        S([1:4],3,i+1) = f([i*16+9:i*16+12]);
        S([1:4],4,i+1) = f([i*16+13:i*16+16]);
    end
end

function C = reverse_avg_pooling(S)%����ȡ1/4
    [l w h] = size(S);
    C = zeros(l*2,w*2,h);
    for k = 1:h
        for i = 1:l
            for j = 1:w
                C((i-1)*2+1,(j-1)*2+1,k) = S(i,j,k);
                C((i-1)*2+1,(j-1)*2+1+1,k) = S(i,j,k);
                C((i-1)*2+1+1,(j-1)*2+1,k) = S(i,j,k);
                C((i-1)*2+1+1,(j-1)*2+1+1,k) = S(i,j,k);
            end
        end
    end
end

%��ʹ��maxpooling��ʱ������ȡ1/4Ч�����һЩ�����������ȡ1/4�ķ�����
function C = reverse_avg_pooling4(S)%��ȡ1/4
    [l w h] = size(S);
    C = zeros(l*2,w*2,h);
    for k = 1:h
        for i = 1:l
            for j = 1:w
                C((i-1)*2+1,(j-1)*2+1,k) = S(i,j,k)/4;
                C((i-1)*2+1,(j-1)*2+1+1,k) = S(i,j,k)/4;
                C((i-1)*2+1+1,(j-1)*2+1,k) = S(i,j,k)/4;
                C((i-1)*2+1+1,(j-1)*2+1+1,k) = S(i,j,k)/4;
            end
        end
    end
end

function M = rot180(S)
    M = rot90(rot90(S));
end

function C = C2q_sigma(DT_C2,C2)
    [cl cw ch] = size(C2);
    C = zeros(8,8,ch);
    for k = 1:ch
       C(:,:,k) = DT_C2(:,:,k) .* (C2(:,:,k)' * (1 - C2(:,:,k)));
    end
end

function C = C2qRelu(DT_C2,C2)
    [cl cw ch] = size(C2);
    C = zeros(8,8,ch);
    for k = 1:ch
       C(:,:,k) = DT_C2(:,:,k) .* Relu_diff(C2(:,:,k));
    end
end

function D = Relu_diff(M)
    [l w h n] = size(M);
    D = zeros(l,w,h,n);
    lg = M > 0;
    D(lg) = 1;
end

function M = Relu(M)
    lg = (M <= 0);
    M(lg) = 0;
end

function B = b2q(DT_C2,C2)
    h = size(C2,3);
    B = [];
    for q = 1:h
        b = sum(sum((DT_C2(:,:,q).*C2(:,:,q).*(1-C2(:,:,q))))');
        B = [B;b];
    end
end

%����ľ�������ܹؼ�
function DT_k2 = K2pq(S1,DT_C2qs)
    ph = size(S1,3);
    ch = size(DT_C2qs,3);
    S1R180 = rot180(S1);
    DT_k2 = zeros(5,5,6,16);
    for q = 1:ch
        for p = 1:ph
            %convn(S1R180(:,:,p),rot180(DT_C2qs(:,:,q)),'valid');
            DT_k2(:,:,p,q) = convn(S1R180(:,:,p),rot180(DT_C2qs(:,:,q)),'valid');
        end
    end
end

%��������ܹؼ����Ǿ�����ﷴ�򴫲��Ĺؼ���
function S1 = S1p(DT_C2qs,k2)
    [kl kw kh kn] = size(k2);
    [cl cw ch] = size(DT_C2qs);
    S1 = zeros(kl+cl-1,kw+cw-1,kh);
    for p = 1:kh
        S1_ = zeros(kl+cl-1,kw+cw-1,1);%!�������������ľ����С��
        for q = 1:kn
            S1_ = S1_ + convn(DT_C2qs(:,:,q),k2(:,:,p,q));%paper��k2��Ҫת180�ȣ�matlab����Ҫת180������㣬���������ת180�Ȳ�����㣬�൱��ת��360
        end
        S1(:,:,p) = S1_;
    end
end

function C = C1ps(DT_C1p,C1)
    C = zeros(24,24,6);
    for k = 1:6
       C(:,:,k) = DT_C1p(:,:,k) .* (C1(:,:,k)' * (1 - C1(:,:,k)));
    end
end

function C = C1pRelu(DT_C1p,C1)
    [l w h] = size(DT_C1p);
    C = zeros(l,w,h);
    for k = 1:h
       C(:,:,k) = DT_C1p(:,:,k) .* Relu_diff(C1(:,:,k));
    end
end

function R = K11p(I,DT_C1)
    [il iw ih] = size(I);
    [cl cw ch] = size(DT_C1);
    IR180 = rot180(I);
    R = zeros(il-cl+1,iw-cw+1,ch);
    for i = 1:ch
        R(:,:,i) = convn(IR180,rot180(DT_C1(:,:,i)),'valid');
    end
end

function B = b1p(C1)
    h = size(C1,3);
    B = zeros(h,1);
    for i = 1:h
        B(i) = sum(sum(C1(:,:,i))');
    end
end