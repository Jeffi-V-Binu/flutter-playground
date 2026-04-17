# BIRDLE
    This is a simple implemntation of a wordle learning project from the flutter leerning pathway
    [Check out the official page](https://docs.flutter.dev/learn/pathway/tutorial/create-an-app)
-----------------------------------------------------------------------------------------------------------------------------------------------
## 🏗 Understanding the structure
     📁 Files :
        Game.dart:
            This file handles the core logic of the game.

            Imports :
                dart:math
                dart:collections

            Global Variables =>
               * allLegalGuesses  .. this is all legalWords along with legalGuesses.
               * defaultNumGuesses  .. a default value that can be given to the game when creating an instance of it.
               * HitType  .. the different hit types to be mapped for each letter of a guess.
               * Letter  .. a typedef holding a char with its hit type.
               * legalWords  .. this is the list of all legal words that can be the answer to the game.
               * legalGuesses  .. this is the list of all the legal words the user can input to the game.
            Enums =>
               * HitType  .. the different hit types to be mapped for each letter of a guess.
            Deftype =>
               * Letter  .. a recording holding a char with its hit type.

            Classes =>
               * Game :   This class defines and manages the states of the game, inlcluding the current word , max guesses etc.
               * Word :   This class defines the "word" and its states like validity and correctness.
            
            Attributes =>
                Game :
                   * numAllowedGuesses  .. this is the number of allowed guesses.
                   * _guesses  .. this is a list that holds all the guesses made by the user.
                   * _wordToGuess  .. this is the word that the user has to find.
                   * seed .. this is the value that's used to set the word to be guesses.

                Word :
                   * _letters  .. this is a list having each element a Letter (char and its hit type) of the word.

            Methods =>
                Game :
                   * Game  .. this constructor initialises the values for numAllowedGuesses to the default value if null value passed and to choose random seed if none is passed.
                   * Getter methods :
                               - hiddenWord .. to get the word to be guessed.
                               - guesses  .. to get a list of all guesses made.
                               - previousGuess .. to get the previous guess made.
                               - activeIndex ..to get the index of the very next empty spot on the _guesses list.
                               - guessesRemaining  .. to get the number of remaining guesses.
                               - didWin .. to check if the player won.
                               - didLose .. to check if the player lost.
                   * resetGame .. to restart the game.
                   * guess ..to make a guess and add it to the _guesses list if it's legal and return the hit types for each letter of the guess.
                   * isLegalGuess .. to check is the guess made is a valid word.
                   * matchGuessOnly .. to call the eveluteGuess function on the word to be guessed with the guess made and return the list of hit types for each letter of the guess.
                   * addGuessToList .. to add the guess made to _guesses list.

                Word :
                   * Word .. this constructor initialise the _letters variable.
                   * factory:
                       - .Empty .. makes the opbject empty.
                       - .fromString .. to create a word from a string with null hit type for all the letters.
                       - .random .. to choose the next word to be guessed randomly.
                       - .fromSeed .. to choose the next word to be guessed from seed value.
                   * override:
                       - toString .. to remove the hit type linked to each letter and to join it back to a word.
                       - Getter :
                            iterator .. to get an iterator to iterate over the _letters.
                            isEmpty .. to check is the word is empty.
                            isNotEmpty .. to check if the word is not empty.
                   * operator overLaoding:
                       - [] .. to access the _letters using index.
                       - []= .. to write to the _letters using index.
                   * toStringVerbose .. to get the letter in 'char - hit type' format with each letter in a single line for CLI implementation.

                WordUtils on Word :
                   * isLegaGuess .. to check if the guess made is legal by checking if it exist in allLegalGuesses list.
                   * evaluateGuess .. this works as core logic of the guess evaluation to mark all hit , miss ,partial etc.