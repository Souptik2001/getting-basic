#!/bin/bash

source $(pwd)/function.sh

toggle_guake_visibility
sleep 1
#execute "script /bin/bash /dev/null"
#python3 -c 'import pty;pty.spawn("/bin/bash")'
execute "python3 -c 'import pty;pty.spawn(\"/bin/bash\")'"
ctrl z
execute "stty raw -echo;fg"
execute "reset"
sleep 1
execute "xterm"
sleep 1
execute "export TERM=xterm"