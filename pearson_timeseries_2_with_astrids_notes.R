#this script calculates the correlation between pairs of transcripts and writes the values above a given threshold in a file called "Edge_List.csv"
#save the scripts and the data file in the same folder
#replace "network_data_eg.txt" by the name of the data file
setwd("your/working/directory/here") #remove when working on HPC cluster
my.data <- read.delim("network_data_eg.txt") 
rownames(my.data) <- my.data[,2]
my.data <- my.data[,3:ncol(my.data)]
my.data <- t(my.data)
my.data.cor <- cor(my.data, method="pearson") #pearson correlation 

diag(my.data.cor) = 0

#replace "0.96" by the desired threshold value
cutoff= 0.2 #set deliberately low to ensure that script is working
edgeList <- matrix(ncol=3, nrow=0)
colnames(edgeList) = c("transcript1", "transcript2", "score")
for (i in 1:(nrow(my.data.cor) - 1)) {
  for (j in (i + 1):ncol(my.data.cor)) {
    if(abs(my.data.cor[i,j]) > cutoff) {
      edgeList = rbind(edgeList, list(rownames(my.data.cor)[i], colnames(my.data.cor)[j], my.data.cor[i,j]))
    }
  }
}
 
#the output file will be called "Edge_List.csv"
write.table(edgeList, file="Edge_List.csv", sep=';', row.names = FALSE)
