number_of_poeple = int(raw_input("How many people?\n> "))
results = []

def BMI_status(bmi):

    if bmi < 18.5:
        return "under"
    elif 18.5 <= bmi < 25.0:
        return "normal"
    elif 25.0 <= bmi < 30.0:
        return "over"
    else:
        return "obese"

for person in range(0, number_of_poeple):
    weight, height = raw_input("> ").split()

    bmi = round((float(weight) / float(height)**2), 1)

    results.append(BMI_status(bmi))

print ' '.join(results)
