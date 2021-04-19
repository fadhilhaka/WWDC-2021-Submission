from itertools import permutations 

import csv
import random

# perm = permutations(["ant", "elephant", "giraffe"], 1)
# for i in perm:
#     print(''.join(i))

with open('prediction_data.csv', 'w', newline='') as file:
    writer = csv.writer(file)
    writer.writerow(["previous_condition", "previous_result", "previous_animal", "selected_animal", "result", "prediction_animal"])

    animal_list = ["ant", "elephant", "giraffe"]
    starting_conditions = ["none", "none, ant", "none, elephant", "none, giraffe"]
    results = ["win", "draw", "lose"]

    for _ in range(10_001):
        random_condition_index = random.randint(0, len(starting_conditions)-1)
        random_previous_result_index = random.randint(0, len(results)-1)
        random_result_index = random.randint(0, len(results)-1)
        random_animal_index = random.randint(0, len(animal_list)-1)
        
        previous_condition = starting_conditions[random_condition_index]
        previous_result = "none" if previous_condition == "none" else results[random_previous_result_index]

        animal = random_animal_index
        if previous_result != "none":
            animalStr = previous_condition.split()[-1]
            if animalStr == "ant":
                animal = 0
            elif animalStr == "elephant":
                animal = 1
            elif animalStr == "giraffe":
                animal = 2

        previous_animal = -1 if previous_condition == "none" else animal
        selected_animal = random_animal_index
        result = results[random_result_index]
        prediction_animal = selected_animal

        if selected_animal == 0:
            if result == "lose":
                prediction_animal = 1
            elif result == "draw":
                prediction_animal = 2
        elif selected_animal == 1:
            if result == "lose":
                prediction_animal = 2
            elif result == "draw":
                prediction_animal = 0
        elif selected_animal == 2:
            if result == "lose":
                prediction_animal = 0
            elif result == "draw":
                prediction_animal = 1
        
        writer.writerow([previous_condition, previous_result, previous_animal, selected_animal, result, prediction_animal])