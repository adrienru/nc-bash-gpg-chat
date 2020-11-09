# nc-bash-gpg-chat
#### Motivation:
This project created to have 1-1 encrypted chat between 2 Linux machines
#### Deps:
``bash``
``gpg``
``tmux``
``netcat``
``base64``
``torsocks``

#### Example:
In first terminal:
```bash
./host_init.sh 8888 your_key
```
In second terminal:
```
./client_init.sh localhost 8888 your_key
```
---
Tested only on ArchLinux
