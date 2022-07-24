## Sum in Loop

##gathering data and declaring variables
amount_of_values = int(raw_input("How many numbers?\n"))
values = raw_input("Enter numbers:\n").split(' ')
total = 0

##looping the total
for i in range(0, amount_of_values):
    total = total + int(values[i])

print total
