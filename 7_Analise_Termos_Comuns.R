################################################################
# Termos Comuns em múltiplos documentos
################################################################
#install.packages("plotrix");
library(plotrix);

#Separação das opiniões em 50-50 (conforme mediana e percentis)
Dados.Avaliacoes.Altas = subset(Dados, Dados$Avaliacao>=8);
Dados.Avaliacoes.Baixas = subset(Dados, Dados$Avaliacao<8);

Dados.Avaliacoes.Altas = paste(Dados.Avaliacoes.Altas$Opiniao, collapse=" ");
Dados.Avaliacoes.Baixas = paste(Dados.Avaliacoes.Baixas$Opiniao, collapse=" ");

Dados.Avaliacoes = c(Dados.Avaliacoes.Altas, Dados.Avaliacoes.Baixas);

Dados.Avaliacoes.TDM = TDM.Preparar(Dados.Avaliacoes);
Dados.Avaliacoes.Matriz = as.matrix(Dados.Avaliacoes.TDM);
colnames(Dados.Avaliacoes.Matriz) = c("Altas", "Baixas");

# Nuvem de termos comuns
commonality.cloud(Dados.Avaliacoes.Matriz, max.words=100, random.order=FALSE);

# Nuvem de termos incomuns
comparison.cloud(Dados.Avaliacoes.Matriz, max.words=100, random.order=FALSE, title.size=2.0, colors=brewer.pal(ncol(Dados.Avaliacoes.Matriz), "Dark2"));

# Polarized Tag Plot 
Dados.Avaliacoes.TermosComuns = subset(Dados.Avaliacoes.Matriz, Dados.Avaliacoes.Matriz[,1]>0 & Dados.Avaliacoes.Matriz[,2]>0);
Dados.Avaliacoes.Diferencas = abs(Dados.Avaliacoes.TermosComuns[,1] - Dados.Avaliacoes.TermosComuns[,2]);
Dados.Avaliacoes.TermosComuns = cbind(Dados.Avaliacoes.TermosComuns, Dados.Avaliacoes.Diferencas);
Dados.Avaliacoes.TermosComuns = Dados.Avaliacoes.TermosComuns[order(Dados.Avaliacoes.TermosComuns[,3], decreasing=TRUE),];
Dados.Avaliacoes.Top25Diff = data.frame(x=Dados.Avaliacoes.TermosComuns[1:50,1], y=Dados.Avaliacoes.TermosComuns[1:50,2], labels=rownames(Dados.Avaliacoes.TermosComuns[1:50,]));

pyramid.plot(Dados.Avaliacoes.Top25Diff$x, Dados.Avaliacoes.Top25Diff$y, Dados.Avaliacoes.Top25Diff$labels, gap=100, top.labels=c("Altas", "Palavras", "Baixas"), main="Termos Comuns", laxlab=NULL, raxlab=NULL, unit=NULL);
