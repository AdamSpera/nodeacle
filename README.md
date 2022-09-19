# Nodeacle

_Custom automatic Oracle Cloud virtual machine configuration tool, for hosting NodeJS services._

Nodeacle is a project developed by Adam Spera at Arcadia University, computer science department as an original independent study capstone.

## Introduction

Nodeacle is a custom automatic Oracle Cloud virtual machine configuration tool for hosting NodeJS services. Nodeacle configures ip rules to expose the neccessary NodeJS services to the intenret, as well as setting up the node service automatically.

 - Automatically configure Node service worker
 - Open ports for NodeJS internet facing rules
 - Easy interchangeability with rules and files
 
Easily modify the Shell file to add custom commands to add custom imports and rules.

## Usage & Installation

Simply start up a Ubuntu Oracle Cloud virtual machine and clone Nodeacle to the initial directory (/home/ubuntu/).

Run ```./RunProgram.sh``` in the terminal to start the program.

Enter the name of your project folder and the primary node file to initiate configuration.

During the configuration proccess, be sure to accept any promts given by the installed softwares.

_Note: If you intend to clone your project repository to another directory (not /ubuntu/home/) you can chnage the node service file by editing the RunProgram.sh file._

## Contributions

Thank you to everybody who helped create the ScriptSwitch project possible!

Special mention and thanks to the following people:

- Guidance and Mentoring: Vitaly Ford

_Made by: Adam T Spera_
