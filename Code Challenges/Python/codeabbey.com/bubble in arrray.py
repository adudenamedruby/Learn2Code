data = raw_input("Enter data: ").split()
swaps = 0
result = 0

data.pop()
data = map(int, data)

for n in range(0, (len(data)-1)):
    temp = data[n]
    if data[n] > data[n+1]:
        data[n] = data[n+1]
        data[n+1] = temp
        swaps += 1
    else:
        pass

for x in range(0, len(data)):
    result = ((result + int(data[x])) * 113) % 10000007

print str(swaps) + " " + str(result)
