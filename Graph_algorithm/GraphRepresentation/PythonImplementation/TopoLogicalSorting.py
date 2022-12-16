# THIS ALGORITHM WORS ON DAG
# DAG MEANS DIRECTED ASYCLIC GRAPH
# THE GRAPH HAVE TO BE DIRECTED
# AND THE GRAPH HAS NO CYCLE
# TOPOLOGICAL SORTING SHOWS THE PRECEDING RELATION SHIP
# WHILE TRAVERSING THE GRAPH
# IN TOPOLOGICAL SORT IS A LINER ORDERING OF 
# ALL VERTEX/NODE THAT SHOWS THE PRECEDENCE RELATIONSHIP

# IF VERTES A INCIDENT ON D
# IN TOPOLOGICAL SORT IN THE LINEAR ORDERING 
# D COMES AFTER THE A ,BECUASE D DEPENDS ON A 
 


# A TOPOLOGICAL SORT IS ANY ORDERING OF ALL THE GRAPHS
# NODES/VERTECES THAT SATISFIES ALL THE PRECEDENCE 
# RELATIONSHIPS

# ALL THE NODE WILL BE THERE
# DIRECTED GRAPH
# NO CYCLE



###
#  IN TOPOLOGICAL SORTING
#  ALL THE DEPENDENCIES OF A NODE COMES BEFORE THE NODE IT SELF
#  IN A EASY WAY NODE IT SELF COMES AFTER ITS DEPNDENCIES
#  SAME THING 
##
from queue import Queue
from AdjacentMatrixGraph import AdjanceyMatrixGraph as graph


def topological_sort(graph = graph):
    ProcessQueue = Queue()
    indegreeMap = {}
    
    ## GETTING ALL THE INDEGREE
    for i in range(graph.numvertices):
        indegreeMap[i] = graph.get_indegree(i)
        if indegreeMap[i] == 0:
            ProcessQueue.put(i)
    
    sortedorderList = []
    while not ProcessQueue.empty():
        # take and remove with .get()
        vertex = ProcessQueue.get()
        sortedorderList.append(vertex)
        for v in graph.get_adjacent_nodes(vertex):
            indegreeMap[v] = indegreeMap[v] -1
            if indegreeMap[v] == 0:
                ProcessQueue.put(v)
    
    if(len(sortedorderList)!=graph.numvertices):
        raise ValueError("This graph has a cycle")
    print(indegreeMap)
    print(sortedorderList)



#g = graph(9,directed=True)
#g.add_edge(0,1)
#g.add_edge(1,2)
#g.add_edge(2,7)
#g.add_edge(2,4)
#g.add_edge(2,3)
#g.add_edge(1,5)
#g.add_edge(5,6)
#g.add_edge(3,6)
#g.add_edge(3,4)
#g.add_edge(6,8)

#topological_sort(g)



# see 2_topological sort image

# 0->A
# 1->B
# 2->C
# 3->D
# 4->E

# 5->F

g = graph(6,directed=True)
g.add_edge(0,1)
g.add_edge(0,2)
g.add_edge(2,4)
g.add_edge(4,1)
g.add_edge(4,3)
g.add_edge(1,3)
#g.add_edge(5,3)

topological_sort(g)
