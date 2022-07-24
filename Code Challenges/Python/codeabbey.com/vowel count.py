##getting input data
##setting what counts as a vowel
line_count = int(raw_input("How many lines?\n> "))
vowel_list = ['a', 'e', 'i', 'o', 'u', 'y']
vowels_count = []

##setting a vowel count per line
#counting the vowels if there are any
for n in range(0, line_count):
    vowels = 0
    line_content = raw_input("> ")

    for c in range(0, len(line_content)):
        if line_content[c] in vowel_list:
            vowels += 1
    vowels_count.append(vowels)

print ' '.join(str(e) for e in vowels_count)
