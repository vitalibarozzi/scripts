#!/usr/bin/env python3
# ================================================
# VimJournal v0.1.1
# ================================================
#
# Wrapper for Vim to be used as a journal.
# License: MIT
# Made by V. Barozzi (contato@oficinadodiabo.org)
#
# ================================================
import os
import time
import io
import subprocess

def main() -> None:

    date: str = time.strftime("%Y") + "." + time.strftime("%m") + "." + time.strftime("%d")  
    hour: str = time.strftime("%T")

    entriesFolder: str = os.getcwd() + "/.entries"
    entryFile: str = entriesFolder + "/" + date + ".txt"
    
    # Check if entriesfolder exist in current folder
    if not os.path.isdir(entriesFolder):
        raise IOError("Coudnt find '" + entriesFolder + "' folder. Make it manually for safety.")
    
    # Check if entryFile already exist in current entriesFolder
    if not os.path.exists(entryFile):
        # create file
        with open(entryFile, "w") as openFile:
            openFile.write(date + "\n")
    
    # Append hour to it
    with open(entryFile, "a") as openFile:
        openFile.write("\n" + hour + "\n")

    # Open vim
    subprocess.call("vim " + entryFile, shell=True)
    print("Edting done.")

if __name__ == "__main__":
	main()




