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
Firstly:
```bash
./host_init.sh host_port client_key
```
Secondly:
```
./client_init.sh host_addr host_port host_key
```
---
Tested only on ArchLinux
