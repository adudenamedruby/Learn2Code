values = raw_input("> ").split(' ')
final_ans = [int(values[0]), int(values[1])]

for place in range(0, len(values)):

    if int(values[place]) < final_ans[0]:
        final_ans[0] = int(values[place])

    if int(values[place]) > final_ans[1]:
        final_ans[1] = int(values[place])

print ' '.join(str(e) for e in final_ans)
