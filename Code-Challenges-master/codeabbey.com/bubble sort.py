##Getting the data ex. requires and changing it to ints
array_size = int(raw_input("Array size: "))
data = raw_input("Enter array contents: ").split()
data = map(int, data)

##program counters
swap_counter = 0
made_swap = 'y'
number_of_passes = 0


#an algorithm to sort the things
while made_swap == 'y':
    made_swap = 'n'
    number_of_passes += 1
    for n in range(0, array_size-1):
        if data[n] <= data[n+1]:
            pass
        elif data[n] > data[n+1]:
            temp = data[n]
            data[n] = data[n+1]
            data[n+1] = temp
            swap_counter += 1
            made_swap = 'y'

print number_of_passes, swap_counter
