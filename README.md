# Poker Hand Evaluator

## Index
* [Challenge](#Challenge)
* [About the code](#About)
* [Installation](#Install)
* [Testing with minitest](#minitest)
* [Usage](#Usage)

## <a name="Challenge">Challenge</a>

* The task is to create a Poker Hand Evaluator that accepts a list of poker hands and categorises them into their best scoring category.

### Acceptance criteria

* Your solution will be scored according to whether or not your code works (i.e. passes all tests). If your code passes all tests, general code quality will also be assessed
* Test suites have been provided. You may add your own additional tests if you wish, but your code will be assessed against a pristine version of the test suite, so you should **not** change the existing test suite expectations

## <a name="About">About the code</a>

### My Approach:
* **TDD** - My approach was to use TDD to guide my code, I ran the PART_1 and PART_1b test suite in its entirety to make sure everything was working and from there ran each test in isolation starting with the simplest in complexity and working my way to the hardest. I would use the red-green-refactor method to keep my code quality high. When I was satisfied with my refactor and my test was passing I would commit.
* **SRP** - Early on I decided to create a PokerHand class that would do all the logic and heavy lifting, freeing up my PokerHandEvaluator class to simply handle output. I feel like this is inline with the single responsibility principle, each class having a specific role.

### Methods (of note) used
* **hand_classifications** - Located in PokerHandEvaluator this method iterates through the hands its passed as arguments creating objects for each of them. The calculate_hand method is then called on each hand object returning the appropriate string that tells you what the hand evaluates too.
* **calculate_hand** - Located in PokerHand this method calls separate_ranks_and_suits which separates ranks and suits into arrays that can then be manipulated by various other 'poker' methods to check what value the input relates to, e.g 'ONE_PAIR'
* **select** - Elements can be selected from an array according to criteria defined in a block. The selection can happen in a destructive or a non-destructive manner. While the destructive operations will modify the array they were called on, the non-destructive methods usually return a new array with the selected elements, but leave the original array unchanged.
* **uniq** - Returns a new array by removing duplicate values.
* **each_cons().all?** - This method checks if a sequence of numbers is contiguous. each_cons gives you sub-arrays of size n, so if you have [1,2,3], then each_cons(2) will give you [[1,2], [2,3]]. this can then be compared to make sure all the numbers in an array are ascending by 1 and a straight can be validated.

### Custom error class
In order to get the tests passing for poker_hand_evaluator_PART_1b_test.rb I had to implement a custom error class in poker_hand_evaluator.rb. As this was my first time using **minitest** it took me a while to figure out the syntax and structure of how to implement this. with the help of Adam and Ruben (Resolver) who gave me some very constructive feedback I was able to figure it out and get all tests passing, for both poker_hand_evaluator_PART_1_test.rb and poker_hand_evaluator_PART_1b_test.rb.

## <a name="Install">Installation</a>
* To clone the repo:
```shell
$ git clone https://github.com/Clifford2910/poker_hands.rb.git
$ cd poker_hands.rb
```

## <a name="minitest">Testing with minitest</a>
* To test the repo:
```shell
$ cd poker_hands.rb
$ ruby ./poker_hand_evaluator_PART_1_test.rb
$ ruby ./poker_hand_evaluator_PART_1b_test.rb
```

## <a name="Usage">Usage</a>
* In command line:
```shell
$ ruby CL_poker_hand_evaluator.rb 'ARGUMENT'
```

* Pass in a relevant parameter as an 'ARGUMENT' (poker hand as a string - e.g "0D JD QD KD AD") you can also pass multiple strings as arguments
```shell
$ ruby CL_poker_hand_evaluator.rb "0D JD QD KD AD"
```

* Example input / output showing what my app looks like
```
Makerss-MBP-8:poker_hands.rb student$ ruby CL_poker_hand_evaluator.rb "JC JS JD 6D 6H"
You inputted:
JC JS JD 6D 6H
Results:
FULL_HOUSE
Makerss-MBP-8:poker_hands.rb student$ ruby CL_poker_hand_evaluator.rb "9H 9S 9D 9C 2S"
You inputted:
9H 9S 9D 9C 2S
Results:
FOUR_OF_A_KIND
Makerss-MBP-8:poker_hands.rb student$ ruby CL_poker_hand_evaluator.rb "8H 8S 4S 7D 7C" "QD KD AD 3D 2D"
You inputted:
8H 8S 4S 7D 7C
QD KD AD 3D 2D
Results:
TWO_PAIR
FLUSH
Makerss-MBP-8:poker_hands.rb student$ ruby CL_poker_hand_evaluator.rb "7H 7S 4H 8D 5D" "5S 4D 3S 2H AC" "AH KH QH JH 0H"
You inputted:
7H 7S 4H 8D 5D
5S 4D 3S 2H AC
AH KH QH JH 0H
Results:
ONE_PAIR
STRAIGHT
ROYAL_FLUSH
Makerss-MBP-8:poker_hands.rb student$
```
