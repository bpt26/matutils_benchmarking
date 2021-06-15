library(ape)
t1=read.tree("public-2021-06-09.all.masked.nextclade.pangolin.nwk")
t1b<-multi2di(t1)
write.tree(t1b,file="public-2021-06-09.all.masked.nextclade.pangolin.resolved.nwk")
