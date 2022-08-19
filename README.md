# Nemo Copy Path Action

This extension allows you to copy path of anything you selected (must be single selection) to clipboard. 

## Why There's An Action To Do This?

To copy something's path you may copy file directly, but it gives you files itself.
Yes, you can paste it like a string but not on everywhere.
There's another way and it's copying current directory and merging it with files name which you can get it by entering rename mode.
But you can't rename files you have no access. So you can use this extension to get file path everytime. 

## Installation

1. Install dependencies first.

    * Install `xclip` on your system.

2. Install this action.
    * First way: Download or clone this repo and run **./install.sh** file.
    
    * Second way: Just run this command below. (Dependencies still required.)

```
sudo wget https://raw.githubusercontent.com/Elagoht/nemo-copy-path/main/copypath.nemo_action -O /usr/share/nemo/actions/copypath.nemo_action
```
