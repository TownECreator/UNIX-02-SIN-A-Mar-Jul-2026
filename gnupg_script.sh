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
gpg --armor --export-secret-keys XXXXXXX #exporta una llave privada específica reemplazando las X por un sec específico, no es necesario las XXX si solo se tiene 1 par de llaves
gpg --armor --export correo1@gmail.com #exportar
gpg --import NOMBRELEGIDO_mi_llave_públic.asc #lo ultimo depende del nombre, es importar la llave de alguien mas, es necesario que esté importado el archivo de la llave primero
$ echo "este mensaje es solo para sus ojos" > doc_no_cifrado.txt #creacion de un mensaje estandar
gpg --output doc_cifrado.txt --encrypt --recipient slucina0406@gmail.com doc_no_cifrado.txt #esto es para enviar un documento cifrado a la persona de la que tenemos la info de la llave
gpg --decrypt SantiLucina_doc_cifrado.txt #aqui, con el doc cifrado que obtuvimos de nuestro compañero le cambiamos el nombre y desciframos el mensaje en formato txt
gpg --output doc_no_cifrado_firmado.txt --clearsign doc_no_cifrado.txt #esto crea una firma para verificar que el documento no ha sido cambiado ni modificado desde su origen
cat doc_no_cifrado_firmado.txt #con este comando se comprueba la generación correcta de la firma
gpg --verify SantiLucina_doc_no_cifrado_firmado.txt #este comando se usa para verificar la firma de mi compañero
gpg --edit-key XXXX #este comando sirve para dar un voto de confianza a la persona dueña de la llave, las x pueden ser reemplazadas con la llave RSA o con el correo electrónico registrado
gpg --sign-key XXXXX #con este comando firmamos la clave para ratificar nuestra decisión
gpg --verify SantiLucina_doc_no_cifrado_firmado.txt #este comando se usa para volcer a ver el documento firmado con nuestro compañero, ahora con el voto de confianza
gpg --output doc_no_cifrado_firmado_binario.txt --sign doc_no_cifrado.txt #este comando crea un documento firmado en código binario