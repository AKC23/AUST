def first_choice_hill_climbing(current_state, neighbor_function, objective_function):
    while True:
        neighbors = neighbor_function(current_state)
        if not neighbors:
            return current_state
        best_neighbor = neighbors[0]
        found_better_neighbor = False
        for neighbor in neighbors[1:]:
            if objective_function(neighbor) > objective_function(best_neighbor):
                best_neighbor = neighbor
                found_better_neighbor = True
        if not found_better_neighbor:
            return current_state
        current_state = best_neighbor


def get_neighbors(state):
    neighbors = [state-1, state+1]
    return neighbors


def get_value(state):
    return state**2


initial_state = 5
result = first_choice_hill_climbing(initial_state,
                                    lambda state: get_neighbors(state),
                                    lambda state: get_value(state))
print("Result:", result)
print("Value:", get_value(result))
