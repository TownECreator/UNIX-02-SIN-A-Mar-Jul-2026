ls #lists files and folders in the current directory (or a specified path), with options like -l or -a for more details

ls Documents # Lists the contents of the "Documents" directory, in this case, since the 'Documents' directory does not exist, it simply gives us an error
aptitude moo # 'aptitude moo' is a fun Easter egg that prints an ASCII cow; it requires the 'aptitude' package,
# which isn’t installed by default in Codespaces, so we'll need to run 'sudo apt update && sudo apt install aptitude' first. In this case, we hace no easter eggs in the program.

ls -l #Lists files in long format (permissions, owner, size, date, etc.)
ls -r #Lists files in reverse order (reverses the default sorting)
#Same output as the commands above:
ls -l -r #detailed list (-l) but in reverse order (-r)
ls -rl #Combined flags: equivalent to 'ls -r -l', detailed list in reverse order
ls -lr #Combined flags: equivalent to 'ls -l -r', same result as above
aptitude -v moo #Prints the 'moo' ASCII cow Easter egg with one level of verbosity (it answers with a snarky: There really are no Easter Eggs in this program. )
aptitude -vv moo #Same command with more verbosity, shows a more elaborate cow message (It asnwers for a second time with a: Didn't I already tell you that there are no Easter Eggs in this program? )
aptitude -vvv moo #Even higher verbosity, displays the most detailed/complex cow output (It answer with a: Stop it! )
aptitude -vvvv moo # More higher vervosity, it asnwers with a: Okay, okay, if I give you an Easter Egg, will you go away?
#In the next v we add, the command with give us a 'elephant being eaten by a snake' referencing The Little Prince.

pwd #prints the full path of the current working directory, showing exactly where you are in the filesystem