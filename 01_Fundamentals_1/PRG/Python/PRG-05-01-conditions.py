while True:

    x = int(input("please input a number:"))

    if x <= 99:
        print(x, "Is a pretty low, isn't it ?")

    elif x >= 101:
        print("Wow!", x, "is a big number!")

    else:
        print(x, "Is a nice number indeed")
        break
