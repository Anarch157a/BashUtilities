#!/bin/bash
#===============================================================================
#
#          FILE:  colorify.sh
#        AUTHOR:  Bento Loewenstein (), comercial@ninjazumbi.com
#       CREATED:  04/13/2017 06:51:15 PM UTC
#       LICENSE:  GNU GPL 3.0 or above
#
#===============================================================================

declare -A ATTRIBS

ATTRIBS["RS"]=0
ATTRIBS["BO"]=1
ATTRIBS["IT"]=3
ATTRIBS["UN"]=4
ATTRIBS["FL"]=5
ATTRIBS["IN"]=7

ATTRIBS["BK"]=30
ATTRIBS["RE"]=31
ATTRIBS["GR"]=32
ATTRIBS["YE"]=33
ATTRIBS["BL"]=34
ATTRIBS["MA"]=35
ATTRIBS["CY"]=36
ATTRIBS["WH"]=37

pprint() {

# %%BO = bold; %%IT = italic; %%UN = underline; %%FL = flashing (blink); %%IN = inverted

    local STR="$@"
    local BACK="N"
    local LIGHT="N"

    while [[ "${STR}" == *"%%"* ]]
    do
        [[ "$STR" =~ %%.. ]]
        COD=${BASH_REMATCH[0]##%%}
        case $COD in
            FG)
                BACK="N"
                STR=${STR/"${BASH_REMATCH[0]}"/}
                ;;
            BG)
                BACK="Y"
                STR=${STR/"${BASH_REMATCH[0]}"/}
                ;;
            NO)
                LIGHT="N"
                STR=${STR/"${BASH_REMATCH[0]}"/}
                ;;
            LI)
                LIGHT="Y"
                STR=${STR/"${BASH_REMATCH[0]}"/}
                ;;
            RS|BO|IT|UN|FL|IN)
                ATT=${ATTRIBS["$COD"]}
                STR=${STR/"${BASH_REMATCH[0]}"/\\033[${ATT}m}
                ;;
            BK|RE|GR|YE|BL|MA|CY|WH)
                ATT=${ATTRIBS["$COD"]}
                [[ $BACK == "Y" ]] && ATT=$((ATT+10))
                [[ $LIGHT == "Y" ]] && ATT=$((ATT+60))
                STR=${STR/"${BASH_REMATCH[0]}"/\\033[${ATT}m}
                ;;
            *)
                STR=${STR/"${BASH_REMATCH[0]}"/}
                ;;
        esac
    done
    echo $STR
}

if [ "${BASH_SOURCE[0]}" != "${0}" ]
then
    return 0
fi

PARAMS="$@"

printf "$(pprint $PARAMS)\n"
