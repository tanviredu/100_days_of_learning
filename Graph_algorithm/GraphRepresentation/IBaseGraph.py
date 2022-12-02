import abc
import numpy as np 
# abstract class fot graph
# vertices are known as Node
# vertext are the connecting line (relationship) 
# a graph must have some
# nodes/vertices and isit directed and undirected flag
# and vertex
class IBaseGraph(abc.ABC):
    ''' A abstract class of any directed
        and undirected graph
    '''
    def __init__(self,numvertices,directed=False):        
        self.numvertices = numvertices
        self.directed    = directed
    

    # adding edge between two Nodes v1,v2
    # weight is another parameter
    # showing weight of the edge
    # for now we pretend all are same weight 
    @abc.abstractmethod
    def add_edge(self,v1,v2,weight):
        pass

    # give a node and get all the 
    # adjacent node of that perticular Node
    @abc.abstractmethod
    def get_adjacent_nodes(self,v):
        pass

    # get all the nodes
    # total number of edge that
    # incident on a perticular node
    # incident not eminiting
    @abc.abstractmethod
    def get_indegree(self,v):
        pass

    @abc.abstractmethod
    def get_edge_weight(self,v1,v2):
        pass

    @abc.abstractmethod
    def display(self):
        pass

