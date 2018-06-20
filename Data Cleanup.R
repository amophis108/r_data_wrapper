# data wrap to left join asset price and signal and fill any NA with previous reading of the signal

merge_series<-function(ts_asset,ts_signal,join_type){
  library(xts)
  colnames_asset<-colnames(ts_asset)
  colnames_signal<-colnames(ts_signal)
  print(colnames_signal)
  new_dataset<-merge.xts(ts_asset,ts_signal,join=join_type) # outer join maintains all asset price data
  new_dataset<-na.locf(new_dataset)
  colnames(new_dataset)<-c(colnames_asset,colnames_signal)
  return(new_dataset)
}