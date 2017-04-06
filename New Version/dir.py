
graph={"SB00":['C1','SB01','C4','SB10'],
	  "SB01":['SB00','SB02','SB11','C1','C5','C2'],
	  "SB02":['SB01','SB12','C5','C6'],
	  "SB10":['SB00','SB11','SB20','C4','C12'],
	  "SB11":['SB01','SB21','SB12','SB10','C3','C7'],
	  "SB12":['SB02','SB22','SB11','C6','C8','C7'],
          "SB20":['SB10','SB21','C12','C11'],
	  "SB21":['SB20','SB11','SB22','C11','C9'],
	  "SB22":['SB12','SB21','C8','C9'],
	"C1":['SB00','SB01'],
	"C5":['SB01','SB02'],
	"C4":['SB00','SB10'],
	"C2":['SB01','SB11'],
	"C6":['SB02','SB12'],
	"C12":['SB10','SB20'],
	"C3":['SB10','SB11'],
	"C7":['SB11','SB12'],
	"C10":['SB11','SB21'],
	"C9":["SB21","SB22"],
	"C8":["SB12","SB22"]
	}



def find_shortest_path(graph, start, end, path=[]):	
        path = path + [start]
        if start == end:
            return path
        if not graph.has_key(start):
            return None
        shortest = None
        for node in graph[start]:
            if node not in path:
                newpath = find_shortest_path(graph, node, end, path)
                if newpath:
                    if not shortest or len(newpath) < len(shortest):
                        shortest = newpath
        return shortest



pa=[]

pa=find_shortest_path(graph,'C4','C9')
print pa
k=len(pa)
print k
i=0

