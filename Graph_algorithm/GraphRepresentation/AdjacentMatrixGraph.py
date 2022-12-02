import numpy as np
from IBaseGraph import IBaseGraph

class AdjacencyMatrixGraph(IBaseGraph):
    def __init__(self,numvertices,directed = False):
        super(AdjacencyMatrixGraph, self).__init__(numvertices,directed)
        # creating a matrix of zero(row= number of nodes/vertices,column = number of nodes/vertices)
        # NxN matrix
        self.matrix = np.zeros((numvertices,numvertices))
    
    def add_edge(self, v1, v2, weight = 1):
        ### the node/vertices which is
        ### going to provide
        ### must be v1/v2 >=0 and <=v1/v2 -1
        ### because index start with 0
        
        if v1>= self.numvertices and v2>=self.numvertices or v1 < 0 or v2<0:
            raise ValueError("Node {} and {} are out of bounds".format(v1,v2))
        if weight < 1:
            raise ValueError("Weight can not be less than 1")
        
        # filling the martix specfic cell with weight / in this case 1
        self.matrix[v1][v2] = weight

        # if it is an undirected graph
        # there must be [row][column] and [colum][row] / [v1][v2],[v2][v1]
        if self.directed == False:
            self.matrix[v2][v1] = weight

    def get_adjacent_nodes(self, v):
#        array([[0., 0., 0., 0.],
#               [0., 0., 0., 0.],
#               [0., 0., 0., 0.],
#               [0., 0., 0., 0.]])



