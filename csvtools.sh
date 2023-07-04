##BashScript1 HW שאלה2

#!/bin/bash
itr=0
file=$1
while true
do
itr=$itr+1
echo "-------------------------------------------------------------------------"
echo "Menu:"
echo "1. Display all CSV DATA"
echo "2. Read user input for new row"  
echo "3. Read Specie (OT for example) And Display all Items of that specie and the AVG of that specie"
echo "4. Read Specie sex (M/F) and display all items of specie-sex"
echo "5. Save last output to new csv file" 
echo "6. Delete row by index"
echo "7. Exit"

read -p "Enter your choice (1-7): " choice

case $choice in 
1) 
echo "Displaying all csv data"
output="$(cat $file)"
echo -e "$output"
;;

2)
echo "Read new row"
read -p " Enter new row data:" new
echo $new >> $file
output="$(cat $file)"
echo -e "$output"
;;

3)
echo "Read Specie"
read -p "Enter specie:" specie
echo "All rows that contien that specie:"
output="$(head -n 1 "$file")"$'\n'
output+="$(grep "$specie" "$file")"$'\n'
output+="$(echo "Mean of the Weight:")"$'\n'
output+=$(grep $specie $file| cut -d ',' -f 4 | awk '{ sum += $1; count++ } END {print sum / count }')
echo -e "$output"

;;

4)
echo "Read Specie-sex"
read -p "Enter specie:" specie
read -p "Enter sex (M/F):" sex
echo "All rows that contien that specie and sex:"
output="$(grep $specie $file | grep $sex)"
echo -e "$output"
;;

5)
if  [[ itr -eq 1 ]]; then
echo " this is the first run the is nothig to show"
else
read -p "name the new csv: " new_file
if [[ -f $new_file ]]; then
echo "file already exist"
else
touch "./$new_file"
echo -e "$output" > "./$new_file"
fi
fi
;;

6)
echo "Delete row by index"
cat $file
read -p "Enter row index to delete:" ind
if [[ $ind -le $(wc -l < $file) ]]; then
sed -i "${ind}d" "$file"
output="$(cat $file)"
echo -e "$output"
fi
;;

7)
echo "Exit..."
exit
;;

*)
echo "Invalid choice. Please enter a number between 1 and 7."
itr=$itr-1
;;

esac
done
#chmod +x csvtools.sh  
#./csvtools.sh שם הקובץ.csv 