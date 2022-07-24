##asking for number of pairs and setting answer lits
num_of_pairs = int(raw_input("How many pairs?\n"))
final_ans = []

##input each pair
##compare the numbers to find out which is smaller
##append the answer to the answer list
for i in range(0, num_of_pairs):
    values = raw_input("Enter numbers:\n").split(' ')
    min_num = 0

    if int(values[0]) < int(values[1]):
        min_num = int(values[0])
    else:
        min_num = int(values[1])

    final_ans.append(min_num)

print ' '.join(str(e) for e in final_ans)
