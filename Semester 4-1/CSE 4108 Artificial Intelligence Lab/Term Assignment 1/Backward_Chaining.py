def backward_chaining(goal, rules):
  if goal in rules:
    # Check if the goal can be achieved by satisfying a single rule
    return backward_chaining_rule(goal, rules[goal], rules)
  else:
    # Check if the goal can be achieved by combining multiple rules
    for rule in rules:
      if goal in rules[rule]:
        # print(goal)
        result = backward_chaining_rule(rule, rules[rule], rules)
        
        if result:
          return result
    return False

def backward_chaining_rule(goal, premises, rules):
  for premise in premises:
    # print(premise)
    if not backward_chaining(premise, rules):
      return False
  return True

# set of rules
rules = {
  'A': [],
  'B': [],
  'C': [],
  'D': [],
  'Q': ['P'],
  'P': ['C','L'],
  'P': ['D','M'],
  'M': ['B','L'],
  'L': ['A','P'],
  'L': ['A','B'],
  'G': ['A','D'],
  'C': ['G','B'],  
}

# Find goal
result = backward_chaining('c', rules)
print(result) # True


""" 
# Check if we can achieve the goal 'A'
result = backward_chaining('A', rules)
print(result) # True

# Check if we can achieve the goal 'B'
result = backward_chaining('B', rules)
print(result) # True

# Check if we can achieve the goal 'C'
result = backward_chaining('C', rules)
print(result) # True

# Check if we can achieve the goal 'D'
result = backward_chaining('D', rules)
print(result) # True

# Check if we can achieve the goal 'X' (which is not defined in the rules)
result = backward_chaining('X', rules)
print(result) # False """
