################################################################
# Análise de Relações
################################################################

# Separação de documentos com a palavra desejada.
Dados.Relacoes = Dados[grep("tablet", Dados$Opiniao, ignore.case=TRUE), ];

# Gera Bag of Words com as 50 palavras mais frequentes.
Dados.Relacoes.TDM = TDM.PrepararComMaisFreq(Dados.Relacoes$Opiniao, Dados.Matriz.MaisFreq$Palavras[1:20]);
Dados.Relacoes.Matriz = as.matrix(Dados.Relacoes.TDM);

# Cria matriz de adjacência multiplicando a Matriz pela sua Transposta
Dados.Relacoes.Matriz = Dados.Relacoes.Matriz %*% t(Dados.Relacoes.Matriz);
Dados.Relacoes.Matriz = graph.adjacency(Dados.Relacoes.Matriz, weighted=TRUE, mode="undirected", diag=TRUE);
Dados.Relacoes.Matriz = simplify(Dados.Relacoes.Matriz);

# Gera grafo das relações.
plot.igraph(Dados.Relacoes.Matriz, vertex.size=6, vertex.shape="none", vertex.label.font=2, vertex.label.color="darkred", vertex.label.cex=.7, edge.color="grey85");
