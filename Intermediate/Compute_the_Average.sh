read n 
x=1
y=0
while [ $x -le $n ]
do 
read z 
y=$((y + z))
x=$((x + 1))
done
printf %.3f $(echo $y/$n | bc -l)
