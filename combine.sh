#BashScript1 HW שאלה 1
#מאגד קבצים לקובץ אחד 

#!/bin/bash

wd="/home/noynawy/one" #כותבים איפה אני נמצאת 
out=$1

if [ -e "$wd/$out" ]; then # בודק האם הקובץ קיים ואם כן הוא יוצא וזורק שגיאה 
echo "out put all ready exists"
exit 1
fi
touch $wd/$out #יוצר קובץ חדש ומחבר את הקובץ הקודם 
if [ $# -lt 3 ]; then
echo "not enap files"
exit 1
fi

x=2
for file in "${@:2}"; do 
if [ ! -e "$wd/$file" ]; then 
echo "$x files dont exist"
exit 1
fi
x=x+1
echo "$wd/$file - number of lines: $(wc -l < $wd/$file)">> $wd/$out
cat "$wd/$file" >> $wd/$out
done

# לבדיקה הקוד לוקח קובץ חדש ומאגש אליו עוד קבצים וכדי לבדוק שהוא עובד עושים 
#chmod +x combine.sh
#./combine.sh new.txt u.txt x.txt
