<!--
*** Thanks for checking out this README Template. If you have a suggestion that would
*** make this better, please fork the repo and create a pull request or simply open
*** an issue with the tag "enhancement".
*** Thanks again! Now go create something AMAZING! :D
-->





<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]
[![LinkedIn][linkedin-shield]][linkedin-url]



<!-- PROJECT LOGO -->
<br />
<p align="center">
  <a href="https://www.overtel.com">
    <img src="images/logo.png" alt="Logo Overtel" >
  </a>
  <a href="https://pandorafms.com/">
    <img src="images/pandorafms_logo.png" alt="Logo PandoraFMS" >
  </a>
  <a href="https://www.veeam.com/es/vm-backup-recovery-replication-software.html">
    <img src="images/veeam_green_logo.svg" alt="Logo Veeam" >
  </a>

  <h3 align="center">Modulos para pandorafms y Veeam Backup</h3>

  <p align="center">
    Modulos para leer el estado de tareas de Veeam Backup y ser usados como modulos en pandorafms
    <br />
    <a href="https://github.com/franciscotudel-overtel/pandorafms_veeam/issues">Reportar un Bug</a>
    ·
    <a href="https://github.com/franciscotudel-overtel/pandorafms_veeam/issues">Requerir una nueva caracteristica</a>
  </p>
</p>



<!-- TABLE OF CONTENTS -->
## Tabla de contenido

* [Acerca de](#Acerca)
* [Comenzando](#Comenzando)
  * [Prerequisitos](#Prerequisitos)
  * [Instalacion](#Instalacion)
* [Ejemplos de Uso](#uso)
* [Contribuir](#contribuir)
* [Licencia](#licencia)
* [Contacto](#contacto)
* [Agradecimientos](#agradecimientos)



<!-- Sobre el proyecto -->
## Acerca de

*Pandora FMS* es un software de código abierto que sirve para monitorear (monitorizar) y medir todo tipo de elementos. Monitoriza sistemas, aplicaciones o dispositivos de red. Permite conocer el estado de cada elemento de un sistema a lo largo del tiempo ya que dispone de histórico de datos y eventos. Pandora FMS está orientado a grandes entornos, y permite gestionar con y sin agentes, varios miles de sistemas, por lo que se puede emplear en grandes clusters, centros de datos y redes de todo tipo.

*Veeam Backup & Replication* es un software de copia de seguridad de datos y plan de recuperación ante desastres para máquinas virtuales de VMware vSphere y Microsoft Hyper V.

Este repositorio pretende facilitar la tarea de recoger datos de las tareas de Veeam Backup asi como de los repositorios para luego poder usarlos en Pandora FMS y con ellos obtener graficos de uso así como poder enviar alarmas en caso de que fallen.


<!-- COMENZANDO -->


### Prerequisitos

En el servidor donde este instalado Veeam Backup, debemos tener instalado Powershell y el modulo de administracion de veeam backup. Este suele instalarse por defecto.


### Instalacion

1. Clonar el repositorio en la carpeta de scripts de pandorafms
```sh
cd c:\
cd pandorafms
mkdir scripts
cd scripts
git clone https://github.com/franciscotudel-overtel/pandorafms_veeam
```
2. Debemos hacernos con la lista de tareas programadas en veeam con el siguiente comando desde una consola de ms-dos. En el siguiente ejemplo se puede ver como obtener la lista de tareas y el identificador de cada una de ellas, necesario para las posteriores llamadas al script de las tareas.
```sh
%SystemRoot%\system32\WindowsPowerShell\v1.0\powershell.exe -nologo -Noprofile -ExecutionPolicy Bypass -command C:\pandorafms\scripts\vb_job.ps1 ListCSV

BCK_1;0;25fe1987-acc2-1c5a-be4a-00a629487561;
BCK_2;0;d9c799c4-2d33-2641-a2db-116aa917078c;
```
3. Guardar el UUID de la tarea a monitorizar
```JS
d9c799c4-2d33-2641-a2db-116aa917078c
```

4. Comenzar a poner modulos al agente, para ello podemos seguir el manual del fabricate [aqui](https://pandorafms.com/docs/index.php?title=Pandora:Documentation_es:Configuracion_Agentes) o editar directamente el fichero pandora_agent.conf que estará en la carpeta de instalación del agente. Por ejemplo el módulo que devuelve el ultimo resultado de la tarea *d9c799c4-2d33-2641-a2db-116aa917078c* se configuraría así
```
module_begin
module_name Veeam Backup - Job Copia_Ejemplo_1 - Resultado
module_type generic_data_string
module_exec %SystemRoot%\system32\WindowsPowerShell\v1.0\powershell.exe -nologo -Noprofile -ExecutionPolicy Bypass -command C:\pandorafms\scripts\vb_job.ps1 ListCSV
module_description Veeam Backup - Job Copia_Ejemplo_1 - Ultimo resultado de la ejecucion de la tarea
module_crontab 45 * * * *
module_timeout 50
module_end
```


<!-- USAGE EXAMPLES -->
## Uso

#Modulo Jobs
Lista todas las tareas programadas en Veeam Backup de la maquina local

```
module_begin
module_name Veeam Backup - Jobs
module_type generic_data_string
module_exec %SystemRoot%\system32\WindowsPowerShell\v1.0\powershell.exe -nologo -command C:\zabbix\scripts_pandorafms\vb_job.ps1 ListCSV
module_description Lista de Tareas
module_crontab 45 * * * *
module_timeout 50
module_end
```


<!-- LICENCIA -->
## Licencia

Distribuido con the GNU General Public License v3.0. Ver `LICENSE` para mas informacion.



<!-- CONTACTO -->
## Contacto

Project Link: [https://github.com/franciscotudel-overtel/pandorafms_veeam](https://github.com/franciscotudel-overtel/pandorafms_veeam)



<!-- AGRADECIMIENTOS -->
## Agradecimientos
* [Jean-Jacques Martrès](https://github.com/jjmartres)



<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/franciscotudel-overtel/pandorafms_veeam.svg?style=flat-square
[contributors-url]: https://github.com/franciscotudel-overtel/pandorafms_veeam/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/francisco-tudel-escalona-44076069/pandorafms_veeam.svg?style=flat-square
[forks-url]: https://github.com/franciscotudel-overtel/pandorafms_veeam/network/members
[stars-shield]: https://img.shields.io/github/stars/francisco-tudel-escalona-44076069/pandorafms_veeam.svg?style=flat-square
[stars-url]: https://github.com/franciscotudel-overtel/pandorafms_veeam/stargazers
[issues-shield]: https://img.shields.io/github/issues/francisco-tudel-escalona-44076069/pandorafms_veeam.svg?style=flat-square
[issues-url]: https://github.com/franciscotudel-overtel/pandorafms_veeam/issues
[license-shield]: https://img.shields.io/github/license/francisco-tudel-escalona-44076069/pandorafms_veeam.svg?style=flat-square
[license-url]: https://github.com/franciscotudel-overtel/pandorafms_veeam/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=flat-square&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/francisco-tudel-escalona-44076069

