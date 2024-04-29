# Test Automation using Robotframework #

## Installation ##

### MacOS  ###

1. `Install brew`
2. `open ~/.zprofile` > add `eval "$(/opt/homebrew/bin/brew shellenv)"` and save file
3. `brew install python@3.11`
4. `brew install virtualenv`
5. To set up virtual env
    5.1 go to your project
    5.2 run `virtualenv venv --python=3.11`
    5.3 run `source venv/bin/activate`
8. `pip install -r requirements.txt`
9. `deactivate` to leave virtual env

## VS code plugin ##

- `RobotCode`

## Execute Test ##

`robot tests/TC01_Checkout.robot`
