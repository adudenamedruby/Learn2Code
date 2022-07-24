def Herons_method(r, x):
    d = x / r
    diff = abs(r - d)
    r = (r + d) / 2
    return r

answer = []

for n in range(int(raw_input("How many cases: "))):
    r = 1
    x, n = raw_input("").split()
    for p in range(int(n)):
        r = Herons_method(r, float(x))

    answer.append(str(r))

print ' '.join(answer)
