import numpy as  np
from Node import Node
from IBaseGraph import IBaseGraph
class AdjacencySet(IBaseGraph):

    def __init__(self, numvertices, directed=False):
        super(AdjacencySet,self).__init__(numvertices, directed)
        
        #first take the number of the node
        # then create a node object
        # with the number starting from 0
        # all the node is now in the vertex list
        # at beginning no node has any adjancy Node
        # set is empty from every Node
        self.vertex_list = []
        for i in range(numvertices):
            self.vertex_list.append(Node(i))
    
    def add_edge(self, v1, v2, weight = 1):
        if v1 >=self.numvertices or v2>=self.numvertices or v1<0 or v2<0:
            raise ValueError("Vertices {} and {} are out of bounds".format(v1,v2))

        ## we only work with weight default 1
        #3 we wont work with weighted graph
        if weight !=1:
            raise ValueError("Weight can't be >1 in this program")
        self.vertex_list[v1].add_edge(v2)
        if self.directed==False:
            self.vertex_list[v2].add_edge(v1)

    def get_adjacent_nodes(self, v):
        if v<0 or v>=self.numvertices:
            raise ValueError("can't access {}".format(v))
        return self.vertex_list[v].get_adjacent_vertices()          

    ## how to find the indegree
    ## every Node class has two property
    ## 1) vertexid
    ## 2) list of node in which vertexid incident
    ## 3) so if we got a vertex id and
    ## we search throw every Node's vertex list
    ## we can tell the incoming/indegree of this node
    ## be in a vertex_list means indegree

    def get_indegree(self, v):
        if v<0 or v>=self.numvertices:
            raise ValueError("Cant Access Vertex {}".format(v))
        target = v
        indegree = 0
        indegree_list = []
        for vertex in range(self.numvertices):
            if target in self.get_adjacent_nodes(vertex):
                indegree+=1
                indegree_list.append(vertex)
        return indegree,indegree_list
            
    def get_edge_weight(self, v1, v2):
        return 1

    def display(self):
        for i in range(self.numvertices):
            for v in self.get_adjacent_nodes(i):
                print("{} --------> {}".format(i,v))
    

adjset = AdjacencySet(4,directed=False)
adjset.add_edge(0,1)
adjset.add_edge(0,2)
adjset.add_edge(2,3)

print("Get indegree")
for item in range(4):
    indegree,indegree_list = adjset.get_indegree(item)
    print("---------------------------------------------------")
    print("Node : {} has indegree {}".format(item,indegree))
    print("Coming From {} ".format(indegree_list))
print("-------------------------------------------")


adjset.display()
print("-------------------------------------------")
print("Directed Graph")



adjset = AdjacencySet(4,directed=True)
adjset.add_edge(0,1)
adjset.add_edge(0,2)
adjset.add_edge(2,3)

print("Get indegree")
for item in range(4):
    indegree,indegree_list = adjset.get_indegree(item)
    print("---------------------------------------------------")
    print("Node : {} has indegree {}".format(item,indegree))
    print("Coming From {} ".format(indegree_list))
print("-------------------------------------------")


adjset.display()

        
    