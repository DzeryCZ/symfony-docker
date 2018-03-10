@echo off

CALL vagrant ssh -c "sudo docker exec symfonydocker_php_1 bash -c 'composer %1 -d=/application'"