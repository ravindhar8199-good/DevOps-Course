🚀 Indra's Shell Script Cheat Sheet — 5-Minute Exam Revision
1️⃣ Basics
bash#!/bin/bash          ← line 1, no space, /bin not bin
sh script.sh         ← runs without execute permission
./script.sh          ← needs: chmod u+x script.sh
sh -x script.sh      ← DEBUG mode: shows each line before running (+ = depth)
Big idea: bash expands $stuff FIRST, then executes what's left. Every line = a command.
2️⃣ Variables
bashname="Indra"         ← NO spaces around =
echo "$name"         ← double quotes: expands
echo '$name'         ← single quotes: literal, prints $name
today=$(date)        ← $( ) = run command, grab output
read -p "Name? " n   ← ask user, store in n
System vars: $USER  $HOME  $PWD  $SHELL
3️⃣ Arguments & Special Variables
bashsh script.sh Indra 99      ← spaces split args; "Indra Reddy" = ONE arg
VarMeaning$1 $2first, second argument${10}10th+ needs braces$0script name$#count of arguments$@all arguments$?last command's grade: 0=success, 127=not found — GOLDFISH! check immediatelyexit 1quit script now, set $? (0-255 allowed)
4️⃣ if / elif / else
bashif [ "$age" -gt 18 ]; then      ← SPACES inside [ ]!
    echo "adult"
elif [ "$age" -ge 13 ]; then    ← elif (not elseif) + its own then
    echo "teen"
else
    echo "kid"
fi                              ← closes with fi
Numbers: -eq -ne -gt -lt -ge -le  |  Text: = !=  |  Files: -f file exists, -d directory
Math symbols OK in double parens: if (( age >= 18 ))
FUNNEL RULE: first true branch wins — order wide→narrow, test EVERY branch!
Guard pattern: if [ $# -eq 0 ]; then echo "Usage..."; exit 1; fi
5️⃣ case
bashcase $choice in          ← DON'T forget the $ !!
    1) date ;;           ← every branch ends ;;
    2) echo "hi"; ls ;;  ← two commands: separate with ;
    yes|y) echo "ok" ;;  ← | means OR
    *) echo "invalid" ;; ← catch-all, always last
esac                     ← closes with esac
6️⃣ for loops
bashfor i in {1..5}          ← NO spaces in braces! {5..1} counts down
for name in Ram Ajay     ← SPACES separate, NO commas (not C!)
for file in *.sh         ← every .sh file
do
    echo "$i"
done                     ← closes with done
Math: $(( 2 * i ))  |  Lines in file: $(wc -l < "$file") ← the < matters!
After done = runs once (LIFTOFF goes there)
7️⃣ Git ritual (end of session)
bashgit status → git add . → git commit -m "msg" → git push
git log --oneline        ← two dashes!

⚠️ INDRA'S TOP 4 TRAPS — check these BEFORE running!
#TrapExample1Variable name mismatch — silent!read choice ... case $choce2$ confusioncommands BARE: date pwd ls / variables WITH $: $USER $PWD3Spaces[ $a -gt 5 ] ✅ [$a] ❌ / {1..5} ✅ { 1..5 } ❌ / echo "hi" ✅ echo"hi" ❌4C leakingno commas in lists, no for( ), it's elif not elseif
Error decoder:

unary operator expected → empty variable in [ ] (quote it: "$var")
command not found on weird word → bare variable/text being executed
unexpected EOF → unclosed quote somewhere
missing ']' → no space before ]
