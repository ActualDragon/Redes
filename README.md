# README
<div id="header" align="center">
  <img src="https://blog.chun.no/images/2014-06-01-docker.gif" width="100"/>
  <br/>
  <br/>
  <h1> CONTENEDOR CON SSH Y TELNET </h1>
  <h2> Daniela Gómez Peniche, Bernardo García Ramos, Mauricio de Garay Hernandez </h2>
  <img src="https://cdn-images-1.medium.com/max/1200/1*1uIttjuEz_Ry7EghgQnHkA.gif" width="600" height="300"/>
</div>

<div>
  <h3> Instrucciones para correr los contenedores </h3>
  FASE BUILD (OBTENER IMAGEN)
  <p>&emsp;Lo primero es descargar el dockerfile, abrir una terminal e ir al directorio donde se encuentre tu archivo.</p>
  <p>&emsp;Una vez hecho eso, ejecutarás el siguiente comando en terminal:</p>
  <p>&emsp;$docker build -t telnetssh .</p>
  FASE RUN (CREAR CONTENEDOR Y CORRERLO)
  <p>&emsp;Una vez que tengas tu images con el nombre de "telnetssh", lo que toca es crear un contenedor a partir de esa imagen.</p>
  <p>&emsp;Para correr el contenedor, va a ser necesario forwardear los puertos necesarios para que corra correctamente. El comando es el siguiente:</p>
  <p>&emsp;$docker run -itd -p 2200:22 -p 2300:23 telnetssh</p>
  <p>&emsp;Nosotros seleccionamos los puertos 2200 y 2300 para forwardear respecctivamente a los puertos 22 (SSH) y 23 (Telnet)</p>
  FASE COMPROBACIÓN (CORRER TELNET Y SSH)
  <p>&emsp;Es importante revisar que tu contenedor esté corriendo correctamente. Lo puedes hacer con el siguiente comando:</p>
  <p>&emsp;$docker container ls</p>
  <p>&emsp;Una vez observando que el contenedor está corriendo correctamente, es necesario probarlo al abrir una nueva terminal y abrir los servicios con los siguientes comando:</p>
  <p>&emsp;$ssh test@localhost --p 22</p>
  <p>&emsp;Para correr el servicio de telnet será con el siguiente comando:</p>
  <p>&emsp;$telnet localhost 23</p>
  <p>&emsp;Para ambos casos el usuario será test, así como la contraseña.</p>
</div>

<div align="center">
    <h3> ¡Listo! Tus servicios ya deben de estar funcionando correctamente.</h3>
</div>

