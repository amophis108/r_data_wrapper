csv2xts<-function(file_name){
  library("xts")
  
  raw_table<-read.csv(file_name,header=TRUE,sep=",")
  nCol<-dim(raw_table)[2]
  col_list<-2:nCol
  xts_table<-xts(raw_table[,col_list],order.by=as.Date(raw_table$Date,"%m/%d/%Y"))
  return(xts_table)
  
}
