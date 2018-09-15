#install.packages("tm");
#install.packages("qdap");
#install.packages("wordcloud");
#install.packages("RWeka");
#install.packages("ggplot2");
#install.packages("ggthemes");
#install.packages("igraph");

library(tm); 
library(qdap); 
library(wordcloud);
library(RWeka);
library(ggplot2);
library(ggthemes);
library(igraph);

################################################################
# Análise Geral
################################################################

Dados = read.csv("IOB_Pesquisa.csv");

hist(Dados$Avaliacao, main="Distribuição das Avaliações", col="grey", xlab="");
boxplot(Dados$Avaliacao, main="Distribuição das Avaliações", col="grey");
summary(Dados$Avaliacao);
Dados.Percentil = quantile(Dados$Avaliacao, seq(0,1, by=0.1));
barplot(Dados.Percentil);