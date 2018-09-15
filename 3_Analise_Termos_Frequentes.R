################################################################
# Análise de Termos Frequentes
################################################################

Dados.TDM = TDM.Preparar(Dados$Opiniao);

# Conversão para Matriz e Frequências 
Dados.Matriz = as.matrix(Dados.TDM); 
Dados.Matriz = sort(rowSums(Dados.Matriz), decreasing = TRUE); 

################################################################
# Gráfico de Termos Frequentes
################################################################

barplot(Dados.Matriz[1:30], col="grey", las=2, main="Top 30 Palavras", xlab="", ylab=""); 

################################################################
# Nuvem de Palavras 
################################################################

pal = brewer.pal(9, "Set1"); 
Dados.Matriz.MaisFreq = data.frame(Palavras=names(Dados.Matriz), Ocorrencias=Dados.Matriz); 
wordcloud(Dados.Matriz.MaisFreq$Palavras, Dados.Matriz.MaisFreq$Ocorrencias, min.freq = 20, max.words = 300, colors = pal, random.order = FALSE, use.r.layout = FALSE, scale = c(5, 0.1), rot.per = 0.35);
