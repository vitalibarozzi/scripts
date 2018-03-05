#!/usr/bin/env python3
# ================================================
# LangFight v0.1.1
# ================================================
#
# Script for discovering witch language do you prefer currently
# Written pure functional
# License: MIT
# Made by V. Barozzi (contato@oficinadodiabo.org)
#
# ================================================

_list_: list = [ "JavaScript",
                 "TypeScript",
		 "C",
                 "C++",
                 "Java",
                 "Haskell",
                 "Rust",
                 "Go",
                 "Elm",
                 "Shell Script",
                 "PHP",
                 "LISP",
                 "Python"
                 ]

# String -> String -> String
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

# String -> [String] -> [String]
# Will compare individual pairs
def compare(string, strList):
    if len(strList) == 1:
        return [ask(string, strList[0])]
    else:
        return [ask(string, strList[0])] + compare(string, strList[1:])

# [String] -> [String]
# Will compare one language with all the others
def judge(langList):
    if len(langList) == 2:
        return compare(langList[0], langList[1:])
    else:
        return compare(langList[0], langList[1:]) + judge(langList[1:])

# [String] -> [String] -> IO ()
# Will print score for each language
def showScore(rawList, judgedList):
    if len(rawList) == 1:
        print(rawList[0], "->", judgedList.count(rawList[0]))
    else:
        print(rawList[0], "->", judgedList.count(rawList[0]))
        showScore(rawList[1:], judgedList)


showScore(_list_, judge(_list_))

