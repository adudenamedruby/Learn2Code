elements = raw_input("How many values?   ")
array_values = raw_input("Array values: ").split(' ')
result = 0

for x in range(0, int(elements)):
    result = ((result + int(array_values[x])) * 113) % 10000007

print result
