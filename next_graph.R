library(igraph)

#1)��������ݺͽڵ�����
edges <- read.table('C:\\Users\\CHARLES\\OneDrive\\��������\\circrna\\DAY3_vs_WT5\\microrna_target\\mmu.txt', header=T, sep='\t')
#��������ݣ�������԰���ÿ���ߵ�Ƶ�����ݻ�Ȩ��
vertices <- read.table('C:\\Users\\CHARLES\\OneDrive\\��������\\circrna\\DAY3_vs_WT5\\microrna_target\\vertices.txt', header=T, sep='\t') #����ڵ����ݣ����԰����������ݣ������

#2)�������ݺ�Ҫת����ͼ���ݲ�����R��ͼ����ͬ���ݸ�ʽ�ò�ͬ��ʽ
#graph_from_literal ͨ�����ִ�����graph_from_edgelistͨ�����б������󣩴�����graph_from_adj_listͨ���ڽ��б������󣩴���
#graph_from_adjacency_matrix ͨ���ڽӾ������е���ݺ���󣩴�����graph_from_incidence_matrixͨ���������������ڲ�������ľ��󣩴���
#graph_from_data_frameͨ�����ݿ򴴽�����ϸ���ܿɲμ���igraph manual��http://igraph.org/r/doc/igraph.pdf
#�������ݸ�ʽ�����ݿ�������graph_from_data_frame
graph <- graph_from_data_frame(edges, directed = TRUE, vertices=vertices) 
#directed = TRUE��ʾ�з���,�������Ҫ�����ݣ���������vertices=NULL

#3)ת����ɺ����������ɷ�ʽ��һ��ֱ��plot,���������棻����ͨ���޸�ͼ�ķ�ʽ���ò�����Ȼ��plot

#���ɷ�ʽ1��
plot(graph,  
	layout=layout.fruchterman.reingold,  #layout.fruchterman.reingold��ʾ����ʽ��ɢ�Ĳ��֣�
	#�������л��β���layout.circle���ֲ㲼��layout.reingold.tilford���������ⷢɢlayout.reingold.tilford(graph,circular=T) �����Ĳ���layout_as_star������������ӻ�layout_with_drl
	vertex.size=5,						#�ڵ��С  
	vertex.shape='circle',		#�ڵ㲻���߿�none,,Բ�α߿�circle,������rectangle  
	vertex.color="yellow",		#������ɫ��������red,blue,cyan,yellow��
	vertex.label=NULL,				#NULL��ʾ�����ã�ΪĬ��״̬����Ĭ����ʾ�����е�����ƣ����������ġ������NA���ʾ����ʾ�κε���Ϣ	 
	vertex.label.cex=0.8,			#�ڵ������С
	vertex.label.color='black',	#�ڵ�������ɫ,red  
	vertex.label.dist=0.4,		#��ǩ�ͽڵ�λ�ô���
	edge.arrow.size=0.3,			#���ߵļ�ͷ�Ĵ�С,��Ϊ0��Ϊ����ͼ����Ȼ��Щ���ݸ�ʽ��֧������ͼ  
	edge.width = 0.5,					#�����߿���
	edge.label=NA,						#����ʾ�����߱�ǩ��Ĭ��ΪƵ��
	edge.color="black")				#������ɫ

#���ɷ�ʽ2��
library(igraph)
edges <- read.table('C:\\Users\\CHARLES\\OneDrive\\��������\\circrna\\DAY7_vs_WT5\\microrna_target\\mmu.txt', header=T, sep='\t')
vertices <- read.table('C:\\Users\\CHARLES\\OneDrive\\��������\\circrna\\DAY7_vs_WT5\\microrna_target\\vertices.txt', header=T, sep='\t') #����ڵ����ݣ����԰����������ݣ������
graph <- graph_from_data_frame(edges, directed = TRUE, vertices=vertices)
set.seed(500) #���������������ͼ�Ĳ��־ͻ���ظ���������ÿ�����ɵ�ʱ�򶼱�
l <- layout.fruchterman.reingold(graph) #����ͼ�Ĳ��ַ�ʽΪ����ʽ��ɢ�Ĳ���

#�����޸Ĺ���
#V(graph)$size <- degree(graph) * 2 + 5  #�ڵ��С������Ķȳ����ȣ����Ķȼ���õ������ĵ������
V(graph)$size <- 5;
#colrs <- c("red", "green")

#V(graph)$color <- V(graph)$color #��������������ɫ,�������ͷ���
V(graph)$label <- NA
V(graph)$label.color <- "black" #���ýڵ��ǵ���ɫ
E(graph)$color="black"
#E(graph)$width <- E(graph)$fre #����Ƶ�������ñ߿���
#E(graph)$label <- E(graph)$fre #����Ƶ�������ñ߱�ǩ
E(graph)$arrow.size=0.3 #���ü�ͷ��С
#����ͼ
plot(graph, layout=l)