def modular_multiplication_graph(n,c):
    #n: number of vertices
    #c: multiplier
    #a: mod this number, default is n
    
    # get the positions of the vertices in a cycle
    Pos = (graphs.CycleGraph(n)).get_pos()
    
    # The dictionary that defines the vertices 
    D = {}
    
    # Adding edges between each i and 2*i mod a
    for i in range(1,n):
        b = mod(c*i,n)
        #ignoring loops
        if i != b:
            D.update({i:[b]})

    G = Graph(D)
    G.set_pos(Pos)
    
    return(G)

# Usage:
@interact
def _(c=(2..200)):
    G = modular_multiplication_graph(200,c)
    show(G,vertex_labels=False,  vertex_size=3)
