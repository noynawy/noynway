## GitAndGitHub.pdf שאלה 2
branch=$1 # ברנץ
file=$2 #שם קובץ

#check the exit status of the commend 0 = True
if ! git rev-parse --verify $branch >/dev/null 2>&1 #בודק מה היציאה של הסטטוס  אם קיים 0 אם לא 1  אם קיים נכנס ללואה 
then
echo "$branch doesnt exist"
exit 1
fi

if [ ! -e $file ]
then
echo "$file doesnt exist"
exit 1
fi
branch_name="<branch-name>"
file_path="<file-path>"
commit_ids=$(git rev-list $branch -- $file)

for commit_id in $commit_ids; do
    branch_name=$(git branch --contains $commit_id | sed -n 's/^\* \(.*\)/\1/p')
    commit_message=$(git log --format="%s" -n 1 $commit_id)
    commit_date=$(git log --format="%ad" -n 1 --date=short $commit_id)

    echo "Branch: $branch"
    echo "Commit $commit_id"
    echo "Commit Message: $commit_message"
    echo "Date: $commit_date"
    echo "----------------------------"

    git show $commit_id:$file
    echo "------------------------------------------------------------------------------"
done
#כדי להריץ
#chmod +x Log.sh
# ./Log.sh  branch(main) file (שם של קובץ)
