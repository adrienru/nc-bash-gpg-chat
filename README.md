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


es típico cuando GPG se ejecuta en un script o en tmux, y no puede leer bien la entrada interactiva (la y que estás escribiendo), porque espera la respuesta por stdin de otra forma.

🔴 En resumen:
Aunque tú escribes y, GPG no la “capta” correctamente dentro del script (porque es un entorno automatizado)
```
gpg --edit-key ed@chat.local
```
2. Dentro del prompt de GPG, escribe:
```
trust
```

1 = No confío en absoluto
2 = Confío marginalmente
3 = Confío plenamente
4 = Confío definitivamente
5 = Confío en última instancia

```
👉 Elige: 5 y presiona Enter
```
3. Luego:
quit
Responde y si pregunta guardar los cambios.

iniciar hots:
```
./host_init.sh 1337 ed@chat.local
```

en cliente
```
./client_init.sh 100.72.157.52 1337 ed@chat.local
```

1. 📥 Copia secretkey.asc a la máquina destino
Ejemplo: usando USB, scp, o simplemente descargándola si la tienes en la nube (con cuidado).

2. 📂 Importa la clave secreta

```
gpg --import secretkey.asc
```

3. ✅ Verifica que se importó correctamente
```
gpg --list-secret-keys
```

