#tidyverse carrega 5 pacotes
#dypkyr manipulação dataframe
# readr ler salvar no disco os arquivos
#forcats trabalhar com dados categoricos
#stringr identificar padrões em texto 
#ggplot2 criar gráficos
#tibble criar tibble (dataframes) e visualizar
#lubridate trabalhar com datas

library(tidyverse)

df <- tibble(x = 1:5, y = letters[1:5])
df # evitar fazer isso com base grande, usar glimpse

glimpse(df)
santander1 |> 
  sample_n(20) |> 
  glimpse()

#tirar raiz da soma de 1 a 10
x <- 1:10
y <- sum(x)
z <- sqrt(y)
z

z <- sqrt(sum(1:10))
z

z <- 1:10 |> 
  sum() |> 
  sqrt()
z

"mundial" |> 
  paste("palmeiras não tem")

?paste

"mundial" |> 
  paste("palmeiras não tem", ... = _)


"mundial" %>%
  paste("palmeiras não tem", .)

# dplyr equivalente do pandas no python

#select seleciona colunas
#filter filtrar linhas
#mutate adicionar ou alterar colunas
#summarize serve para agregar colunas
#group_by serve para aplicar as funções por grupo
#count serve para gerar frequencias de colunas
#arrange serve para ordenar a dataframe com base em uma ou mais colunas
# existem funções de join - juntar dataframes

# select
cjpg <- cjpg |> 
  select(-julgado) #apagando apenas o julgado

glimpse(cjpg)

cjpg <- cjpg |> 
  select(-c(1, pagina, hora_coleta, cd_doc, grupo)) #c(1,3,4) tb funcionaria
glimpse(cjpg)

df1 <- cjpg |> 
  select(processo,foro, magistrado)
glimpse(df1)

df2 <- cjpg |> 
  select(processo,distribuidor = foro, magistrado)
glimpse(df2)

glimpse(cjpg)

df3 <- cjpg |> 
  select(classe:magistrado)
glimpse(df3)

df4 <- cjpg |> 
  select(starts_with("c"))
glimpse(df4)

df5 <- cjpg |> 
  select(ends_with("o"))
glimpse(df5)

?select

cjpg <- cjpg |> 
  select(-c(1, pagina, hora_coleta, grupo, cd_doc))

#library(dplyr, include.only = "filter") - incluir apenas uma funcao - resolvendo conflito entre filter dplyr e mask

#classe <- cjpg |> 
  #dplyr::filter(classe == "Procedimento do Juizado Especial Cível") - chamo o pacote antes de dar o comando filter

## FILTER

classe <- cjpg |> 
  filter(classe == "Procedimento do Juizado Especial Cível") #serve p filtrar linha, a primeira e a coluna e o parametro de pesquisa dentro da coluna

duplicado <- cjpg |> 
  filter(duplicado == TRUE)

duplicado <- cjpg |> 
  filter(duplicado)

duplicado <- cjpg |> 
  filter(duplicado == 1) # 1 e verdadeiro e 0 e falso por padrao

duplicado <- cjpg |> 
  filter(duplicado > 0)

duplicado <- cjpg |> 
  filter(duplicado != 0)

cjpg <- cjpg |> 
  mutate(n_comarca = nchar(comarca), .after = comarca)

n_comarca <- cjpg |> 
  filter(n_comarca == 9)

n_comarca <- cjpg |> 
  filter(n_comarca > 9, n_comarca <20)

n_comarca <- cjpg |> 
  filter(n_comarca >= 9, n_comarca <=20) # pode ser substituida pelo & 

n_comarca <- cjpg |> 
  filter(n_comarca >= 9| n_comarca <=20) # barra vertical | é um ou outro

# filtra data

disponibilizacao <- cjpg |> 
  filter(disponibilizacao > as.Date("2022-12-01"))

#arrange - ordena tabela

cjpg <- cjpg |> 
  arrange(comarca)

cjpg <- cjpg |> 
  arrange(comarca, magistrado)

cjpg <- cjpg |> 
  arrange(vara)

cjpg <- cjpg |> 
  arrange(str_sort(vara, numeric = TRUE))

cjpg <- cjpg |> 
  arrange(str_rank(vara, numeric = TRUE))

cjpg <- cjpg |> 
  arrange(n_comarca)

cjpg <- cjpg |> 
  arrange(desc(n_comarca)) #descendente

## MUTATE - Cria ou altera coluna

cjpg <- cjpg |> 
  mutate(magistrado = tolower(magistrado))

cjpg <- cjpg |>
  arrange(comarca, magistrado)

#cjpg <- cjpg |>
  #mutate(vara = str_extract(vara, "\\d+")) exemplo ruim

cjpg <- cjpg |> 
  mutate(foro = str_remove(foro, "Foro (de )?"))

## SUMARISE - cria sumarios

sumario <- cjpg |> 
  summarise(min_data = min(disponibilizacao), 
            max_data = max(disponibilizacao),
            median_data = median(disponibilizacao))

sumario <- cjpg |> 
  group_by(classe) |> 
  summarise(min_data = min(disponibilizacao), 
            max_data = max(disponibilizacao),
            median_data = median(disponibilizacao))

##COUNT

classe <- cjpg |> 
  count(classe)

classe <- cjpg |> 
  count(classe, sort = TRUE)

classe_vara <- cjpg |> 
  count(classe, vara, sort = TRUE)

cjpg <- cjpg |> 
  mutate(decisao = tjsp::tjsp_classificar_sentenca(julgado))

vara_decisao <- cjpg |> 
  count(vara, decisao)

##SEPARATE - Vai falar sobre isso depois



