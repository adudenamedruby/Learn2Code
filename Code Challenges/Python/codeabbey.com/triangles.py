test_cases = int(raw_input("Number of teste cases: "))
ans = []

def validate_triangle(a, b, c):

    if a + b <= c:
        validity = 0
    elif a + c <= b:
        validity = 0
    elif c + b <= a:
        validity = 0
    else:
        validity = 1

    ans.append(validity)

for n in range(0, test_cases):
    a, b, c = map(int, raw_input("> ").split())
    validate_triangle(a, b, c)

print ' '.join(str(e) for e in ans)
