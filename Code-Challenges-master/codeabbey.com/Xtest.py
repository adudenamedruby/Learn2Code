answer = []

for x in range(int(raw_input("How many cases: "))):
    disp, string = raw_input("").split()
    answer.append(string[int(disp):] + string[:int(disp)])

print ' '.join(answer)
