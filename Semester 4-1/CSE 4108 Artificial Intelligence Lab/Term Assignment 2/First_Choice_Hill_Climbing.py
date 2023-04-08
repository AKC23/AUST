

def first_choice_hill_climbing(state, neighbor_function, objective_function):
    current_state = state
    while True:
        neighbors = neighbor_function(current_state)
        if not neighbors:
            return current_state
        best_neighbor = neighbors[0]
        for neighbor in neighbors[1:]:
            if objective_function(neighbor) > objective_function(best_neighbor):
                best_neighbor = neighbor
        if objective_function(best_neighbor) <= objective_function(current_state):
            return current_state
        current_state = best_neighbor


def get_neighbors(state):
    neighbors = []
    for i in range(len(state)):
        new_state = state[:]
        new_state[i] += 1
        neighbors.append(new_state)
    return neighbors


def get_value(state):
    return max(state)


initial_state = [1, 2, 3, 4]
result = first_choice_hill_climbing(initial_state, get_neighbors, get_value)
print(result)
