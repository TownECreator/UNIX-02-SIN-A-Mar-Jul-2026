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

cd  #Goes to your home directory (~), this always works even in Codespaces regardless of existing folders
cd Documents #Attempts to enter "Documents" from current location, but will fail if that folder doesn’t exist in your environment
cd / #Moves to the root directory (/) which always exists as the top level of the filesystem
cd /home/sysadmin #Tries to go to this exact absolute path, will fail if the user/folder isn’t present in Codespaces
cd School/Art #Attempts to enter nested folders using a relative path, fails if "School/Art" doesn’t exist
cd School #Tries to enter "School" in current directory, will fail if the folder is not there
cd Art #Tries to enter "Art" inside current directory, fails if it doesn’t exist
cd .. #Moves up to the parent directory, works unless you’re already at root (/)
cd ~ #Returns to your home directory using ~ shortcut, always works
cd . #Moves up one directory again from wherever you currently are

ls #Lists files and folders in the current directory using default sorting
ls -l /var/log/ #Shows detailed info (permissions, size, dates) for files in /var/log
ls -lt /var/log/ #Same as -l but sorted by most recent modification time first
ls -l -s /var/log/ #Detailed list plus shows file sizes in blocks
ls -lSr /var/log/ #Detailed list sorted by size (-S) and reversed (-r), smallest files first
ls -r /var/log/ #Lists files in reverse of the default order

su - #Switches to root user with a full login shell (loads root’s environment); requires root password (not actually possible in codespaces since it's designed to use sudo instead of su)
su -l #Same as 'su -', explicitly requests a login shell for the target user (usually root)
su --login #Long form of login shell option, equivalent to 'su -' and 'su -l'
exit #Exits the current shell or user session (e.g., leaves root and returns to previous user)
sl #Runs the "Steam Locomotive" program, a fun ASCII train animation often installed as a joke command (e.g., when you type 'ls' wrong)
sudo sl #Runs 'sl' (Steam Locomotive ASCII train) with sudo; works only if 'sl' is installed and sudo is permitted

cd ~/Documents #Moves to the Documents folder inside your home directory (~); will fail if the folder doesn’t exist in Codespaces
ls -l hello.sh #Lists detailed information about 'hello.sh' (permissions, size, owner, date); fails if the file isn’t present

cd ~/Documents #Moves to Documents in your home directory; fails if the folder doesn’t exist in Codespaces
ls -l hello.sh #Shows detailed info for hello.sh (permissions, size, etc.); fails if the file isn’t there
./hello.sh #Tries to execute the script; will fail if it doesn’t have execute permission or doesn’t exist
chmod u+x hello.sh #Adds execute permission for the user, allowing the script to be run
ls -l hello.sh #Shows updated permissions, now including 'x' (execute) for the user
./hello.sh #Executes the script successfully if it exists and now has execute permission

cd ~/Documents #Changes the current directory to the "Documents" folder in your home directory
cat animals.txt #Displays the entire contents of the file "animals.txt" in the terminal
cat alpha.txt #Displays the entire contents of the file "alpha.txt"
head alpha.txt #Shows the first 10 lines of "alpha.txt" (default behavior)
tail alpha.txt #Shows the last 10 lines of "alpha.txt" (default behavior)
head -n 5 alpha.txt #Shows only the first 5 lines of "alpha.txt"
tail -n 5 alpha.txt #Shows only the last 5 lines of "alpha.txt"

cd ~/Documents #Moves into your Documents directory
cp /etc/passwd . #Copies the file "passwd" from /etc into the current directory (the dot "." means "here")
ls #Lists all files and folders in the current directory

cd ~ #Moves to your home directory
dd if=/dev/zero of=/tmp/swapex bs=1M count=50
#Creates a 50 MB file filled with zeros in /tmp called "swapex"
#bs=1M → writes in 1 MB blocks
#count=50 → writes 50 blocks (total = 50 MB)
dd if=/dev/sda of=/dev/sdb
# ⚠️DANGEROUS: Copies EVERYTHING from disk /dev/sda to /dev/sdb (bit-by-bit clone)
# This will OVERWRITE all data on /dev/sdb completely (not executed for safety reasons)