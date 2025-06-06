
# Règles de base

## Echo

`>echo test` -> terminal renvoie test

`@echo off` début programme -> renvoie résultats sans les commandes 

## Programm krts.bat (extension nécessaire pour batch)

`go to nomNouveauPgm`
`:nomNouveauPgm` -> Déclarer nouveau programme
echo Bonjour -> renvoie Bonjour
`echo.` -> faire un saut de ligne
`echo 1 - PING`
`echo 2 - Empty`
`echo 3 - Quit`
`echo.` 
`set choiceinput=` 
`set /p choiceinput=Faire un choix:` 

## Test prompt terminal

`>set age=18` -> affecter valeur à variable
`>echo %age%` -> terminal renvoie 18

`>krts.bat`
Bonjour

1 - PING
2 - Empty
3 - Quit

Faire un choix: -> Taper choix (exemple : 1 choiceinput affectée)

`set choiceinput=` 
`set /p choiceinput=` 

`if %choiceinput%==1 goto choice1`
`if %choiceinput%==2 goto choice2`
`if %choiceinput%==3 goto exit`



:choice1
cls -> clean terminal
set adresse=
set /p adresse= Entrer une adresse (www.google.fr):
ping -4 -n 3 %adresse%
echo.
pause
cls
goto start

:choice2
cls
timeout /t 5
echo.
echo Vidage cache DNS en cours
echo.
ipconfig /flushdns
echo.
timeout /t 5
echo.
echo ...
echo.
echo Succes.
echo.
pause
cls
goto start

:exit
color F
cls
exit /b quitter pgm sans quitter interface


# PING
`>ping /?` -> infos help pour ping

