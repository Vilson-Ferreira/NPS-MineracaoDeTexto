################################################################
# Análise de Cluster - Proximidade entre termos
################################################################
#install.packages("dendextend");
#install.packages("circlize");
library(dendextend);
library(circlize);

# Elimina Termos Esparsos
Cluster.TDM = removeSparseTerms(Dados.TDM, 0.98);

# Cria matriz de distâncias
Cluster.Dist = dist(Cluster.TDM, method="euclidean");
Cluster.Modelo = hclust(Cluster.Dist, method="complete");

# Gera Dendograma
plot(Cluster.Modelo, main="Dendograma");

# Dendrograma Circular
Cluster.Dendograma = as.dendrogram(Cluster.Modelo);
Cluster.Dendograma = color_labels(Cluster.Dendograma, 8, pal);
Cluster.Dendograma = color_branches(Cluster.Dendograma, 8, pal);
plot(Cluster.Dendograma, main="Dendograma");
circlize_dendrogram(Cluster.Dendograma, labels_track_height=0.5, dend_track_height=0.4);
