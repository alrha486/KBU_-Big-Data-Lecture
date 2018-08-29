getwd()
setwd("C:/R_project")

install.packages("ggplot2")
install.packages("ggmap")
library(ggmap)
library(ggplot2)

ggmap(get_map(location = "south korea", zoom=7))

map<-get_map(location = "south korea",zoom = 7,source = "stamen",maptype ="watercolor")
map<-get_map(location='south korea', zoom=7, source='google', maptype='satellite')
ggmap(get_map(location = "south korea",zoom = 7,source = "stamen",maptype ="toner"))
ggmap(get_map(location = "south korea",zoom = 7,source = "stamen",maptype ="terrain"))
ggmap(get_map(location='south korea', zoom=7, source='google', maptype='terrain'))
ggmap(get_map(location='south korea', zoom=7, source='google', maptype='satellite'))
ggmap(get_map(location='south korea', zoom=7, source='google', maptype='roadmap'))
ggmap(get_map(location='south korea', zoom=7, source='google', maptype='hybrid'))
ggmap(get_map(location = "south korea",zoom = 7,source = "osm"))


map<-get_map(location = "south korea",zoom = 7,source = "stamen",maptype ="toner") #���� ����

#######################################################���� ��ȣ��
K_eq <- read.csv("���������ǳ���ȣ��.csv", header=T, as.is=T)
ggmap(map)+geom_point(data=K_eq, aes(x=LON, y=LAT, color=address))

#######################################################���� ���Ǽ�
K_eq <- read.csv("�����������ܴ��Ǽ�.csv", header=T, as.is=T)
ggmap(map)+geom_point(data=K_eq, aes(x=LON, y=LAT, color=address))
head(K_eq)


#######################################################�������� �󵵼�
K_eq <- read.csv("��������������.csv",header=T,as.is=T)
ggmap(map) + stat_density_2d(data=K_eq, aes(x=LON, y=LAT, fill=..level.., alpha=..level..), geom='polygon', size=7, bins=30)

p<-ggmap(map) + stat_density_2d(data=K_eq, aes(x=LON, y=LAT, fill=..level.., alpha=..level..), geom='polygon', size=7, bins=30)
#�е� �� ����
p + scale_fill_gradient(low="yellow",high = "red",guide = F)+scale_alpha(range=c(0.02,0.8),guide=F)

#����3.0�̻� + ���Ǽ�
K_eq <- read.csv("��������������.csv",header=T,as.is=T)
K_eq2 <- read.csv("�����������ܴ��Ǽ�.csv", header=T, as.is=T)
map <- get_map(location='south korea', zoom=7, maptype='roadmap', color='bw') #�������
#���Ǽ� ���� #�������� ����
ggmap(map)+geom_point(data=K_eq2, aes(x=LON, y=LAT, color=address),alpha=.75) + stat_density_2d(data=K_eq,aes(x=LON,y=LAT))