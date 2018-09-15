################################################################
# Funções base para TermDocumentMatrix
################################################################

TDM.Preparar = function(Text){
  
  Text = gsub("ID", " ", Text);
  Text = gsub("nbsp", " ", Text);
  
  # Criação do Vetor de Palavras 
  Dados.Corpus = VectorSource(Text); 
  
  # Lista de Documentos (Corpus) 
  Dados.Corpus = VCorpus(Dados.Corpus); 
  
  # Tratamento do Texto (pacote tm) 
  Dados.Corpus = tm_map(Dados.Corpus, tolower); 
  Dados.Corpus = tm_map(Dados.Corpus, removePunctuation); 
  Dados.Corpus = tm_map(Dados.Corpus, removeNumbers); 
  Dados.Corpus = tm_map(Dados.Corpus, stripWhitespace); 
  Dados.Corpus = tm_map(Dados.Corpus, removeWords, c(stopwords("pt-BR"), "ididid", "idido", "idida")); 
  
  # Construção da Bag of Words 
  Dados.Corpus = tm_map(Dados.Corpus, PlainTextDocument);
  Dados.TDM = TermDocumentMatrix(Dados.Corpus, control = list(weighting=weightTf));  
  
  return(Dados.TDM);
  
};

TDM.PrepararComMaisFreq = function(Text, MaisFreq=NULL){
  
  Text = Dados$Opiniao;
  Text = gsub("ID", " ", Text);
  Text = gsub("nbsp", " ", Text);
  
  # Criação do Vetor de Palavras 
  Dados.Corpus = VectorSource(Text); 
  
  # Lista de Documentos (Corpus) 
  Dados.Corpus = VCorpus(Dados.Corpus); 
  
  # Tratamento do Texto (pacote tm) 
  Dados.Corpus = tm_map(Dados.Corpus, tolower); 
  Dados.Corpus = tm_map(Dados.Corpus, removePunctuation); 
  Dados.Corpus = tm_map(Dados.Corpus, removeNumbers); 
  Dados.Corpus = tm_map(Dados.Corpus, stripWhitespace); 
  Dados.Corpus = tm_map(Dados.Corpus, removeWords, c(stopwords("pt-BR"), "ididid", "idido", "idida")); 
  
  # Construção da Bag of Words 
  Dados.Corpus = tm_map(Dados.Corpus, PlainTextDocument);
  Dados.TDM = TermDocumentMatrix(Dados.Corpus, control = list(dictionary=MaisFreq));
  
  return(Dados.TDM);
  
};

