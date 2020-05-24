%�ع�����ľ��������Զ���ƫ�����жϣ������ж���ع��е�k��������Ƶ�Ӱ��
%K = 0Ϊ��ƫ���ƣ��Ա�k������0��������ж��Ƿ������ع�ķ�ʽ��
function N = regression_params_MSE(X,Y,k)
    [r c] = size(X);
    
    %�����������ϼ������ƫ���ƣ����������ƫ���ƣ���ô���Բ�ȡ���ַ�ʽ������
    B = least_squares_estimation(X,Y)
    s2 = MSRes(X,Y,B) 
    %K = (c*s2)/(B'*B) ʹ�ý�����֤����ȡ
    iv = inv(X'*X + k*eye(c,c))%ink = inv(Xk'*Xk)
    TR = trace(iv * X'*X * iv )
    mse1 = s2 * TR
    mse2 = (k.^2) * B'*(iv.^2) * B
    
    Br = inv(X'*X + k*eye(c,c)) * (X'*X) * B
    
    N = mse1 + mse2
end