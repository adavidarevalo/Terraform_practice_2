#!/bin/bash
# Actualiza la lista de paquetes e instala Apache
sudo yum update -y
sudo yum install -y httpd curl

# Habilita y arranca el servicio de Apache
sudo systemctl enable httpd
sudo systemctl start httpd

# Crea un archivo de index.html con el mensaje "Hello World"
echo "<html><body><h1>Hello World X2</h1></body></html>" | sudo tee /var/www/html/index.html

# Ajusta los permisos para que Apache pueda leer el archivo
sudo chmod 644 /var/www/html/index.html

# Muestra información sobre la instancia (puede ser útil para depuración)
curl http://169.254.169.254/latest/meta-data/instance-id > /var/www/html/instance-id.html

# Reinicia el servicio de Apache para aplicar cambios
sudo systemctl restart httpd
