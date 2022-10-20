import random

def play():

    user_score = 0
    computer_score = 0

    while True:
        user_input = str(input("what is your guess? (rock, paper or scissors) : "))
        user_input_lower = user_input.lower()

        computer = random.choice(["rock", "paper", "scissors"])

        if user_input_lower == "rock" or user_input_lower == "paper" or user_input_lower == "scissors" :

            if user_input_lower == computer:
                
                print("It's a draw")
                continue
        
            if win(user_input_lower, computer):
                user_score += 1
                print("You won! :) Your choice was", user_input_lower, "the computers choice was", computer, "Your score is", user_score, "the computer's score is ", computer_score)
                continue
        
            #if win(computer, user_input_lower):
            computer_score += 1
            print("You lost :( Your choice was", user_input_lower, "the computers choice was", computer, "Your score is", user_score, "the computer's score is ", computer_score)
            continue

        else:

            return print("Not a valid move")

def win(player, player2):
    if (player == "paper" and player2  == "rock") or (player == "rock" and player2 == "scissors") or (player == "scissors" and player2 == "paper") :
        return True

if __name__ == "__main__":
    play()

