@echo off

IF "%1"=="" GOTO :HELP

CALL vagrant ssh -c "sudo docker exec symfonydocker_web_1 bash -c 'service nginx %1'"
GOTO END

:HELP
echo "This command is for starting stopping or reloading nginx service"
echo "Usage: nginx_service.bat start | stop | reload"

:END