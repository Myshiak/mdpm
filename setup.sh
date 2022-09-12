#!/usr/bin/bash
program=mdpm
pdir="/usr/bin"
go=$(uname -o)
cpmv=cp
[[ $go == "Android" ]] && pdir="$PREFIX/bin"
if [[ $1 == "install" ]]
then
    [[ $2 == "clean" ]] && cpmv=mv
    printf "Copying $program to $pdir... "
    $cpmv $program $pdir && echo "done" && \
    printf "Making $program executable... " && \
    chmod +x $pdir/$program && echo "done" && \
    echo "Installed"
elif [[ $1 == "uninstall" ]]
then
    if [[ -e $pdir/$program ]]
    then
        printf "Removing $program from $pdir... "
        ! [[ -e $PWD/$program ]] && cp $pdir/$program $PWD
        rm $pdir/$program && echo "done" && \
        echo "Uninstalled"
    else
        echo "$program is not installed"
    fi
else
    echo "setup.sh install         installing"
    echo "setup.sh install clean   installing and removing $program from $PWD"
    echo "setup.sh uninstall       uninstalling"
fi
