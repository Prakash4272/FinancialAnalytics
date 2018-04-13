#CASE STUDY

sales1= read.csv("./data/denco.csv")                  #importing a data
str(sales1)
table(sales1)
sales2= read.csv(file.choose())                       #when file location is not known

#https://docs.google.com/spreadsheets/d/1h7HU0X_Q4T5h5D1Q36qoK40Tplz94x_HZYHOJJC_edU/edit#gid=216113907

install.packages('gsheet')
library(gsheet)

url = 'https://docs.google.com/spreadsheets/d/1PWWoMqE5o3ChwJbpexeeYkW6p4BHL9hubVb1fkKSBgA/edit#gid=216113907'
denco2 = as.data.frame(gsheet2tbl(url))
str(denco2)

#head(sales1,n=7)
#names(sales1)

sales = sales1  # keeping a backup
class(sales)
?summary
summary(sales)

str(sales)
dim(sales)                      #dimension of dataframe rows and columns
unique(sales$custname)
length(unique(sales$custname))
length(unique(sales$region ))

aggregate(sales$revenue , by=list(sales$custname), FUN=sum) 
?aggregate
df1 = aggregate(sales$revenue , by=list(sales$custname), FUN=sum)
head(df1)
?head
str(df1)

df1=df1[order(df1$x, decreasing=TRUE),]
head(df1,5)
head(df1[order(df1$x, decreasing=TRUE),], 5)

#Aggregate Formula
(df2 = aggregate(revenue ~ custname + region, data=sales, FUN=sum))
head(df2[order(df2$revenue,decreasing=T),],10)

#List
list1= tapply(sales$revenue, sales$custname, FUN=sum)
head(list1)
list1
head(sort(list1, decreasing=T))
summary(df3)
str(df3)

#dplyr
names(sales)
install.packages('dplyr')
library(dplyr)

sales %>% filter(margin > 1000000) %>% arrange(region, desc(revenue))
filter(sales, margin > 1000000)

sales %>% filter(region == '01-East' & revenue > 400000) %>% select(partnum, region, revenue)

names(sales)
sales %>% group_by(region)  %>%
  summarize(Revenue = sum(revenue)) %>% arrange(desc(Revenue))

install.packages('data.table')
library(data.table)
dt1 = as.data.table(sales)
dt2 = dt1[, sum(revenue), by=custname]
names(dt2)
dt1[, dt1[, sum(revenue), by=custname]]

dt1[, order(, decreasing = T)]

# Select
library(sqldf)
df5 =sqldf("Select custname, sum(revenue) from sales Group By custname order by sum(revenue) desc ")
head(df5)

# Freqency --------
names(sales)
table(sales$custname)
head(sort(table(sales$custname), decreasing=T), n=5)
tail(sort(table(sales$custname), decreasing=T), n=10)


#xtab
#
head(sort(xtabs(~ custname, sales), decreasing=T))
#
#
library(dplyr)
sales %>% dplyr::count(custname, sort=TRUE)

sales %>% dplyr::group_by(custname) %>% dplyr::summarise(n = n()) %>% dplyr::arrange(desc(n))



#plyr
df2a= plyr::count(sales, c('custname'))
str(df2a); names(df2a)
head(df2a[order(-df2a$freq),])



# Summarise by Part Num

df3a= aggregate(sales$revenue, by=list(sales$partnum,sales$region), FUN=sum)
df3a[order(-df3a$x),][1:5,]
summary(sales)
df3b = aggregate(revenue ~ partnum,data= sales, FUN=sum)
head(df3b)
head(df3b[order(df3b$revenue, decreasing=T),])

sales %>% dplyr::group_by(partnum) %>% dplyr::summarise(n = n()) %>% dplyr::arrange(desc(n))


# which parts have highest Profit : partno - sum(profit)
names(sales)
df4a = aggregate(margin ~ partnum, data=sales, FUN=sum) 
head(df4a)

sales%>% group_by(partnum) %>% select(partnum,margin) %>% arrange(desc(margin))
