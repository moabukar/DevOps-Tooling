#Python script that installs vs code extensions listed in vscode-extensions.txt 
import os
with open('vscode-extensions.txt') as f:
    for line in f:
        os.system('code --install-extension ' + line)