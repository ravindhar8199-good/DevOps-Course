if [ $1 -ge 90 ];then
	echo "Grade A"
elif [ $1 -ge 75 ];then
	echo "Grade B"
elif [ $1 -ge 50 ];then
	echo "Grade C"
else
	echo "Grade F, see you in summer school"
fi
