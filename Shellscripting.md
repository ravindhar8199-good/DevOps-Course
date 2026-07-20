# 🐚 Shell Scripting for Beginners — Complete Study Material

> Beginner-friendly shell scripting notes — from *"What is a shell?"* to writing real automation scripts with functions.
> Based on the **KK FUNDA B9 batch** class notes.

---

## 📚 Table of Contents

1. [What is a Shell?](#1-what-is-a-shell)
2. [What is Shell Scripting?](#2-what-is-shell-scripting)
3. [Writing & Running Your First Script](#3-writing--running-your-first-script)
4. [Debug Mode](#4-debug-mode)
5. [Comments](#5-comments)
6. [Variables](#6-variables)
7. [Command Line Arguments](#7-command-line-arguments)
8. [Special Variables](#8-special-variables)
9. [Reading Input at Runtime (`read`)](#9-reading-input-at-runtime-read)
10. [Operators](#10-operators)
11. [Control Statements (if / elif / case)](#11-control-statements)
12. [Loops (for / while / until)](#12-loops)
13. [Arrays](#13-arrays)
14. [File Descriptors & Exit Codes](#14-file-descriptors--exit-codes)
15. [Functions](#15-functions)
16. [Real-Time Scripts (Practice Projects)](#16-real-time-scripts-practice-projects)
17. [Scheduling Scripts with Cron](#17-scheduling-scripts-with-cron)

---

## 1. What is a Shell?

- A **shell** is a user interface that allows users to interact with the operating system (OS) and execute commands.
- It acts as a **command interpreter** — it takes the commands you type, and communicates with the **OS kernel** to execute them.
- In most Linux distributions, **BASH (Bourne Again SHell)** is the default shell.

### Popular Shells

| Shell | Name |
|-------|------|
| `bash` | Bourne Again Shell (default in most Linux) |
| `ksh` | Korn Shell |
| `csh` | C Shell |
| `zsh` | Z Shell |

### Useful Shell Commands

```bash
# How many shells are installed on my Linux server?
cat /etc/shells

# Install other shells (RHEL / Amazon Linux / CentOS)
sudo yum install csh -y
sudo yum install zsh -y
sudo yum install ksh -y

# Which shell am I using right now?
echo $SHELL
echo $0
ps -p $$
```

### How to Switch to Another Shell

```bash
# Step 1: Check which shells are available
cat /etc/shells

# Step 2: Switch to another shell (example: sh)
/bin/sh
ps -p $$        # confirm the current shell

# Step 3: Come back to bash
/bin/bash
```

---

## 2. What is Shell Scripting?

> A **shell script** is a file containing a collection of commands. The commands are executed **in the order** they are written.

- **File extension:** `.sh`
- **Why learn it?** To **automate manual tasks**.
- **Is it only for DevOps engineers?** ❌ No! Anyone working with Linux benefits from it.

**Real-world script examples:**

1. `serverresourceutilization.sh` — monitor CPU/memory/disk
2. `dbbackup.sh` — automate database backups

### Prerequisites to Learn Shell Scripting

1. Linux commands
2. Basic programming knowledge *(helpful, not mandatory)*
3. Commitment 💪
4. Problem-solving skills

---

## 3. Writing & Running Your First Script

Create a file using `vi` (or any editor):

```bash
vi Demo.sh
```

```bash
#!/bin/bash
# The line above is called the "shebang" line — it tells the OS which interpreter to use

echo "Welcome to shellscript KK FUNDA"
echo "Today date is"
date
```

> 💡 `#!` is called the **shebang**. `#!/bin/bash` means "run this script using bash".

### 4 Ways to Run a Script

```bash
1. sh Demo.sh          # run with sh
2. ./Demo.sh           # needs execute permission first: chmod u+x Demo.sh
3. . Demo.sh           # run in the current shell (source)
4. bash Demo.sh        # run with bash
```

---

## 4. Debug Mode

Debug mode shows **each command before its output** — very useful for troubleshooting.

**1. Run the entire script in debug mode:**

```bash
sh -x Demo.sh
```

**2. Debug only a few lines** using `set -x` (start) and `set +x` (stop):

```bash
#!/bin/bash
set -x                                   # ---> debugging starts here
echo "Welcome to shellscript KK FUNDA"
echo "Today date is"
set +x                                   # ---> debugging ends here
date
```

---

## 5. Comments

Comments improve **code readability**, help **document your script**, and explain the purpose of specific commands.

### Single-line Comments

```bash
# This is a single-line comment
```

### Inline Comments

```bash
command1  # This command does something
```

### Multi-line Comments

Shell does not have native multi-line comments like `/* */` in C/Java, but you can:

```bash
# This is
# a multi-line
# comment
```

Or use a **here-document trick**:

```bash
<<comment
Everything here
is ignored by the shell
comment
```

> 📝 For comparison — Java/Groovy/Terraform use `//` and `/* */`, XML uses `<!-- -->`.

---

## 6. Variables

> **Definition:** Variables are used to **store data or values** that can be referenced and manipulated throughout the script.

### Naming Rules

- Can contain letters (`a-z`, `A-Z`), digits (`0-9`), and underscores (`_`)
- Must **start** with a letter or underscore
- Case-sensitive → `myVar` and `MYVAR` are different

### Assignment & Access

```bash
myVar="Hello, World!"        # ⚠️ NO spaces around =
echo "The value of myVar is: $myVar"
```

### Variable Expansion

```bash
name="Alice"
echo "Hello, $name!"
```

### Concatenation

```bash
greeting="Hello"
target="World"
echo "$greeting, $target!"      # Output: Hello, World!
```

### Types of Variables

**1️⃣ Environment Variables (system-defined)**

Inherited from the shell environment, or explicitly exported using `export`.

```bash
env             # list all system variables
printenv        # same as above

echo "Current user: $USER"
```

Override a system variable using `export`:

```bash
echo $HISTSIZE
export HISTSIZE=300     # only for the current session
echo $HISTSIZE
```

> To make it **permanent**, add the export line to `~/.bash_profile`:
> ```bash
> export HISTSIZE=300
> ```

**2️⃣ Local / User-Defined Variables**

Defined inside your script — accessible only within that script.

```bash
a=10
b=90
name="kkfunda"

echo $a
echo $b
echo $name
```

### File Naming Conventions

- Max file name length: **255 characters**
- Can contain letters, numbers, dots, underscores
- Don't use Linux reserved words or command names as file names, e.g. `if`, `fi`, `for`, `mkdir`, `pwd`
- The file system is **case-sensitive**

---

## 7. Command Line Arguments

Command line arguments let you **pass values to a script** when you run it.

| Variable | Meaning |
|----------|---------|
| `$0` | Script name |
| `$1` | First argument |
| `$2` | Second argument |
| `${10}` | Tenth argument (use `{}` for two or more digits) |

```bash
#!/bin/bash
echo "Script name: $0"
echo "First argument: $1"
echo "Second argument: $2"
```

```bash
sh Demo.sh Prasanth reddy
# Script name: Demo.sh
# First argument: Prasanth
# Second argument: reddy
```

---

## 8. Special Variables

| Variable | Meaning |
|----------|---------|
| `$#` | Number of arguments passed to the script |
| `$@` | All arguments as **separate words** (`"$1" "$2" ...`) |
| `$*` | All arguments as a **single string** (`"$1 $2 ..."`) |
| `$$` | Process ID (PID) of the current script |
| `$?` | **Exit status** of the previous command |

**Exit status values:**

- `0` → previous command was **successful**
- `127` → **command not found**
- non-zero → some error occurred

```bash
date
echo $?     # 0  (success)

datee
echo $?     # 127 (command not found)
```

---

## 9. Reading Input at Runtime (`read`)

### 1. Basic input

```bash
#!/bin/bash
echo "Enter your name:"
read name
echo "Hello, $name! Welcome to the script."
```

### 2. Prompt on the same line (`-p`)

```bash
#!/bin/bash
read -p "Enter your age: " age
echo "You entered: $age years old."
```

### 3. Read multiple values

```bash
#!/bin/bash
echo "Please enter your name:"
read name

echo "Please enter your age:"
read age

echo "Hello, $name! You are $age years old."
```

Or read both in **one line**:

```bash
#!/bin/bash
echo "Please enter your name and age:"
read name age1
echo "Hello, $name! You are $age1 years old."
```

### 4. Read input as an array

```bash
read -a fruits    # covered in the Arrays section
```

### 5. Read with a timeout (`-t`)

```bash
#!/bin/bash
read -t 10 -p "Enter your password within 10 seconds: " password

if [ -z "$password" ]; then
    echo "No password entered within 10 seconds."
else
    echo "Password entered: $password"
fi
```

### 6. Silent input for passwords (`-s`)

```bash
#!/bin/bash
read -s -p "Enter your password: " password
echo    # move to a new line after password input
echo "Password entered."
```

---

## 10. Operators

### 1. Arithmetic Operators

```bash
#!/bin/bash
a=20
b=5
echo "Arithmetic Operations:"
echo "a + b = $(( a + b ))"
echo "a - b = $(( a - b ))"
echo "a * b = $(( a * b ))"
echo "a / b = $(( a / b ))"
echo "a % b = $(( a % b ))"
```

### 2. Comparison Operators

| Operator | Meaning | Equivalent |
|----------|---------|------------|
| `-eq` | equal to | `==` |
| `-ne` | not equal to | `!=` |
| `-gt` | greater than | `>` |
| `-lt` | less than | `<` |
| `-ge` | greater than or equal to | `>=` |
| `-le` | less than or equal to | `<=` |

```bash
#!/bin/bash
a=20
b=30

echo "Comparison Operations:"
if [ $a -eq $b ]; then
    echo "a is equal to b"
fi
if [ $a -ne $b ]; then
    echo "a is not equal to b"
fi
if [ $a -gt $b ]; then
    echo "a is greater than b"
fi
if [ $a -lt $b ]; then
    echo "a is less than b"
fi
```

### 3. Logical Operators

**AND (`&&`) truth table:**

| A | B | A && B |
|---|---|--------|
| T | T | **T** |
| T | F | F |
| F | T | F |
| F | F | F |

**OR (`||`) truth table:**

| A | B | A \|\| B |
|---|---|----------|
| T | T | **T** |
| T | F | **T** |
| F | T | **T** |
| F | F | F |

```bash
#!/bin/bash
a=30
b=5
echo "Logical Operations:"
if [ $a -eq 20 ] && [ $b -eq 5 ]; then
    echo "Both conditions are true"
fi
if [ $a -eq 10 ] || [ $b -eq 5 ]; then
    echo "At least one condition is true"
fi
if ! [ $a -eq 0 ]; then
    echo "a is not equal to 0"
fi
```

### 4. String Operators

```bash
#!/bin/bash
str1="Hello"
str2="World"
echo "String Operations:"
echo "=================="
if [ "$str1" = "$str2" ]; then
    echo "Strings are equal"
fi
if [ "$str1" != "$str2" ]; then
    echo "Strings are not equal"
fi

str3="$str1 $str2"
echo "Concatenated string: $str3"

length=${#str1}
echo "Length of str1 is $length"
```

---

## 11. Control Statements

Control statements let you **make decisions** and **branch** based on conditions.

### 1. `if` Statement

```bash
if [ condition ]; then
    # Code block to execute if condition is true
fi
```

### 2. `if-else` Statement

```bash
if [ condition ]
then
    # Code block if condition is true
else
    # Code block if condition is false
fi
```

**Example 1 — number check:**

```bash
#!/bin/bash
a=10

if [ $a -eq 10 ]; then
    echo "Value of a is 10"
else
    echo "Value of a is not 10"
fi
```

**Example 2 — check if a file exists (`-f`):**

```bash
#!/bin/bash
file="demo.sh"

if [ -f "$file" ]
then
    echo "File $file exists."
else
    echo "File $file does not exist."
fi
```

**Example 3 — check internet connectivity:**

```bash
#!/bin/bash
ping_result=$(ping -c 1 google.com 2>&1)

if [[ $ping_result == *"icmp_seq"* ]]
then
    echo "Internet connectivity is up."
else
    echo "Internet connectivity is down."
fi
```

### 3. `if-elif-else` Statement

```bash
if [ condition1 ]; then
    # runs if condition1 is true
elif [ condition2 ]; then
    # runs if condition2 is true
else
    # runs if all conditions are false
fi
```

**Example 1 — multiple number checks:**

```bash
#!/bin/bash
a=20
if [ $a -eq 10 ]; then
    echo "Value of a is 10"
elif [ $a -eq 20 ]; then
    echo "Value of a is 20"
else
    echo "Value of a is neither 10 nor 20"
fi
```

**Example 2 — disk space monitoring (real-time use case):**

```bash
#!/bin/bash
threshold_critical=90
threshold_warning=75
current_usage=$(df -h / | awk 'NR==2 {print $5}' | cut -d'%' -f1)

echo "Current disk usage: $current_usage%"

if [ $current_usage -ge $threshold_critical ]
then
    echo "Disk usage is critical ($current_usage%). Taking immediate action!"
    # Add commands to free up disk space or notify administrators
elif [ $current_usage -ge $threshold_warning ]
then
    echo "Disk usage is high ($current_usage%). Consider freeing up space."
else
    echo "Disk usage is normal ($current_usage%)."
fi
```

**Example 3 — handle user input:**

```bash
#!/bin/bash
read -p "Enter a number (1-3): " num

if [ "$num" -eq 1 ]
then
    echo "You entered the number one."
elif [ "$num" -eq 2 ]
then
    echo "You entered the number two."
elif [ "$num" -eq 3 ]
then
    echo "You entered the number three."
else
    echo "Invalid input: Please enter a number between 1 and 3."
fi
```

**Example 4 — network connectivity status:**

```bash
#!/bin/bash
ping_result=$(ping -c 1 google.com 2>&1)

if [[ $ping_result == *"icmp_seq"* ]]
then
    echo "Internet connectivity is up."
elif [[ $ping_result == *"unknown host"* ]]
then
    echo "Unable to resolve DNS. Check your network configuration."
else
    echo "Internet connectivity is down."
fi
```

### 4. `case` Statement

```bash
case variable in
    pattern1)
        # commands if variable matches pattern1
        ;;
    pattern2)
        # commands if variable matches pattern2
        ;;
    pattern3 | pattern4)
        # commands if variable matches pattern3 OR pattern4
        ;;
    *)
        # default commands (no pattern matched)
        ;;
esac
```

**Example 1 — basic case:**

```bash
#!/bin/bash
fruit="apple"

case $fruit in
    apple)
        echo "It's a fruit: apple."
        ;;
    banana)
        echo "It's a fruit: banana."
        ;;
    orange | mandarin)
        echo "It's a citrus fruit."
        ;;
    *)
        echo "Unknown fruit."
        ;;
esac
```

**Example 2 — weekday or weekend:**

```bash
#!/bin/bash
day="Monday"

case $day in
    Monday | Tuesday | Wednesday | Thursday | Friday)
        echo "$day is a weekday."
        ;;
    Saturday | Sunday)
        echo "$day is a weekend day."
        ;;
    *)
        echo "Invalid day."
        ;;
esac
```

**Example 3 — menu-driven script:**

```bash
#!/bin/bash
echo "Menu:"
echo "====="
echo "1. Display date"
echo "2. Display calendar"
echo "3. Display current directory"
echo "4. Exit"

read -p "Enter your choice: " choice

case $choice in
    1)
        date
        ;;
    2)
        cal
        ;;
    3)
        pwd
        ;;
    4)
        echo "Exiting program."
        exit 0
        ;;
    *)
        echo "Invalid choice: $choice. Please enter a number between 1 and 4."
        ;;
esac
```

> 💡 **Bonus — copying scripts to/from an EC2 server with `scp`:**
> ```bash
> # Local ➜ Server
> scp -i key.pem localfile.txt ec2-user@<server-ip>:/home/ec2-user/
>
> # Server ➜ Local
> scp -i key.pem ec2-user@<server-ip>:/home/ec2-user/R2.sh ./R2.sh
> ```

---

## 12. Loops

> A **loop** repeats a block of code multiple times until a condition is met.

### `for` Loop

```bash
for variable in list
do
    # Commands to execute for each item in the list
done
```

**Example 1 — iterate over a list of numbers:**

```bash
#!/bin/bash
for num in 1 2 3 4 5
do
    echo "Number: $num"
done
```

**Example 2 — iterate over files & directories:**

```bash
#!/bin/bash
echo "Files in current directory:"
for file in *
do
    echo "$file"
done
```

**Example 3 — process script arguments:**

```bash
#!/bin/bash
echo "Arguments passed to the script:"
for arg in "$@"
do
    echo "$arg"
done
```

**Example 4 — C-style for loop:**

```bash
#!/bin/bash
echo "for loop example"
for (( i=1; i<=5; i++ ))
do
    echo "Iteration: $i"
done
```

**Example 5 — nested for loop (multiplication table):**

```bash
#!/bin/bash
echo "Multiplication Table (1 to 5):"

for (( i=1; i<=5; i++ ))
do
    echo "Multiplication table for $i:"
    for (( j=1; j<=5; j++ ))
    do
        echo "$i * $j = $((i * j))"
    done
    echo "----------------------"
done
```

> 💡 Increment/decrement operators: `i++`, `++i`, `i--`, `--i`

### `while` Loop

Executes a block of code **as long as the condition is true**.

```bash
while [ condition ]
do
    # Code block to execute while condition is true
done
```

**Example 1 — countdown from 5 to 1:**

```bash
#!/bin/bash
counter=5

echo "Counting down:"
while [ $counter -gt 0 ]
do
    echo "$counter"
    (( counter-- ))
done

echo "You are a good automation engineer"
```

**Example 2 — read a file line by line:**

```bash
#!/bin/bash
filename="Shell_Scripting_New.txt"

echo "Contents of file:"
while IFS= read -r line     # IFS = Internal Field Separator
do
    echo "$line"
done < "$filename"
```

**Example 3 — process user input until 'exit':**

```bash
#!/bin/bash
echo "Enter names (type 'exit' to quit):"

while :
do
    read -p "Name: " name
    if [ "$name" = "exit" ]; then
        break
    fi
    echo "Hello ---> $name!"
done

echo "You have exited"
```

**Example 4 — calculate factorial:**

```bash
#!/bin/bash
echo "Enter a number to calculate its factorial:"
read num

if [ $num -gt 0 ]; then

    factorial=1
    counter=$num

    while [ $counter -gt 0 ]
    do
        factorial=$(( factorial * counter ))
        (( counter-- ))
    done

    echo "Factorial of $num is: $factorial"

else
    echo "Invalid input"
fi
```

### `until` Loop

Runs **until the condition becomes true** (opposite of `while`).

```bash
#!/bin/bash
counter=1

echo "Counting up:"
until [ $counter -gt 10 ]
do
    echo "$counter"
    (( counter++ ))
done

echo "Done counting!"
```

---

## 13. Arrays

> **Definition:** Arrays provide a convenient way to store and manipulate **multiple values under a single variable name**.

📌 Array values are accessed by **index** — from `0` to `length - 1`.

### Declaring Arrays

```bash
# 1. Implicit declaration
name_array=("kk" "sai" "raghu")

# 2. Explicit declaration
declare -a name_array
name_array=("kk" "sai" "raghu")
```

### Accessing Array Elements

```bash
name_array=("kk" "sai" "raghu")
echo "${name_array[0]}"   # kk
echo "${name_array[1]}"   # sai
echo "${name_array[2]}"   # raghu
```

### Array Operations

```bash
# 1. Append an element
name_array+=("jaswanth")

# 2. Length of the array
echo "Length of array: ${#name_array[@]}"

# 3. Iterate over all elements
for element in "${name_array[@]}"
do
    echo "$element"
done

# 4. Remove an element by index
unset name_array[1]

# 5. Clear the whole array
name_array=()
```

**Example 1 — full array demo:**

```bash
#!/bin/bash
declare -a fruits=("Apple" "Banana" "Orange")

echo "All fruits:"
for fruit in "${fruits[@]}"
do
    echo "$fruit"
done

echo "Number of fruits: ${#fruits[@]}"

fruits+=("Grapes")                       # append
echo "Number of fruits: ${#fruits[@]}"

echo "First fruit: ${fruits[0]}"          # access by index

unset fruits[1]                           # remove

echo "Remaining fruits:"
for fruit in "${fruits[@]}"
do
    echo "$fruit"
done
```

**Example 2 — process file names:**

```bash
#!/bin/bash
declare -a files=()
files=(*.sh)      # all .sh files in the current directory

for file in "${files[@]}"
do
    line_count=$(wc -l < "$file")
    echo "File: $file has $line_count lines."
done
```

**Example 3 — store command-line arguments in an array:**

```bash
#!/bin/bash
args=("$@")

echo "All arguments:"
for arg in "${args[@]}"
do
    echo "$arg"
done

echo "Length of array: ${#args[@]}"
echo "First argument: ${args[0]}"
```

**Example 4 — dynamic menu with `select`:**

```bash
#!/bin/bash
declare -a menu=("Option 1: l1.sh" "Option 2: l2.sh" "Option 3: Exit")

echo "Select an option:"
select option in "${menu[@]}"
do
    case $REPLY in
        1)
            sh l1.sh
            ;;
        2)
            sh l2.sh
            ;;
        3)
            echo "Exiting..."
            break
            ;;
        *)
            echo "Invalid option"
            ;;
    esac
done
```

---

## 14. File Descriptors & Exit Codes

### File Descriptors

| FD | Name | Symbol |
|----|------|--------|
| `0` | Standard Input (stdin) | `<` |
| `1` | Standard Output (stdout) | `>` , `>>` |
| `2` | Standard Error (stderr) | `2>` |

```bash
command >  output.txt        # redirect stdout (overwrite)
command >> output.txt        # redirect stdout (append)
command <  input.txt         # take input from a file
command 2> error.txt         # redirect errors only
command > all.txt 2>&1       # redirect BOTH output and errors to one file
```

### Exit Codes

- Range: `0` to `127` (values above 128 usually mean the process was killed by a signal)
- `0` → success
- non-zero → failure (`127` = command not found)

```bash
sleep 5      # pause the script for 5 seconds
```

---

## 15. Functions

> **Definition:** Functions allow you to **reuse code** — write once, call many times. They reduce the number of lines in a script and make it more readable.

### Defining Functions

```bash
# Syntax 1
function_name ()
{
    command1
    command2
}

# Syntax 2 (example)
data()
{
    echo "I am from Nellore"
    echo "My name is KK FUNDA"
    date
    echo "KK FUNDA YOUTUBE CHANNEL"
}
```

### Calling a Function

```bash
#!/bin/bash
testing()
{
    echo "Hello, World!"
}

testing      # call the function
pwd
uptime
testing      # call it again — reuse!
```

### Passing Parameters to Functions

Functions accept parameters just like scripts — access them with `$1`, `$2`, ... or `$@`, `$*`.

```bash
#!/bin/bash
greet_user() {
    local name="$1"     # first parameter
    echo "Hello, $name!"
}

greet_user "kkfunda"
```

**Sum of two numbers:**

```bash
#!/bin/bash
sum() {
    local num1="$1"
    local num2="$2"
    local total=$(( num1 + num2 ))
    echo "Sum of $num1 and $num2 is: $total"
}

sum 10 20
```

### Return Values

Shell functions don't have a traditional `return` for values — the return status of the last command is used. To return a value, use `echo` and capture it:

```bash
#!/bin/bash
square() {
    local num="$1"
    local result=$(( num * num ))
    echo "$result"        # "return" the result
}

output=$(square 5)
echo "Square of 5 is: $output"
```

### Local vs Global Variables

- Variables declared **inside** a function with `local` → **local** (scope = that function only)
- Variables declared **outside** functions → **global** (scope = entire script)

```bash
#!/bin/bash
global_var="Global"

demo_local_var()
{
    local local_var="Local"
    echo "Inside function: local_var=$local_var, global_var=$global_var"
}

demo_local_var

echo "Outside function: local_var=$local_var"      # empty — local_var is not visible here
echo "Outside function: global_var=$global_var"    # works — global scope
```

**Function with a loop:**

```bash
#!/bin/bash
print_numbers() {
    local n="$1"
    for (( i=1; i<=n; i++ ))
    do
        echo "$i"
        sleep 5
    done
}

print_numbers 5
```

---

## 16. Real-Time Scripts (Practice Projects)

### Project 1 — User Management Script

> Add, delete, and list Linux users with a menu.

```bash
#!/bin/bash

# Function to add a user
add_user() {
    local username="$1"
    sudo useradd -m "$username"
    echo "User '$username' added successfully."
}

# Function to delete a user
delete_user() {
    local username="$1"
    sudo userdel -r "$username"
    if [ $? -eq 0 ]; then
        echo "User '$username' deleted successfully."
    else
        echo "Invalid user"
    fi
}

# Function to list all users
list_users() {
    local users=$(cut -d: -f1 /etc/passwd)
    echo "List of users:"
    echo "$users"
}

# Main script logic
echo "Choose an option:"
echo "1. Add a user"
echo "2. Delete a user"
echo "3. List all users"
read -p "Enter your choice: " choice

case $choice in
    1) read -p "Enter username: " username
       add_user "$username"
       ;;
    2) read -p "Enter username to delete: " username
       read -p "Are you sure you want to delete? (yes/no): " decision
       if [ "$decision" = "yes" ]
       then
           delete_user "$username"
       else
           echo "OK, no problem — leaving it."
       fi
       ;;
    3) list_users ;;
    *) echo "Invalid choice. Exiting." ;;
esac
```

### Project 2 — Even or Odd Checker

```bash
#!/bin/bash

check_even_odd() {
    local number="$1"
    if (( number % 2 == 0 )); then
        echo "$number is even."
    else
        echo "$number is odd."
    fi
}

for (( i=1; i<=5; i++ ))
do
    read -p "Enter a number: " num
    if [ $num -gt -1 ]
    then
        check_even_odd "$num"
    else
        echo "Please enter valid input"
    fi
done
```

### Project 3 — Print an Array Using a Function

```bash
#!/bin/bash

print_array() {
    local arr=("$@")     # copy all arguments into the array
    echo "Array elements:"
    for item in "${arr[@]}"
    do
        echo "$item"
    done
}

my_array=("apple" "banana" "cherry" "date")
print_array "${my_array[@]}"
```

### Project 4 — Safely Delete a File

```bash
#!/bin/bash

risky_operation() {
    local fname="$1"
    if [ -f "$fname" ]; then
        echo "Processing file: $fname"
        rm -rf "$fname"
        echo "$fname deleted successfully."
    else
        echo "Error: File $fname does not exist."
    fi
}

read -p "Enter a file name: " fname
risky_operation "$fname"
```

### Project 5 — Disk Usage Monitor

```bash
#!/bin/bash

check_disk_usage() {
    local threshold=80      # threshold percentage
    local disk_usage=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')
    echo "Disk usage: $disk_usage%"

    if (( disk_usage >= threshold )); then
        echo "Warning: Disk usage exceeds $threshold%."
        # Add logic here to send an alert (e.g., email or notification)
    else
        echo "Disk usage within limits."
    fi
}

check_disk_usage
```

### Project 6 — Zip Log Files

```bash
#!/bin/bash

zip_files()
{
    zip backup.zip *.log
    mv backup.zip backup/
}

zip_files
```

### Project 7 — Calculate Average

```bash
#!/bin/bash

calculate_average() {
    local total=0
    local count=0
    for num in "$@"
    do
        total=$(( total + num ))
        (( count++ ))
    done
    local average=$(( total / count ))
    echo "Average: $average"
}

calculate_average 10 20 30
calculate_average 5 15 25 35 45
```

### Project 8 — Install / Uninstall Any Package

```bash
#!/bin/bash

install() {
    local arg="$1"
    sudo yum install "$arg" -y
}

un_install() {
    local arg="$1"
    sudo yum remove "$arg" -y
}

echo "Enter package name:"
read package
install "$package"
```

### Project 9 — System Information Report

```bash
#!/bin/bash

gather_system_info() {
    local hostname=$(hostname)
    local kernel=$(uname -r)
    local cpu_cores=$(cat /proc/cpuinfo | grep -i "cpu cores" | awk '{print $4}' | head -1)
    local memory=$(free -h | awk '/Mem/{print $7}')
    local disk_usage=$(df -h / | awk 'NR==2 {print $5}')

    echo "System Information:"
    echo "==================="
    echo "Hostname   : $hostname"
    echo "Kernel     : $kernel"
    echo "CPU cores  : $cpu_cores"
    echo "Free memory: $memory"
    echo "Disk usage : $disk_usage used"
}

gather_system_info
```

### Project 10 — Clean Up Old Files

```bash
#!/bin/bash

# Directory to clean up
TARGET_DIR="/home/ec2-user/"

# Number of days to keep files
DAYS=2

# Find files older than $DAYS days
old_files=$(find "$TARGET_DIR" -type f -mtime +$DAYS)
echo "$old_files"

# To actually delete them, uncomment the line below:
# find "$TARGET_DIR" -type f -mtime +$DAYS -delete
```

---

## 17. Scheduling Scripts with Cron

Use **cron** to run scripts automatically on a schedule:

```bash
# Edit the crontab
crontab -e

# Run delete.sh every day at 2:00 AM
0 2 * * * /path/to/delete.sh
```

**Cron format:**

```
┌───────── minute (0–59)
│ ┌─────── hour (0–23)
│ │ ┌───── day of month (1–31)
│ │ │ ┌─── month (1–12)
│ │ │ │ ┌─ day of week (0–6, Sunday=0)
│ │ │ │ │
0 2 * * *  /path/to/script.sh
```

---

## ✅ Topics Covered (Quick Revision Checklist)

- [x] Shell & shell types
- [x] Shell scripting basics & shebang
- [x] Ways to run a script & debug mode
- [x] Comments
- [x] Variables (environment & user-defined)
- [x] Command line arguments & special variables (`$0`, `$#`, `$@`, `$?`, `$$`)
- [x] `read` command (prompt, timeout, silent)
- [x] Operators (arithmetic, comparison, logical, string)
- [x] Control statements (`if`, `if-else`, `if-elif-else`, `case`)
- [x] Loops (`for`, `while`, `until`)
- [x] Arrays
- [x] File descriptors & exit codes
- [x] Functions (parameters, return values, scope)
- [x] Real-time automation projects
- [x] Cron scheduling

---

> 🎯 **Happy Scripting!** Practice each example on a Linux machine — that's the fastest way to learn. 🚀
