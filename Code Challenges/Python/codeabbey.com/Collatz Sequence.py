test_cases = raw_input("Test cases: ")
cases = raw_input("Input cases: ").split()
answer = []

def Collatz_Sequence(num):
    counter = 0
    while num > 1:
        if num % 2 == 0:
            num = num / 2
            counter += 1
        else:
            num = 3 * num + 1
            counter += 1
    answer.append(counter)

for x in range(0, (int(test_cases))):
    Collatz_Sequence(int(cases[x]))

print ' '.join(str(e) for e in answer)
