#קוד שמעלה את כל הקבצים בתיקיה לגיט לא לשכוח לשנות את הכתובת שהוא יתן 
# לעשות clone לכתובת שהוא נותן 
# chmod +x push.sh
#./push.sh https://github.com/noynawy/noynway.git את הכתובת שהוא נותן 
#לסימן נקודה ואת הערה שאנחנו רוצים 
#מעלה את זה לגיט שלו 
#!/bin/bash

read -p "Enter filename to add ('.' = all): " ADD

git add $ADD

read -p "Enter message for commit: " message

echo "current branch = $(git branch --show-current)"


url=$1
git commit -m $message

if [ $# != 0 ]; then
  git remote add ${whoami} $url #אולי לא יעבוד ואם לא למחוק 
  git push origin $(git branch --show-current)
fi

# לעשות history> history.txt או  histoey -w history.txt  
#ואז history >> history.txt 
# history -c  למחוק 
#כל פקודה --help