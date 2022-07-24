pairs = int(raw_input("How many pairs?\n> "))
ans = []

for n in range(0, pairs):
    a, b = raw_input(" ").split()

    result = int(round(float(a) / float(b)))

    ans.append(result)

print ' '.join(str(e) for e in ans)
