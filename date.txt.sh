#!/bin/bash
TXTT=subl						#default TXTTool
while getopts l:hme:a:Mt: flag
do
    case "${flag}" in
    	#date_label.ext options
		h) H="%H";;				#hours
		m) H="%H"; M="%M";;		#minutes
        l) LABEL=${OPTARG};;
		e) EXT=${OPTARG};;

		a) APPEND=${OPTARG}; TXTT="";;
		M) Ha="%H"; Ma="%M";;

		t) TXTT=${OPTARG};;
    esac
done

FILE=$(date +"%y%m%d$H$M")

if [ "$LABEL" ] 
then
	echo "label : $LABEL"
	FILE+="_$LABEL"
fi

if [ "$EXT" ] 
then
	echo "extention : $EXT"
	FILE+=".$EXT"
else
	FILE+=".txt"
fi

if [ "$APPEND" ] 
then
	echo "appdening : $APPEND"
	echo "to : $FILE"
	if [ "$Ma" ] 
	then
		echo >> $FILE
		echo "$(date +"%y%m%d$Ha$Ma")" >> $FILE
	fi

	echo $APPEND >> $FILE
fi

if [ "$TXTT" ] 
then
	echo $TXTT $FILE
	$TXTT $FILE
fi