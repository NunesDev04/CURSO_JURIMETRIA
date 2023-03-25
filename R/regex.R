endereco <- c("Avenida Paulista, 458, apto 1070, cep 01500-000, munícipio de São Paulo",
"rua Padrao, 658, cep 01200-017, Sao Paulo, estado de Sao Paulo")

## STR EXTRACT
cep <- str_extract(endereco, pattern = "\\d{5}-\\d{3}")
tipo_logradouro <- str_extract(endereco, pattern = "\\w+")
tipo_logradouro2 <- str_extract_all(endereco, pattern = "\\w+")
tipo_logradouro2

## STR REPLACE
endereco2 <- str_replace(endereco, pattern = ",\\s", replacement = ", nº ")
endereco2

endereco3 <- str_replace_all(endereco, pattern = "(?i)\\bs[aã]o\\b", replacement = "São")
endereco3

## STR REMOVE

endereco4 <- str_remove(endereco, pattern = "(?i) estado de")
endereco4

endereco5 <- str_remove_all(endereco, pattern = "(?i)\\bs[aã]o\\b")
endereco5

## BEHIND or LOOK AHEAD 
##BEHIND - pega o que vem depois do padrao
depois_cep <- str_extract(endereco, pattern = "(?<=cep )\\d+")
depois_cep  

##LOOK AHEAD - pega o que vem antes do padrao
ate_cep <- str_extract(endereco, pattern = ".+(?=cep)")
ate_cep ## nesse exemplo, pegou tudo antes da ultima virgula

ate_virgula <- str_extract(endereco, pattern = ".+?(?=,)")
ate_virgula ## se colocar o ? depois do mais, pega antes da primeira

cep_virg <- str_extract(endereco, pattern = "(?<=cep ).+?(?=,)")
cep_virg

## STR SUM

proc_chat <- "0011435-79.2018.8.26.0053"
proc_chat_limpo <- str_remove_all(proc_chat, pattern = "\\D")
proc_chat_limpo

proc_chat_limpo_seq <- str_sub(proc_chat_limpo, start = 1, end = 7)
proc_chat_limpo_seq

proc_chat_limpo_dig <- str_sub(proc_chat_limpo, start = 8, end = 9)
proc_chat_limpo_dig

proc_chat_limpo_ano <- str_sub(proc_chat_limpo, start = 10, end = 13)
proc_chat_limpo_ano

proc_chat_limpo_segmento <- str_sub(proc_chat_limpo, start = 14, end = 14)
proc_chat_limpo_segmento

proc_chat_limpo_trib <- str_sub(proc_chat_limpo, start = 15, end = 16)
proc_chat_limpo_trib

proc_chat_limpo_dist <- str_sub(proc_chat_limpo, start = 17, end = 20)
proc_chat_limpo_dist

proc_chat_limpo <- as.numeric(proc_chat_limpo)
proc_chat_limpo

proc_chat_limpo <- str_pad(proc_chat_limpo, 20, pad = "0")
proc_chat_limpo

## STR DETECT - detecta um padrao no texto, informando TRUE ou FALSE

paulo <- str_detect(endereco, pattern = "(?i)paulo")
paulo

## STR COUNT

numero_paulo <- str_count(endereco, pattern = "(?i)paulo")
numero_paulo

## STR SUBSET

endereco_subset <- str_subset(endereco, pattern = "(?i)paulista")
endereco_subset #retorna o que contem a palavra padrao

endereco_subset2 <- str_subset(endereco, pattern = "(?i)paulista", negate = TRUE)
endereco_subset2 #retorna o que nao contem a palavra padrao

## STR WHICH

endereco_which <- str_which(endereco, pattern = "(?i)paulista")
endereco_which #retorna em qual texto tem a palavra padrao, no caso o 1, retorna um vetor de índice




