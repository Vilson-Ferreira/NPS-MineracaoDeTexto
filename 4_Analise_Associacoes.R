################################################################
# Associações 
################################################################

# Gera Associações
Dados.Associacoes = findAssocs(Dados.TDM, "tablet", 0.15);

# Transforma em Dataframe
Dados.Associacoes = list_vect2df(Dados.Associacoes);
names(Dados.Associacoes) = c("Palavra", "Termos", "Associacao");

# Gráfico das Associações
Base = ggplot(Dados.Associacoes, aes(y = Termos));
Base = Base + geom_point(aes(x = Associacao), data = Dados.Associacoes, size = 2);
Base = Base + theme_gdocs();
Base = Base + geom_text(aes(x = Associacao, label = Associacao), colour = "darkred", hjust = -0.25, size = 4);
Base = Base + theme(text = element_text(size = 10), axis.title.y = element_blank());
Base;

