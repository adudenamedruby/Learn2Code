##getting number of pairs and seting answer list
num_of_pairs = int(raw_input("How many pairs?\n"))
final_ans = []

##getting three values to compare
##comparing three values
for i in range(0, num_of_pairs):
    a, b, c = raw_input("Enter numbers:\n").split(' ')
    min_num = int(c)

    if int(a) < int(c):
        min_num = int(a)

    if int(b) < min_num:
        min_num = int(b)

    final_ans.append(min_num)

print ' '.join(str(e) for e in final_ans)
