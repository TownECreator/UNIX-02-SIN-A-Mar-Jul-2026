# look for the current primary group 
id 
id -gn #only the name of the primary group
#Create a file and see which name it inherits
touch ~/test_grupo_heredado.txt
ls -la ~/test_grupo_heredado.txt
#the group is the primary group of the user