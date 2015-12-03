#!/usr/bin/env python3

#######################
#    Setup Script     #
#######################

import os
import sys
import shutil
import platform
import subprocess
import winreg

######## GLOBALS #########
MAINDIR = ""
PROJECTDIR = "XLA_FixedArsenal"
A3DIR = "P:\\a3"
##########################

def main():
    FULLDIR = "{}\\{}".format(MAINDIR,PROJECTDIR)
    print("""
  ######################################
  #    Development Environment Setup   #
  ######################################

  This script will create your dev environment for you.
  
  Before you run this, you should already have:
    - A properly set up P-drivey
    - The P:\\a3 folder containing the unpacked pbo's from vanilla arma3

  If you have not done those things yet, please abort this script in the next step and do so first.
  
  This script will create three hard links on your system
    [Arma 3 installation directory]{} => mod project folder
    P:{}                              => mod project folder
    {}\\addons\\a3                      => P:\\a3
  """.format(FULLDIR, FULLDIR, FULLDIR))

    try:
        reg = winreg.ConnectRegistry(None, winreg.HKEY_LOCAL_MACHINE)
        key = winreg.OpenKey(reg,
                r"SOFTWARE\Wow6432Node\bohemia interactive\arma 3")
        armapath = winreg.EnumValue(key,1)[1]
    except:
        print("Failed to determine Arma 3 Path.")
        return 1

    if not os.path.exists("P:\\"):
        print("No P-drive detected.")
        return 2

    scriptpath = os.path.realpath(__file__)
    projectpath = os.path.dirname(os.path.dirname(scriptpath))
    addonpath = os.path.join(projectpath, "addons")

    print("# Detected Paths:")
    print("  Arma Path:    {}".format(armapath))
    print("  Project Path: {}".format(projectpath))
    print("  Addons Path:  {}".format(addonpath))

    repl = input("\nAre these correct? (y/n): ")
    if repl.lower() != "y":
        return 3

    print("\n# Creating links ...")





    try:
        if not os.path.exists("P:\\{}".format(MAINDIR)):
            os.mkdir("P:\\{}".format(MAINDIR))
        if not os.path.exists(os.path.join(armapath, MAINDIR)):
            os.mkdir(os.path.join(armapath, MAINDIR))

        if platform.win32_ver()[0] == "7":
            if os.path.exists("P:\\{}\\{}".format(MAINDIR,PROJECTDIR)):
                print("Link on P: already exists.")
            else:
                subprocess.call(["cmd", "/c", "mklink", "/D", "P:\\{}\\{}".format(MAINDIR,PROJECTDIR), projectpath])
            if os.path.exists(os.path.join(armapath, MAINDIR, PROJECTDIR)):
                print("Link in Arma directory already exists.")
            else:
                subprocess.call(["cmd", "/c", "mklink", "/D", os.path.join(armapath, MAINDIR, PROJECTDIR), projectpath])
            if os.path.exists(os.path.join(addonpath, "a3")):
                print("Link to P:\\a3 already exists inside addons folder.")
            else:
                subprocess.call(["cmd", "/c", "mklink", "/D", os.path.join(addonpath, "a3"), A3DIR])
        else:
            if os.path.exists("P:\\{}\\{}".format(MAINDIR,PROJECTDIR)):
                print("Link on P: already exists.")
            else:
                subprocess.call(["cmd", "/c", "mklink", "/D", "/J", "P:\\{}\\{}".format(MAINDIR,PROJECTDIR), projectpath])
            if os.path.exists(os.path.join(armapath, MAINDIR, PROJECTDIR)):
                print("Link in Arma directory already exists.")
            else:
                subprocess.call(["cmd", "/c", "mklink", "/D", "/J", os.path.join(armapath, MAINDIR, PROJECTDIR), projectpath])
            if os.path.exists(os.path.join(addonpath, "a3")):
                print("Link to P:\\a3 already exists inside addons folder.")
            else:
                subprocess.call(["cmd", "/c", "mklink", "/D", "/J", os.path.join(addonpath, "a3"), A3DIR])

    except:
        raise
        print("Something went wrong during the link creation. Please finish the setup manually.")
        return 6

    print("# Links created successfully.")
    return 0


if __name__ == "__main__":
    exitcode = main()

    if exitcode > 0:
        print("\nSomething went wrong during the setup. Make sure you run this script as administrator. If these issues persist, please perform the setup manually.")
    else:
        print("\nSetup successfully completed.")

    input("\nPress enter to exit ...")
    sys.exit(exitcode)
