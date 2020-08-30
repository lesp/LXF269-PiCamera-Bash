#!/bin/bash
gpio mode -g 17 input
array[0]="none"
array[1]="negative"
array[2]="solarise"
array[3]="sketch"
array[4]="denoise"
array[5]="emboss"
array[6]="oilpant"
array[7]="hatch"
array[8]="gpen"
array[9]="pastel"
array[10]="watercolour"
array[11]="film"
array[12]="blur"
array[13]="saturation"
array[14]="colourswap"
array[15]="washedout"
array[16]="posterise"
array[17]="colourpoint"
array[18]="colourbalance"
array[19]="cartoon"
size=${#array[@]}
while true; do
  PINSTATE=”$(gpio -g read 17)”
  if [ ${PINSTATE} = “1” ]; then
    index=$(($RANDOM % $size))
    echo ${array[$index]}
    raspistill -k  -ifx ${array[$index]}
    fi
done


