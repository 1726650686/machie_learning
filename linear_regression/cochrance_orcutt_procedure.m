%��ͨ��bg dw lbq��⣬�������autocorrelation��һ��ת��
%�õ��¾���֮�󣬿���ʹ��ols���൱�ڽ�ģ��ת���ɸ�˹-����ɷ� �ع�ģ��
function A = cochrance_orcutt_procedure(X,Y)
    [r c] = size(X);
    p = autocorrelation_function(X,Y,1);
    %DW_test_value(X,Y);
    
    Yt = Y(1:r-1,:);
    Y2tr = Y(2:r,:);
    Y_CO = Y2tr - p*Yt;
    
    Xt = X(1:r-1,:);
    X2tr = X(2:r,:);
    X_CO = X2tr - p*Xt;
    
    %DW_test_value([ ones(r-1,1) X_CO(:,[2:c])],Y_CO);
    
    A = [[ ones(r-1,1) X_CO(:,[2:c])] Y_CO];
end