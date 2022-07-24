from string import maketrans

palindrome = []

def palindrome_check(user_input):
    large = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    small = "abcdefghijklmnopqrstuvwxyz"
    ignore = "\',.\"<>?!@#$%^&*(){}1234567890[]-_ :;"
    caps_to_small = maketrans(large, small)

    new = user_input.translate(caps_to_small, ignore)[::-1]

    if new == user_input.translate(caps_to_small, ignore):
        return "Y"
    else:
        return "N"

cases = int(raw_input("How many cases:\n"))
print "Enter string:"
for n in range(0, cases):
    data = raw_input("")
    palindrome.append(palindrome_check(data))

print ' '.join(str(e) for e in palindrome)
