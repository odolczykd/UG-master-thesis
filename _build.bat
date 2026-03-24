@ECHO OFF

SET FILE=inz

CHOICE /T 3 /N /D n /c YN /m "Delete old build files? [YN]"
IF %ERRORLEVEL% NEQ 1 GOTO generate
ECHO Deleting old build files
DEL *.aux
DEL *.bbl
DEL *.blg
DEL *.log
DEL *.out
DEL *.toc
DEL *-eps-converted-to.pdf

TIMEOUT /T 3

:generate

pdflatex %FILE% --shell-escape
TIMEOUT /T 1

bibtex %FILE%
TIMEOUT /T 3

pdflatex %FILE% -shell-escape
TIMEOUT /T 1

pdflatex %FILE% -shell-escape
TIMEOUT /T 10


