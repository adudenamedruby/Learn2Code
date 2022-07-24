data_numbers = [int(raw_input("Enter initial integer: "))]
data_sign_value = ['+']
modulo_value = 0
result = 0

while True:
    sign, num = raw_input("Enter operational data: ").split()

    if sign == '%':
        modulo_value = int(num)
        break
    else:
        data_sign_value.append(sign)
        data_numbers.append(int(num))

for n in range(0, len(data_numbers)):

    if data_sign_value[n] == '*':
        result = (result * data_numbers[n]) % modulo_value
    elif data_sign_value[n] == '+':
        result = (result + data_numbers[n]) % modulo_value

print result
