if [ $# -eq 0 ]; then
	 echo "Usage: sh checkfile.sh <filename>"
	 exit 1
fi


if [ -f $1 ];then
	echo "File $1 exisst"
else
	echo "File $1 is not exist"
fi
