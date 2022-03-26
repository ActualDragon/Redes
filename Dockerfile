FROM ubuntu:latest
# Instalamos las dependencias necesarias para el servidor
#-y para que no pida prompt para confirmar instalación
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -y update \
&& apt-get install -y telnetd \
&& apt-get install -y xinetd \
&& apt-get install -y netcat \
&& apt-get install -y net-tools \
&& apt update && apt install openssh-server sudo -y \
&& apt-get autoremove -y \
&& apt-get autoclean -y \
&& rm -rf /var/lib/apt/lists/* \
# Agregamos el usuario test
&& useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1000 test \
# Hacemos que la contraseña del usuario test sea test
&& echo 'test:test' | chpasswd \
&& service ssh start \
&& echo "# default: on \n \
# Descripción: La configuración de telnet es la siguiente. Recordemos ue usa autentificación sin encriptación\n \
service telnet \n \
{ \n \
disable = no \n \
flags           = REUSE \n \
socket_type     = stream \n \
wait            = no \n \
user            = root \n \
server          = /usr/sbin/in.telnetd \n \
log_on_failure  += USERID \n \
}" | tee -a /etc/xinetd.d/telnet
#Exponemos el puerto ssh y telnet
EXPOSE 22
EXPOSE 23
ENTRYPOINT ["bash"]
#Iniciamos daemon de ssh en el puerto 22
# Iniciamos daemon de telnet en el puerto 23
CMD ["-c", "xinetd -dontfork -stayalive", "&&", "/usr/sbin/sshd","-D"]
