input_data = raw_input("> ").split(' ')
celsius_data = []

for n in range(1, (int(input_data[0])+1)):

    result = int(round((float(input_data[n]) - 32) / 1.8))

    celsius_data.append(result)

print ' '.join(str(e) for e in celsius_data)
