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


touch ~/dentro_de_newgrp.txt
ls -la ~/dentro_de_newgrp.txt
mkdir -p ~/proyecto_dev/src
ls -la ~/
                     