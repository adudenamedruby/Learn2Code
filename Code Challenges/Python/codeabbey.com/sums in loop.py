##gathering data and setting answer list
num_of_pairs = int(raw_input("How many pairs?\n"))
final_total = []

##first getting the data for each pair
##looping to calculate each sum and appending to the answer list
for i in range(0, num_of_pairs):
    values = raw_input("Enter numbers:\n").split(' ')
    total = 0

    for n in range(0, len(values)):
        total = total + int(values[n])

    final_total.append(total)

print ' '.join(str(e) for e in final_total)
