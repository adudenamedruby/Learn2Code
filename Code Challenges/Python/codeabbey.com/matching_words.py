with open("text_file.txt", 'r') as f:
    data = f.read().split()

word_count = {}

answer = []

for word in data:
    if word not in word_count:
        word_count[word] = 1
    else:
        word_count[word] += 1

new_data = []

for key in word_count:
    if word_count[key] > 1:
        new_data.append(key)

new_data.sort()
print("\n")
print(" ".join(str(e) for e in new_data))
