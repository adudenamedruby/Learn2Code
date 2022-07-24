##get the data from the user and turn it into an integer array
user_array = map(int, raw_input("Enter array: ").split())

##create a dictionary with the initial locations of the numbers
initial_places = {}
for n in range(0, len(user_array)):
    initial_places[user_array[n]] = n+1

##implementing a bubble sort algorithm
made_swap = 'y'
while made_swap == 'y':
    made_swap = 'n'
    for n in range(0, len(user_array)-1):
        if user_array[n] <= user_array[n+1]:
            pass
        elif user_array[n] > user_array[n+1]:
            temp = user_array[n]
            user_array[n] = user_array[n+1]
            user_array[n+1] = temp
            made_swap = 'y'

##Creating a list with the numbers of the array rpplaced with their
##original initial positions
rewritten_initial_places = []
for n in user_array:
    rewritten_initial_places.append(initial_places[n])

print ' '.join(str(e) for e in rewritten_initial_places)
