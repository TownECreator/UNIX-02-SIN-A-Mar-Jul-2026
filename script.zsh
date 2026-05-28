# look for the current primary group 
id 
id -gn #only the name of the primary group
#Create a file and see which name it inherits
touch ~/test_grupo_heredado.txt
ls -la ~/test_grupo_heredado.txt
#the group is the primary group of the user


#Look for current group
id -gn
echo "Grupo actual: $(id -gn)"

#Create a file before newgrp
touch ~/antes_de_newgrp.txt
ls -la ~/antes_de_newgrp.txt

#Create a new group named "Desarrolladores"
sudo groupadd Desarrolladores
#Change to the new group
newgrp Desarrolladores
#Check the current group again
id -gn
echo "Grupo actual después de newgrp: $(id -gn)"


#Create a file inside the subshell of newgrp
touch ~/dentro_de_newgrp.txt
ls -la ~/dentro_de_newgrp.txt
#the group of the file is "Desarrolladores" because we are inside the newgrp subshell
#create a directory and check its group
mkdir -p ~/proyecto_dev/src
ls -la ~/

#proyecto_dev/ has the group "Desarrolladores" because we are inside the newgrp subshell
#but src/ has the group of the parent directory, which is the primary group of the
#exit the newgrp subshell
exit
#Check the current group again
id -gn
echo "grupo restaurado después de exit: $(id -gn)"

#Compare the groups of the files created before and inside newgrp
ls -la ~/antes_de_newgrp.txt ~/dentro_de_newgrp.txt