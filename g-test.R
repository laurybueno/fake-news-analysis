#Cramér's V varies from 0 to 1, with a 1 indicting a perfect association.  phi varies from -1 to 1, with  -1 and 1  being perfect associations.
#Cramer V testes para variaveis nominais
#Teste feito para avaliar associacao entre duas variaveis

library(DescTools)

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


#Funcao cremerV
gt <- function(y){
  my_table<-table(classifying,y)
  return(GTest(my_table))
}


gt(income)
gt(gender_and_age)
gt(educational)
gt(household_inc)
gt(employments)
gt(race)
gt(hispanic)
gt(state)
gt(region)
gt(annual_household)
gt(gender)
gt(age)
gt(rep_or_dem)

#fontes noticia
gt(buzzfeed)
gt(huffignton)
gt(times)
gt(facebook)
gt(twitter)
gt(snapchat)
gt(vice)
gt(cnn)
gt(vox)
gt(insider)
gt(wash_post)
gt(google)
gt(yahoo)
gt(drudge)
gt(fox)

