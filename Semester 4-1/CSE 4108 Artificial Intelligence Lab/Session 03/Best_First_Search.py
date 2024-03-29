from queue import PriorityQueue
v = 14
graph = [[] for i in range(v)]

# Function For Implementing Best First Search
# Gives output path having lowest cost


def best_first_search(actual_Src, target, n):
    open_list = [False] * n
    pq = PriorityQueue()
    pq.put((0, actual_Src))
    open_list[actual_Src] = True

    while pq.empty() == False:
        u = pq.get()[1] #  retrieves the second element of the tuple (index 1) using array indexing.
        # Displaying the path having lowest cost
        print(u, end=" ")
        
        if u == target:
            break

        for v, c in graph[u]:
            if open_list[v] == False:
                open_list[v] = True
                pq.put((c, v))
    print()

def addedge(x, y, cost):
    graph[x].append((y, cost))
    # graph[y].append((x, cost))


# The nodes shown in above example(by alphabets) are
# implemented using integers addedge(x,y,cost);
addedge(0, 1, 3)
addedge(0, 2, 6)
addedge(0, 3, 5)
addedge(1, 4, 9)
addedge(1, 5, 8)
addedge(2, 6, 12)
addedge(2, 7, 14)
addedge(3, 8, 7)
addedge(8, 9, 5)
addedge(8, 10, 6)
addedge(9, 11, 1)
addedge(9, 12, 10)
addedge(9, 13, 2)

source = 0
target = 9
best_first_search(source, target, v)

