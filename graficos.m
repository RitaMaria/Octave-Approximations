function graficos (X,c,k)
##  Ilustrar graficamente a aproxima��o de um conjunto de dados discretos por
##  uma fun��o de um tipo previamente definido.
##  
##  X � uma matriz nx2 que na primeira coluna cont�m as abcissas dos dados e na 
##  segunda coluna as respetivas ordenadas.
##  k � um inteiro entre 1 e 4 e indica qual o tipo de fun��o a ajustar.
##  
##  c � um vetor que cont�m os coeficientes a e b da fun��o que melhor se ajusta 
##  aos dados.
  
  %c � definido por [a,b] logo c(1)=a e c(2)=b
  
  xx = linspace(X(1,1),X(end,1),101); %constru��o de vetor com bastantes pontos
  % no comando condicional seguinte � escolhida e definida a fun��o que se quer 
  %desenhar
  if k == 1 % y = a+bx
    f = @(x) c(1)+c(2)*x;
  elseif k == 2 % y = ab^x
    f = @(x) c(1)*c(2).^x;
  elseif k == 3 % y = ax^b
    f = @(x) c(1)*x.^c(2);
  elseif k == 4 % y = 1/(a+bx)
    f = @(x) 1./(c(1)+c(2)*x);
  end
##  gera��o, numa janela gr�fica, de um gr�fico onde os dados originais s�o 
##  representados apenas com um marcador preto e sobreposto � gerado um gr�fico
##  da fun��o do tipo escolhido, a vermelho e com espessura de linha 2.
  
##  O comando X(:,1) devolve a primeira coluna da matriz, onde est�o as abcissas
##  dos pontos. Tamb�m por X(:,2) obtemos as ordenadas.
  
  plot(X(:,1),X(:,2),"ok","linewidth",2,xx,f(xx),"r","linewidth",2)
endfunction