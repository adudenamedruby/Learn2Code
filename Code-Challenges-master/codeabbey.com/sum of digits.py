num_of_values = int(raw_input("How many numbers do you want to process? "))
answer = []
for e in range(0, num_of_values):
    sum_of_digits = 0
    in_data = raw_input("Enter values: ").split()

    value = (int(in_data[0]) * int(in_data[1])) + int(in_data[2])

    while value > 0:
        sum_of_digits = sum_of_digits + (value % 10)
        value = value / 10

    answer.append(str(sum_of_digits))

print ' '.join(answer)
