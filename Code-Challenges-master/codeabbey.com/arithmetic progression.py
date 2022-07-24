test_cases = raw_input("How many test cases: ")
ans = []

def progression(first_number, step_size, values):
    temp_ans = first_number
    temp_total = first_number

    for n in range(1, values):
        temp_ans = first_number + (n * step_size)
        temp_total = temp_total + temp_ans

    ans.append(temp_total)

for e in range(0, int(test_cases)):
    case_data = raw_input("Enter data: ").split()
    progression(int(case_data[0]), int(case_data[1]), int(case_data[2]))

print ' '.join(str(e) for e in ans)
