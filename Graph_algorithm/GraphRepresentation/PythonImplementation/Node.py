class Node:
    ''' AdjSet there will be a Node and a set of 
        Adjacency Nodes 
    '''
    def __init__(self,vertexId):
        self.vertexId = vertexId
        self.adj_set = set()

    def add_edge(self,v):

        ## this is important you cant add itself
        if self.vertexId == v:
            raise ValueError("The vertext {} can't be adjacent to itself".format(v))
        self.adj_set.add(v)

    def get_adjacent_vertices(self):
        return self.adj_set

    

