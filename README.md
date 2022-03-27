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
  <h3> Instrucciones para correr los contenedores: </h3>
  FASE BUILD (OBTENER IMAGEN)
  <ol>
    <li>&emsp;Descargar el dockerfile</li>
    <li>&emsp;Abrir una terminal e ir al directorio donde se encuentre el archivo.</li>
    <li>&emsp;Una vez hecho eso, ejecutar el siguiente comando en terminal para crear una imagen llamada "telnetssh":</li>
    <p>&emsp;$docker build -t telnetssh .</p>
  </ol>
  FASE RUN (CREAR CONTENEDOR Y CORRERLO)
  <ol>
    <li>&emsp;Una vez que se tenga la imagen con el nombre de "telnetssh", es necesario crear un contenedor a partir de esa imagen.</li>
    <li>&emsp;Para correr el contenedor, es necesario forwardear los puertos necesarios. El comando es el siguiente:</li>
    <p>&emsp;$docker run -itd -p 2200:22 -p 2300:23 telnetssh</p>
    <p>&emsp;Se seleccionaron los puertos 2200 y 2300 para forwardear a los puertos 22 (SSH) y 23 (Telnet), respectivamente</p>
  </ol>
  FASE COMPROBACIÓN (CORRER TELNET Y SSH)
  <ol>
    <li>&emsp;Es importante revisar que tel contenedor esté corriendo correctamente. Esto se puede hacer con el siguiente comando:</li>
    <p>&emsp;$docker container ls</p>
    <li>&emsp;Una vez que se ha comprobado que el contenedor está corriendo correctamente, es necesario probarlo abriendo una nueva terminal y   abriendo los servicios   con los siguientes comandos:</li>
    <ol>
      <li>&emsp;$ssh test@localhost --p 22</li>
      <li>&emsp;$telnet localhost 23</li>
      <p>&emsp;Para ambos casos tanto el usuario como la contraseña serán "test"</p>
    </ol>
  </ol>
</div>

<div align="center">
    <h3> ¡Listo! Los servicios ya deben de estar funcionando correctamente.</h3>
</div>

