cases = int(raw_input("How many cases: "))
answer = []

def rotate(displacement, string):
    if displacement > 0:
        temp = string[:displacement]
        string = string[displacement:]
        rotated = string + temp
    elif displacement < 0:
        temp = string[displacement:]
        string = string[:displacement:]
        rotated = temp + string

    return rotated

for n in range(0, cases):
    data = raw_input("").split()
    displacement = int(data[0])
    answer.append(rotate(displacement, data[1]))

print ' '.join(str(e) for e in answer)
