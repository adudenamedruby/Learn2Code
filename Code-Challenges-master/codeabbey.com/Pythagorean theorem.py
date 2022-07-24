def Ptheorem(a, b, c):
    if c**2 == a**2 + b**2:
        return "R"
    elif c**2 < a**2 + b**2:
        return "A"
    elif c**2 > a**2 + b**2:
        return "O"

answer = []

for n in range(int(raw_input("How many cases: "))):
    a, b, c = map(int, raw_input().split())
    answer.append(Ptheorem(a, b, c))

print ' '.join(answer)
