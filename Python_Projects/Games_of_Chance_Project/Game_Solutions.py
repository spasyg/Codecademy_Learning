import random

money = 100


#Write your game of chance functions here

# 1. Tossing a coin

def cointoss(call, bet):
  global money
  res = random.randint(1,2)
  heads = 1
  tails = 2

  print("The random coin toss returned " + str(res) + " (1 = heads; 2 = tails)")
  if res == heads:
    if call == heads:
        print("You called heads and the toss was also heads")
        print("You have won £" + str(bet))
        money += bet
    elif call == tails:
        print("You called tails but the toss was heads")
        print("You have lost £" + str(bet))
        money -= bet
  elif res  == tails:
    if call == heads:
        print("You called heads but the toss was tails")
        print("You have lost £" + str(bet))
        money -= bet
    elif call == tails:
        print("You called tails and the toss was also tails")
        print("You have won £" + str(bet))
        money += bet



# 2. Cho Han Dice Game

def cho_han(guess, bet):
  global money
  dice = random.randint(2,12)


  print("The random roll of two dice returned " + str(dice))
  if guess == 0:
    if dice % 2 == 0:
      print("You called even and the total roll was " + str(dice) + " (even)")
      print("You have won £" + str(bet))
      money += bet
    elif dice % 2 != 0:
      print("You called even but the total roll was " + str(dice) + " (odd)")
      print("You have lost £" + str(bet))
      money -= bet
  elif guess == 1:
    if dice % 2 != 0:
      print("You called odd and the total roll was " + str(dice) + " (odd)")
      print("You have won £" + str(bet))
      money += bet
    elif dice % 2 == 0:
      print("You called odd but the total roll was " + str(dice) + " (even)")
      print("You have lost £" + str(bet))
      money -= bet

# 3. Card game



def card_game(bet):
  global money
  cards = list(range(1,53))
  card_pick_1 = random.randint(1,52)
  cards.remove(card_pick_1)
  card_pick_2 = random.choice(cards)
  card_value_1 = card_pick_1 % 13
  card_value_2 = card_pick_2 % 13

  print("Cards are initially numbered from hearts (Two = 1 and Ace = 13), to spades (Two = 14 and Ace = 26), to clubs (Two = 27 and Ace = 39), to diamonds (Two = 40 and Ace = 52)")
  print("Cards are then valued irrespective of suit as 1 (a Two) to 13 (an Ace)")
  print("The card picked by player one (you) is " + str(card_pick_1) + ". Card vaule is " + str(card_value_1))
  print("These are all the cards after player one has picked: " + str(cards))
  print("The card picked by player two (your opponent) is " + str(card_pick_2) + ". Card vaule is " + str(card_value_2))
  if card_value_1 > card_value_2:
    print("Your card had the value of " + str(card_value_1) + " and the other player's card had the value of " + str(card_value_2))
    print("You have won £" + str(bet))
    money += bet
  elif card_value_2 > card_value_1:
    print("Your card had the value of " + str(card_value_1) + " and the other player's card had the value of " + str(card_value_2))
    print("You have lost £" + str(bet))
    money -= bet
  else:
    print("Your card had the value of " + str(card_value_1) + " and the other player's card had the value of " + str(card_value_2))
    print("The game is a tie so you have not won or lost any money")

# 4. American Roulette
# Here 37 is double zero, 38 is even and 39 is odd

def roulette(guess,bet):
  global money
  roulette_roll = random.randint(0,37)

  print("This is the number generated for the roulette roll: " + str(roulette_roll) + " (37 is 00)")
  if roulette_roll == guess:
    print("You have won " + str(bet*35) + " because " + str(roulette_roll) + " has come up and you guessed " + str(guess))
    money += bet*35
  elif guess == 39:
    if roulette_roll == 37:
      print("You have lost because " + str(roulette_roll) + " has come up and you guessed " + str(guess) + " (odd)")
      money -= bet
    elif roulette_roll % 2 != 0:
      print("You have broken even because " + str(roulette_roll) + " has come up and you guessed " + str(guess) + " (odd)")
    else:
      print("You have lost because " + str(roulette_roll) + " has come up and you guessed " + str(guess) + " (odd)")
      money -= bet
  elif guess == 38:
    if roulette_roll == 0:
      print("You have lost because " + str(roulette_roll) + " has come up and you guessed " + str(guess) + " (even)")
      money -= bet
    elif roulette_roll % 2 == 0:
      print("You have broken even because " + str(roulette_roll) + " has come up and you guessed " + str(guess) + " (even)")
    else:
      print("You have lost because " + str(roulette_roll) + " has come up and you guessed " + str(guess) + " (even)")
      money -= bet
  else:
    print("You have lost since " + str(roulette_roll) + " has come up and you guessed " + str(guess))
    money -= bet


#Example of round of games

##################
# Play coin Toss
###################
print("Coin toss game...")
while True:
  try:
      call = int(input('Please guess a coin toss: 1 for heads, 2 for tails: '))
      if call < 1 or call > 2:
          raise ValueError #this will send it to the print message and back to the input option
      break
  except ValueError:
      print("Invalid input. The guess must be either 1 (heads) or 2 (tails)! Try again")
while True:
  try:
      bet = int(input('Please decide how much to bet in whole pounds (up to amount you have available): '))
      if bet > money or bet < 0:
          raise ValueError #this will send it to the print message and back to the input option
      break
  except ValueError:
      print("Invalid input. You cannot bet more money than you have and you cannot bet a negative value! Try again")

cointoss(call, bet)
print("You now have £" + str(money))



##################
# Play cho han
###################
print("Cho Han dice game...")
while True:
  try:
      guess = int(input('Please guess the total dice roll: 1 for odd, 0 for even: '))
      if guess < 0 or guess > 1:
          raise ValueError #this will send it to the print message and back to the input option
      break
  except ValueError:
      print("Invalid input. The guess must be either 1 (odd) or 0 (even)! Try again")
while True:
  try:
      bet = int(input('Please decide how much to bet in whole pounds (up to amount you have available): '))
      if bet > money or bet < 0:
          raise ValueError #this will send it to the print message and back to the input option
      break
  except ValueError:
      print("Invalid input. You cannot bet more money than you have and you cannot bet a negative value! Try again")

cho_han(guess,bet)
print("You now have £" + str(money))

##################
# Play card game
###################
print("Card game...")
while True:
  try:
      bet = int(input('Please decide how much to bet in whole pounds (up to amount you have available): '))
      if bet > money or bet < 0:
          raise ValueError #this will send it to the print message and back to the input option
      break
  except ValueError:
      print("Invalid input. You cannot bet more money than you have and you cannot bet a negative value! Try again")

card_game(bet)
print("You now have £" + str(money))

##################
# Play roulette
###################
print("Roulette roll...")
while True:
  try:
      guess = int(input('Please guess the roulette outcome: 0 for zero, 37 for double zero, 1-36 for exact number, 38 for even, 39 for odd): '))
      if guess < 0 or guess > 39:
          raise ValueError #this will send it to the print message and back to the input option
      break
  except ValueError:
      print("Invalid input. The guess must be either 0 (zero), 37 (double zero), 1-36 (exact number), 38 (even) or 39 (odd)! Try again")
while True:
  try:
      bet = int(input('Please decide how much to bet in whole pounds (up to amount you have available): '))
      if bet > money or bet < 0:
          raise ValueError #this will send it to the print message and back to the input option
      break
  except ValueError:
      print("Invalid input. You cannot bet more money than you have and you cannot bet a negative value! Try again")

roulette(guess, bet)
print("You now have £" + str(money))
