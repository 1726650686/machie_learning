%������Ƕ�������ȥ��ei֮��SSE�ı仯������仯�Ƚϴ󣬽�һ������
function SSEi_ = error_point_checking_SSE_base_deleting(X,Y,i)
    P = least_squares_estimation(X,Y);
    SSE = sum((Y - X*P).^2);
    H = hat_matrix(X);
    ei2 = Y(i,:) - X(i,:)*P;
    hii = H(i,i);
    
    SSEi = SSE - ( ei2/(1 - hii) )
    SSEi_ = [SSE SSEi]
end