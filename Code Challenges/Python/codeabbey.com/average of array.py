test_cases = int(raw_input("How many test cases? "))
answers = []

for case in range(0, test_cases):

    input_data = raw_input("Input data: ").split()

    average, i = 0, 0
    while i < len(input_data):
        if input_data[i] == '0':
          input_data.pop(i)
        else:
            i += 1

    average = int(round(sum(float(e) for e in input_data) / len(input_data)))

    answers.append(str(average))

print ' '.join(answers)
