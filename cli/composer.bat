@echo off

CALL vagrat ssh -c "docker exec symphony_php_1 bash -c 'composer %1 -d=/application'"