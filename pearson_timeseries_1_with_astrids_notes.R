#this script was given to me by Maria Cecilia Dias Costa, and I think originated from Eef Jonkheer
#this script calculates the number of edges and nodes for threshold values ranging between 0.8 and 1.0
#save the scripts and the data file in the same folder
#replace "network_data_eg.txt" by the name of the data file

#comments below are my own
#setwd("your/working/directory/here") #remove when running on the HPC cluster - only for testing subset of local file 
my.data <- read.delim("network_data_eg.txt") 
rownames(my.data) <- my.data[,2]
my.data <- my.data[,3:ncol(my.data)]
my.data <- t(my.data)
my.data.cor <- cor(my.data, method="pearson") #pearson correlation 
 
diag(my.data.cor) = 0 #replaces 1.0 values with zero in the diagonal, so as to remove the perfect correlation of genes with themselves

#the output file will be called "cutoff.txt" and will appear in your working directory 
sink("cutoff.txt")
for(cutoff in seq(0.8, 1.0, by = 0.01)) { #0.8 can be replaced with your own value, but bear in mind that a pearson correlation of lower than 0.8 is unlikely to be biologically relevant
  cat(cutoff, ". edges: ", length(my.data.cor[abs(my.data.cor) >= cutoff])/2)
  cat(", nodes:", sum(rowSums(abs(my.data.cor) >= cutoff)>0), "\n")
}
sink()


#This cutoff file can be used to determine the pearson correlation cut off value, based on how many nodes and edges are desired.
#note that you want a cutoff value with high significance but not too few nodes to work with. In my PhD work, I used a cutoff of 0.94, as this yielded the most desirable balance. 
#continues in pearson_timeseries_2
