def gen_method(x):
    x = x * x
    x = str(x)
    if len(x) != 8:
        leading_zeroes = 8 - len(x)
        x = ("0"*leading_zeroes) + x

    x = x[2:6]
    x = int(x)

    return x

answer = []
num_of_cases = int(raw_input("Number of cases: "))

print "Enter data:"
data = map(int, raw_input("").split())

for n in range(num_of_cases):
    number = data[n]
    loop_check = [data[n]]
    loop = 0
    counter = 0
    while loop == 0:
        number = gen_method(number)
        loop_check.append(number)
        counter += 1
        for x in range(len(loop_check)-1):
            if number == loop_check[x]:
                loop = 1

    answer.append(counter)

print ' '.join(str(e) for e in answer)
