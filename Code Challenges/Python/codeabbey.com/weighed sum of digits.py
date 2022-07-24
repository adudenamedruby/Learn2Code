many = int(raw_input("How many numbers?\n> "))
numbers = raw_input("Input numbers:\n> ").split()
ans = []

for n in range(0, many):
    wsd = 0
    temp = numbers[n]

    for d in range(0, len(numbers[n])):
        wsd = wsd + (int(temp[d]) * (d + 1))

    ans.append(wsd)

print ' '.join(str(e) for e in ans)
