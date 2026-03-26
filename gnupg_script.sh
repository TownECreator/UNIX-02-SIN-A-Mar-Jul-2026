uname -a #da info sobre el ordenador
which gpg #ubicación del binario de gpg
gpg --version #verifica que todo esté instalado correctamente
gpg --full-generate-key #crear un nuevo par de claves criptográficas 
gpg --armor --export #exporta la llave pública
gpg --list-keys #para mostrar llaves existentes
#se usa algoritmo RSA por que tiene retrocompatibilidad, además, 4096 bits es suficientemente grande para seguridad pero suficientemente pequeña para que 
#computadoras comunes puedan comprobar la contraseña
#para exportar una llave a un documento: gpg --armor --export usuario@ejemplo.com > mi_clave_publica.asc
gpg --list-secret-keys --keyid-format-long #exportar la llave privada