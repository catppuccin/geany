#!/bin/bash
PRP="\033[01;38;5;13m"
WHT="\033[01;38;5;7m"
BL="\033[01;38;5;12m"
RD="\033[01;38;5;9m"
GRN="\033[01;38;5;10m"
PNK="\033[01;38;5;205m"
script="catppuccin.conf"
if [[ -d ${HOME}/.config/geany/colorschemes ]] && [[ -d  /usr/share/geany/colorschemes ]]; then
    status=1
elif [[ -d /usr/share/geany/colorschemes ]]; then
    status=2
elif [[ -d ${HOME}/.config/geany/colorschemes ]]; then
    status=3
else
    echo -e "${RD}It doesn't look like Geany's installed"
    exit
fi
if [[ ${status} == 1 ]]; then
    echo -e "${BL}Install ${PNK}Catppuccin ${BL}for all users${PRP}(${PNK}Requires password${PRP}) ${BL}or just ${PNK}${USER} ${WHT}?"
    echo -e "${BL}All system users ${WHT}[${PNK}1${WHT}]"
    echo -e "${BL}Just ${GRN}${USER} ${WHT}[${PNK}2${WHT}]"
    read -p "[1/2]>> " choice
    if [[ ${choice} == 1 ]]; then
        sudo cp ${script} /usr/share/geany/colorschemes/
        if [[ -f /usr/share/geany/colorschemes/${script} ]]; then
            echo -e "${GRN}Installed." 
            echo -e "${GRN}To activate the theme: ${BL}Open Geany${WHT}\n${PNK}click view tab ${WHT}>> ${PNK}Change colorscheme ${WHT}>> ${PNK}Pick ${PRP}Catppuccin ${WHT}&& ${GRN}enjoy !"
        fi
    elif [[ ${choice} == 2 ]]; then
        cp ${script} ${HOME}/.config/geany/colorschemes/
        if [[ -f ${HOME}/.config/geany/colorschemes/${script} ]]; then
            echo -e "${GRN}Installed." 
            echo -e "${GRN}To activate the theme: ${BL}Open Geany${WHT}\n${PNK}click view tab ${WHT}>> ${PNK}Change colorscheme ${WHT}>> ${PNK}Pick ${PRP}Catppuccin ${WHT}&& ${GRN}enjoy !"
        fi
    else
        echo -e "${BL}Installing for ${PNK}${USER}"
        cp ${script} ${HOME}/.config/geany/colorschemes/
        if [[ -f ${HOME}/.config/geany/colorschemes/${script} ]]; then
            echo -e "${GRN}Installed." 
            echo -e "${GRN}To activate the theme: ${BL}Open Geany${WHT}\n${PNK}click view tab ${WHT}>> ${PNK}Change colorscheme ${WHT}>> ${PNK}Pick ${PRP}Catppuccin ${WHT}&& ${GRN}enjoy !"
        fi
    fi
elif [[ ${status} == 2 ]]; then
    echo -e "${GRN}Install ${PNK}Catppuccin ${GRN}system-wide for all users"
    sudo cp ${script} /usr/share/geany/colorschemes/
    if [[ -f /usr/share/geany/colorschemes/${script} ]]; then
        echo -e "${GRN}Installed." 
        echo -e "${GRN}To activate the theme: ${BL}Open Geany${WHT}\n${PNK}click view tab ${WHT}>> ${PNK}Change colorscheme ${WHT}>> ${PNK}Pick ${PRP}Catppuccin ${WHT}&& ${GRN}enjoy !"
    fi
elif [[ ${status} == 3 ]]; then 
    echo -e "${BL}Config directory found locally for ${PNK}${USER}${WHT}."
    cp ${script} ${HOME}/.config/geany/colorschemes/
    if [[ -f ${HOME}/.config/geany/colorschemes/${script} ]]; then
        echo -e "${GRN}Installed." 
        echo -e "${GRN}To activate the theme: ${BL}Open Geany${WHT}\n${PNK}click view tab ${WHT}>> ${PNK}Change colorscheme ${WHT}>> ${PNK}Pick ${PRP}Catppuccin ${WHT}&& ${GRN}enjoy !"
    fi
fi
