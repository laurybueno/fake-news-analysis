#Chi-squared testes para variaveis nominais
#Teste feito para avaliar associacao entre duas variaveis

setwd("C:/Users/anact/Documents/MQA/fake-news-analysis")

dados <- read.csv(file="data/remembered-headlines.csv", header=TRUE, sep=",")

classifying <- dados$classifying 
income <- dados$DP_INCOME
gender_and_age <- dados$DP_GENAGE
educational <- dados$DP_EDUCATION_BAN
household_inc <- dados$DP_USHHI2_der
employments <- dados$EMP01_der
race <- dados$USRACE4_der
hispanic <- dados$USRETH3_der
state <- dados$HCAL_REGION1_Label_abbreviation_US
region <- dados$HCAL_STDREGION_US
annual_household <-dados$USHHI2 #before taxes
gender <- dados$resp_gender
age <-dados$resp_age
rep_or_dem <- dados$DWD1 #democrata, republicano ou nenhum dos dois

buzzfeed <- dados$GRID_DWD11_1_DWD11 
huffignton <- dados$GRID_DWD11_2_DWD11
times <- dados$GRID_DWD11_3_DWD11
facebook <- dados$GRID_DWD11_4_DWD11
twitter <- dados$GRID_DWD11_5_DWD11
snapchat <- dados$GRID_DWD11_6_DWD11
vice <- dados$GRID_DWD11_7_DWD11
cnn <-dados$GRID_DWD11_8_DWD11
vox <- dados$GRID_DWD11_9_DWD11
insider <- dados$GRID_DWD11_10_DWD11
wash_post <- dados$GRID_DWD11_11_DWD11
google <- dados$GRID_DWD11_12_DWD11
yahoo <- dados$GRID_DWD11_13_DWD11
drudge <- dados$GRID_DWD11_14_DWD11
fox <- dados$GRID_DWD11_15_DWD11

#Funcao teste chi quadrado
cs <- function(y){
  return(chisq.test(classifying,y))
}

#Funcao teste chi quadrado com simulacao do valor p = quando nao tem dados o suficiente para cada classificacao das variaveis
csp <- function(y){
  return(chisq.test(classifying,y,simulate.p.value = TRUE))
}

cs(income)
cs(gender_and_age)
cs(educational)
cs(household_inc)
cs(employments)
cs(race)
cs(hispanic)
cs(state)
cs(region)
cs(annual_household)
cs(gender)
cs(age)
cs(rep_or_dem)

#fontes noticia
cs(buzzfeed)
cs(huffignton)
cs(times)
cs(facebook)
cs(twitter)
cs(snapchat)
cs(vice)
cs(cnn)
cs(vox)
cs(insider)
cs(wash_post)
cs(google)
cs(yahoo)
cs(drudge)
cs(fox)

