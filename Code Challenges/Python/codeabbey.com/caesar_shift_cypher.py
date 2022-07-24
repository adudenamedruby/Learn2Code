lines, caesar_shift = map(int, input(
                          "Enter number of lines and shift value: ").split())
answer = []

def convert(text, shift):
    new_text = ''
    for n in text:
        if n in ("\".,'!@#$%^&*() {}][0987654321-_/?=+\|;::"):
            new_text = new_text + n
        elif ord(n) - caesar_shift < 65:
            new_text = new_text + chr(ord(n) - caesar_shift + 26)
        else:
            new_text = new_text + chr(ord(n) - caesar_shift)

    return new_text

print("Enter text:")

for x in range(lines):
    line = input("")
    answer.append(convert(line, caesar_shift))

print(' '.join(str(e) for e in answer))
