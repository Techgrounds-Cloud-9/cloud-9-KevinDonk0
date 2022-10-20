import random

attempts = 0

randomnumber = random.randrange(0,100)

while True:

    attempts += 1

    guess = int(input("What is your guess??? :"))

    if guess < randomnumber:
        print("Your number is to low :( ")

    elif guess > randomnumber:
        print("Your number is to high :( ")

    else :
        print("Your guess is right! Your score is : ", attempts )
        break