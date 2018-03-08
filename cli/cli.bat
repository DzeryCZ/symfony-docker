@echo off

CALL vagrant ssh -c "docker exec symphony_php_1 bash -c '%1'"