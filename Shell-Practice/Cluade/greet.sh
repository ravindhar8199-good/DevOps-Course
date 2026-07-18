read -p "What is your Name? " Name
read -p "What is your favorite command " favcommand

Today=$(date)
echo "Hello $Name Today is $Today really hot and I like that command $favcommand"

echo "Running $favcommand for you now"
$favcommand


