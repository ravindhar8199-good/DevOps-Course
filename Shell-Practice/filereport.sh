
if [ -f "$1" ];then
	echo "file $ existed"
else
	echo "file $1 not existed"
	exit 1
fi

file=$( ls | wc -l )

echo "file has $file lines"
