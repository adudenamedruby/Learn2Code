##creating Euclid's algorithms
def gcd_Euclid(case):
    a, b = case
    print a, b
    while a != b:
        if a > b:
            a = a - b
        elif b > a:
            b = b - a

    gcd = a

    return gcd

def lcm_Euclid(function, case):
    a, b = case
    lcm = a * b / gcd_Euclid(case)

    return lcm

##Getting user input
##Converting the user input into int
num_of_cases = int(raw_input("Test cases: "))
cases = {}
for n in range(num_of_cases):
    cases[n] = raw_input("").split()
    cases[n] = map(int, cases[n])

##Finding the GCD for each case
answer = {}
for n in range(num_of_cases):
    answer[n] = [gcd_Euclid(cases[n]), lcm_Euclid(gcd_Euclid, cases[n])]

for n in (answer):
    print ("(%s)" % answer[n]).translate(None, "[],"),
