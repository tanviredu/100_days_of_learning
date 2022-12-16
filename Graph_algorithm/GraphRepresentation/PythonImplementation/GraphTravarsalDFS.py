import numpy as np
from AdjacentMatrixGraph import AdjanceyMatrixGraph as graph



def DepthFirst(graph,visited,currentNode = 0):
    # 3 things is needed in the recursive method
    # the graph
    # the visited array/list
    # current Node/vertex we are working on/current Node
    # everytime the function call the visited array will be updated
    # and the current Node will change
    
    # if the node is visited that means we
    # hit the end of that diretion
    # so return
    if visited[currentNode] == 1:
        return
    
    #othrwise
    #mark it visited
    visited[currentNode] = 1
    print(visited)
    print("Visited: {}".format(currentNode))
    for node in graph.get_adjacent_nodes(currentNode):
        DepthFirst(graph,visited,node)

    
    #explanation
    # first it will check if it is already visited
    # that means is it the end of the path
    # if not then it marked the visited
    # and print the current as visited node
    # then loop through the adjacent node 
    # and then invoke the Depth first
    # with graph,visited and cuurrent_node
    # one by one of the for loop will be the current node
    # and the graph will be keep updated by every call
    # when it reach the end then visited[currentNode] will be 1
    # since previous loop already marked it as 1
    # then it returns and return to the origin 
    # easy 


#g = graph(9)
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

# prepare a visited list filled with zeros
visited = np.zeros(g.numvertices)
DepthFirst(g,visited)

#fully understand
