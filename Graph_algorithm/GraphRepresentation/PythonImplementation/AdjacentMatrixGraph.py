import numpy as np
from IBaseGraph import IBaseGraph

class AdjanceyMatrixGraph(IBaseGraph):
    def __init__(self,numVertices,directed = False):
        super(AdjanceyMatrixGraph, self).__init__(numVertices,directed)
        ## create the matrix
        self.rowXcolumn = (numVertices,numVertices)
        self.matrix = np.zeros(self.rowXcolumn)

    def add_edge(self, v1, v2, weight = 1):
        if v1 >=self.numvertices or v2>=self.numvertices or v2<0 or v2<0:
            raise ValueError("vertices {} and {} are out of bounds".format(v1,v2))
        if weight < 1:
            raise ValueError("edge cant be less than 1")
        
        # adding relation
        self.matrix[v1][v2] = weight
        
        #if undirected graph
        if self.directed == False:
            self.matrix[v2][v1] = weight

    def get_adjacent_nodes(self, v):
        ## this method actually find 
        ## out degree node
        ## how many emiting edge
        ## to other nodes 
        ## known as adjacent nodes 
        #[1,2] [1,3] [1,4]
        # first row number is fixed(1)
        # we change the column
        # 2,3,4 this is the outdegree nodes
        # we select a row and loop over the entire colum
        # to find outdegree/adjacent_nodes
        # its from to 2 or 3 or 6
        #        1   2   3   4
        #    1  [0., 1., 1., 1.],
        #    2  [0., 0., 1., 0.],
        #    3  [0., 0., 1., 0.],
        #    4  [0., 0., 1., 0.]
        # 1 outdegree/outgoind connected 2 3 and 4
        # [1,2] [1,3] [1,4]
        # 3 edge go from 1 to other node
        # now 1 2 3 and 4  are incident on 3
        #[1,3][2,3][3,3][4,3]
        # node 3 has indegree/incoming 1,2,3,4 means total 4
        # take the column value and iterate 
        # throwgh the rows uou got indegree value 
        if v<0 or v>=self.numvertices:
            raise ValueError("cant access vertices {}".format(v))
        row = v
        adjacent_vertices = []
        for column in range(self.numvertices):
            if self.matrix[row][column]>0:
                adjacent_vertices.append(column)
        
        return adjacent_vertices
    def get_indegree(self, v):
        if v<0 or v>self.numvertices:
            raise ValueError("Can not access vertex {}".format(v))
        # we just need the number of the indegree
        column = v
        indegree = 0
        incoming = []
        for row in range(self.numvertices):
            if(self.matrix[row][column] > 0):
                incoming.append(row)
                indegree+=1
        return indegree

    def get_edge_weight(self, v1, v2):
        return self.matrix[v1,v2]

    def display(self):
        for i in range(self.numvertices):
            for v in self.get_adjacent_nodes(i):
                print("{}------>{}".format(i,v))


# adjgraph = AdjanceyMatrixGraph(4)
# adjgraph.add_edge(0,1)
# adjgraph.add_edge(0,2)
# adjgraph.add_edge(2,3)

# print("Adjacent Nodes")
# print("Adjacent Nodes Of 0 = {}".format(adjgraph.get_adjacent_nodes(0)))
# print("Adjacent Nodes Of 1 = {}".format(adjgraph.get_adjacent_nodes(1)))
# print("Adjacent Nodes Of 2 = {}".format(adjgraph.get_adjacent_nodes(2)))
# print("Adjacent Nodes Of 3 = {}".format(adjgraph.get_adjacent_nodes(3)))

# print("Indegree")
# print("Indegree of 0 = {}".format(adjgraph.get_indegree(0)))
# print("Indegree of 1 = {}".format(adjgraph.get_indegree(1)))
# print("Indegree of 2 = {}".format(adjgraph.get_indegree(2)))
# print("Indegree of 3 = {}".format(adjgraph.get_indegree(3)))


# print("Path")
# adjgraph.display()


# print("------------------------------------------------")
# unadjgraph = AdjanceyMatrixGraph(4,directed=True)
# unadjgraph.add_edge(0,1)
# unadjgraph.add_edge(0,2)
# unadjgraph.add_edge(2,3)

# print("Adjacent Nodes")
# print("Adjacent Nodes Of 0 = {}".format(unadjgraph.get_adjacent_nodes(0)))
# print("Adjacent Nodes Of 1 = {}".format(unadjgraph.get_adjacent_nodes(1)))
# print("Adjacent Nodes Of 2 = {}".format(unadjgraph.get_adjacent_nodes(2)))
# print("Adjacent Nodes Of 3 = {}".format(unadjgraph.get_adjacent_nodes(3)))

# print("Indegree")
# print("Indegree of 0 = {}".format(unadjgraph.get_indegree(0)))
# print("Indegree of 1 = {}".format(unadjgraph.get_indegree(1)))
# print("Indegree of 2 = {}".format(unadjgraph.get_indegree(2)))
# print("Indegree of 3 = {}".format(unadjgraph.get_indegree(3)))


# print("Path")
# unadjgraph.display()


