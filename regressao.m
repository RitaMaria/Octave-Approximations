function c = regressao (X, k)
##  Calcular a aproximação de um conjunto de dados discretos por uma função de
##  um tipo previamente definido.
##  
##  X é uma matriz nx2 que na primeira coluna contém as abcissas dos dados e na 
##  segunda coluna as respetivas ordenadas.
##  k é um inteiro entre 1 e 4 e indica qual o tipo de função a ajustar.
##  
##  c é um vetor que contém os coeficientes a e b da função que melhor se ajusta 
##  aos dados.
  
  if k == 1 % y = a+bx
    % definição das matrizes necessárias para resolver o sistema linear
    A = [size(X)(1) sum(X)(1); sum(X)(1) sum(X.^2)(1)];
    b = [sum(X)(2); sum(prod(X,2))];
    c = A\b; % resolução do sistema linear
  elseif k == 2 % y = ab^x
    %transformação: logy = loga+xlogb
    X(:,2) = log(X(:,2)); %transformação dos dados inicais em (x_i,log y_i)
    % definição das matrizes necessárias para resolver o sistema linear
    A = [size(X)(1) sum(X)(1); sum(X)(1) sum(X.^2)(1)];
    b = [sum(X)(2); sum(prod(X,2))];
    a = A\b; % resolução do sistema linear, a = (loga,logb)
    %e^(logx)=x
    c = [e^a(1) e^a(2)]; %Assim c = (a,b)
  elseif k == 3 % y = ax^b
    %transformação: logy = loga + blogx
    X = log(X); %transformação dos dados iniciais em (log x_i, log y_i)
    % definição das matrizes necessárias para resolver o sistema linear
    A = [size(X)(1) sum(X)(1); sum(X)(1) sum(X.^2)(1)];
    b = [sum(X)(2); sum(prod(X,2))];
    a = A\b; % resolução do sistema linear, a = (loga,b)
    %e^(loga) = a
    c = [e^a(1) a(2)]; %Assim c = (a,b)
  elseif k == 4 % y = 1/(a+bx)
    %transformação: 1/y = a+bx
    X(:,2) = 1./X(:,2); %transformação dos dados iniciais em (x_i, 1/y_i)
    % definição das matrizes necessárias para resolver o sistema linear
    A = [size(X)(1) sum(X)(1); sum(X)(1) sum(X.^2)(1)];
    b = [sum(X)(2); sum(prod(X,2))];
    c = A\b; % resolução do sistema linear
  end
endfunction
