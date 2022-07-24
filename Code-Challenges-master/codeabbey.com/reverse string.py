user_in = raw_input("Input: ")
ans = ''
for e in range((len(user_in)-1), -1, -1):
    ans = ans + user_in[e]

print ans
