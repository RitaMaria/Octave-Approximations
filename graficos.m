function graficos (X,c,k)
##  Ilustrar graficamente a aproximação de um conjunto de dados discretos por
##  uma função de um tipo previamente definido.
##  
##  X é uma matriz nx2 que na primeira coluna contém as abcissas dos dados e na 
##  segunda coluna as respetivas ordenadas.
##  k é um inteiro entre 1 e 4 e indica qual o tipo de função a ajustar.
##  
##  c é um vetor que contém os coeficientes a e b da função que melhor se ajusta 
##  aos dados.
  
  %c é definido por [a,b] logo c(1)=a e c(2)=b
  
  xx = linspace(X(1,1),X(end,1),101); %construção de vetor com bastantes pontos
  % no comando condicional seguinte é escolhida e definida a função que se quer 
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
##  geração, numa janela gráfica, de um gráfico onde os dados originais são 
##  representados apenas com um marcador preto e sobreposto é gerado um gráfico
##  da função do tipo escolhido, a vermelho e com espessura de linha 2.
  
##  O comando X(:,1) devolve a primeira coluna da matriz, onde estão as abcissas
##  dos pontos. Também por X(:,2) obtemos as ordenadas.
  
  plot(X(:,1),X(:,2),"ok","linewidth",2,xx,f(xx),"r","linewidth",2)
endfunction