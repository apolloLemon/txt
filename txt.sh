#!/bin/bash
DATED=true
FILE=""
TXTT=subl						#default TXTTool
while getopts l:L:N:hme:a:Mt: flag
do
    case "${flag}" in
    	#date_label.ext options
		h) H="%H";;				#hours
		m) H="%H"; M="%M";;		#minutes
        l) LABEL="_${OPTARG}";;
			L) LABEL="${OPTARG}"; DATED=false;;
		e) EXT=${OPTARG};;

		a) APPEND=${OPTARG}; TXTT="";;
			M) Ha="%H"; Ma="%M";;

		t) TXTT=${OPTARG};;
    esac
done

if $DATED 
then
	FILE+=$(date +"%y%m%d$H$M")
else 
	echo "not dated"
fi

if [ "$LABEL" ] 
then
	echo "label : $LABEL"
	FILE+="$LABEL"
fi

if [ "$EXT" ] 
then
	echo "extention : $EXT"
	FILE+=".$EXT"
else
	FILE+=".txt"
fi

if [ "$Ma" ] 
then
	echo >> $FILE
	echo "$(date +"%y%m%d$Ha$Ma")" >> $FILE
fi

if [ "$APPEND" ]
then
	echo "appdening : $APPEND"
	echo "to : $FILE"
	echo $APPEND >> $FILE
fi

if [ "$TXTT" ] 
then
	echo $TXTT $FILE
	$TXTT $FILE
fi