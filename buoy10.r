str1="http://www.ndbc.noaa.gov/view_text_file.php?filename="
str2=".txt.gz&dir=data/historical/stdmet/"
buoynum<-"44013"
y1<-1984
y2<-1990
data<-NULL
while(y1<=y2){
fyl<-paste0(str1,buoynum,"h",y1,str2)
header<-scan(fyl,nlines=1,what=character())
buoy<-read.table(fyl,skip=2,header=FALSE)
colnames(buoy)<-header
buoy$ATMP[buoy$ATMP==999]<-NA
data<-c(data,buoy$ATMP)
y1<-y1+1

}