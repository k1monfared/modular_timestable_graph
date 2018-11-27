def modular_multiplication_graph(n,c):
    #n: number of vertices
    #c: multiplier
    #a: mod this number, default is n
    
    # get the positions of the vertices in a cycle
    Pos = (graphs.CycleGraph(n)).get_pos()
    
    # The dictionary that defines the vertices 
    D = {}
    
    # Adding edges between each i and c*i mod n
    for i in range(1,n):
        b = mod(c*i,n)
        #ignoring loops
        if i != b:
            D.update({i:[b]})

    G = Graph(D)
    G.set_pos(Pos)
    
    return(G)

#Use:
n = 200
for c in range(n):
    G = modular_multiplication_graph(n,c)
    p = G.plot(vertex_labels=False, vertex_size=3, edge_color='grey', edge_style='solid', title= 'c = ' + str(c))
    p.save('modular_times_graph_' + str(n) + '_nodes_' + str(c)+ '_multplier.png')
