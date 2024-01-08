function c = regressao (X, k)
##  Calcular a aproxima��o de um conjunto de dados discretos por uma fun��o de
##  um tipo previamente definido.
##  
##  X � uma matriz nx2 que na primeira coluna cont�m as abcissas dos dados e na 
##  segunda coluna as respetivas ordenadas.
##  k � um inteiro entre 1 e 4 e indica qual o tipo de fun��o a ajustar.
##  
##  c � um vetor que cont�m os coeficientes a e b da fun��o que melhor se ajusta 
##  aos dados.
  
  if k == 1 % y = a+bx
    % defini��o das matrizes necess�rias para resolver o sistema linear
    A = [size(X)(1) sum(X)(1); sum(X)(1) sum(X.^2)(1)];
    b = [sum(X)(2); sum(prod(X,2))];
    c = A\b; % resolu��o do sistema linear
  elseif k == 2 % y = ab^x
    %transforma��o: logy = loga+xlogb
    X(:,2) = log(X(:,2)); %transforma��o dos dados inicais em (x_i,log y_i)
    % defini��o das matrizes necess�rias para resolver o sistema linear
    A = [size(X)(1) sum(X)(1); sum(X)(1) sum(X.^2)(1)];
    b = [sum(X)(2); sum(prod(X,2))];
    a = A\b; % resolu��o do sistema linear, a = (loga,logb)
    %e^(logx)=x
    c = [e^a(1) e^a(2)]; %Assim c = (a,b)
  elseif k == 3 % y = ax^b
    %transforma��o: logy = loga + blogx
    X = log(X); %transforma��o dos dados iniciais em (log x_i, log y_i)
    % defini��o das matrizes necess�rias para resolver o sistema linear
    A = [size(X)(1) sum(X)(1); sum(X)(1) sum(X.^2)(1)];
    b = [sum(X)(2); sum(prod(X,2))];
    a = A\b; % resolu��o do sistema linear, a = (loga,b)
    %e^(loga) = a
    c = [e^a(1) a(2)]; %Assim c = (a,b)
  elseif k == 4 % y = 1/(a+bx)
    %transforma��o: 1/y = a+bx
    X(:,2) = 1./X(:,2); %transforma��o dos dados iniciais em (x_i, 1/y_i)
    % defini��o das matrizes necess�rias para resolver o sistema linear
    A = [size(X)(1) sum(X)(1); sum(X)(1) sum(X.^2)(1)];
    b = [sum(X)(2); sum(prod(X,2))];
    c = A\b; % resolu��o do sistema linear
  end
endfunction
