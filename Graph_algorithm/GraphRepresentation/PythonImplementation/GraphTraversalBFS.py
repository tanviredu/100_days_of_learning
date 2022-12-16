# breadth first
# in Breadth first all nodes at same distance
# from origin visited togather

# Depth first
# all nodes from a certain direction visited togather
# with a recurson  we keep going deep in a direction 
# when we reached at the end of a direction
# by law of recursion we fo where we start then choose other direction
import numpy as np
from queue import Queue

from AdjacentMatrixGraph import AdjanceyMatrixGraph as graph

def BFS_UNDIRECTED(graph,start=0):
    # we set the start is 0
    # by default it started from the initial node
    queue = Queue()  # first in first out 
    # put(item) – Put an item into the queue. 
    queue.put(start) # which node comes first will go first
    #IMPORTANT
    # EVERY NODE/VERTEX IS IDENTIFIED WITH A NUMBER
    # IN A GRAPH STARTING WITH 0 ENDING WITH COUNT(TOTAL_NODES) -1
    # SO WE MAKE A ARRAY OF ZEROS WITH THE LENGTH OF THE NUMBER OF NODE/VERTEX
    # FOR EXAMPLE LETS THINK THERE ARE 4 NODES
    # SO FIRST WE CREATE A ARRAY OF 4 ZEROS CALLED VISITED
    # [0,0,0,0]
    # [0,1,2,3]

    # NOW IF THE NODE 2 IS VISITED WE 
    # CHANGE THE VALUE OF INDEX 2 FROM0 TO 1
    # LIKE THIS
    # [0,0,1,0]
    # [0,1,2,3]

    # ITS LIKE A DICTIONARY VALUE
    # EVERY NODE(KEY) HAS A VALUE (0/1) DEPENDING VISITED OR NOT 
    # AdjMatrix has is ingherited FROM the IBaseGraph and it has numvertices property
    # that we fill in adj constructor with super() class
    
    visited = np.zeros(graph.numvertices)
    
    while not queue.empty():
        # untill the queue is empty
        # get() – Remove and return an item from the queue. If queue is empty, wait until an item is available.
        vertex = queue.get()   # pull from the first which is the start Node that is initiated in the parameter
        
        # queue.get() will get the value from the first and remove it
        # so once you use it/visited it
        # after queue.get() is called new first item/formerly second item will be come
        
        
        if visited[vertex] == 1:
            # if already visited then startover the loop again
            continue

        #otherwise
        print("Visited: {}".format(vertex))
        #changing thr status that it is visited
        visited[vertex] = 1

        # get all the adjacent nodes
        for v in graph.get_adjacent_nodes(vertex):
            # if the nodes is not visited
            if visited[v] != 1:
                #put that in the queue
                queue.put(v)




g = graph(9);
g.add_edge(0,1)
g.add_edge(1,2)
g.add_edge(2,7)
g.add_edge(2,4)
g.add_edge(2,3)
g.add_edge(1,5)
g.add_edge(5,6)
g.add_edge(6,3)
g.add_edge(6,8)
g.add_edge(3,4)
g.display();

BFS_UNDIRECTED(g,start=2)
print("----------------------------")
g = graph(9,directed=True);
g.add_edge(0,1)
g.add_edge(1,2)
g.add_edge(2,7)
g.add_edge(2,4)
g.add_edge(2,3)
g.add_edge(1,5)
g.add_edge(5,6)
g.add_edge(6,3)
g.add_edge(6,8)
g.add_edge(3,4)
g.display();

print("-----------------------------")
g = graph(9);
g.add_edge(0,1)
g.add_edge(1,2)
g.add_edge(2,7)
g.add_edge(2,4)
g.add_edge(2,3)
g.add_edge(1,5)
g.add_edge(5,6)
g.add_edge(6,3)
g.add_edge(6,8)
g.add_edge(3,4)
g.display();
BFS_UNDIRECTED(g,start=0)
