#!/usr/bin/env python3
# ================================================
# LangFight v0.1.1
# ================================================
#
# Toy script for discovering witch language do you prefer over others.
# Feel free to add your own ont the list.
# License: MIT
# Made by V. Barozzi (contato@oficinadodiabo.org)
#
# ================================================

_list_: list = [ "JavaScript",
                 "TypeScript",
                 "C",
                 "Erlang",
                 "Elixir",
                 "Haskell",
                 "Rust",
                 "Elm",
                 "Shell Script",
                 "PHP",
                 "Python"
                 ]

# Ask user to choose witch one he/she prefers
def ask(optionA, optionB): 
    print("Witch language would you prefer to be working on?");
    print("1)", optionA);
    print("2)", optionB);
    answer = input();
    if answer == '1':
        return optionA
    elif answer == '2':
        return optionB
    else:
        print("Invalid option.")
        return ask(optionA, optionB)

# Will compare individual pairs
def compare(string, strList):
    if len(strList) == 1:
        return [ask(string, strList[0])]
    else:
        return [ask(string, strList[0])] + compare(string, strList[1:])

# Will compare one language with all the others
def judge(langList):
    if len(langList) == 2:
        return compare(langList[0], langList[1:])
    else:
        return compare(langList[0], langList[1:]) + judge(langList[1:])

# Will print score for each language
def showScore(rawList, judgedList):
    if len(rawList) == 1:
        print(rawList[0], "->", judgedList.count(rawList[0]))
    else:
        print(rawList[0], "->", judgedList.count(rawList[0]))
        showScore(rawList[1:], judgedList)

if __name__ == "__main__":
         showScore(_list_, judge(_list_))
