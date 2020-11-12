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
    <img src="images/logo.png" alt="Logo" >
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

* [Sobre el proyecto](#Sobre)
* [Comenzando](#Comenzando)
  * [Prerequisitos](#Prerequisitos)
  * [Instalacion](#Instalacion)
* [Ejemplos de Uso](#uso)
* [Contribuir](#contribuir)
* [Licencia](#licencia)
* [Contacto](#contacto)
* [Agradecimientos](#agradecimientos)



<!-- Sobre el proyecto -->
## Sobre

Script usado para obtener diferentes valores de las tareas de VEEAM BACKUP


<!-- COMENZANDO -->


### Prerequisitos

Debemos tener instalado Powershell y el modulo de administracion de VEEAM BACKUP


### Instalacion

1. Clonar el repositorio en la carpeta de scripts de pandorafms
```sh
git clone https://github.com/franciscotudel-overtel/pandorafms_veeam
```
2. Hacerse con la lista de tareas programadas en veeam con el siguiente comando
```sh
%SystemRoot%\system32\WindowsPowerShell\v1.0\powershell.exe -nologo -command C:\zabbix\scripts_pandorafms\vb_job.ps1 ListCSV

BCK_1;0;25fe1987-acc2-1c5a-be4a-00a629487561;
BCK_2;0;d9c799c4-2d33-2641-a2db-116aa917078c;
```
3. Guardar el UUID de la tarea a monitorizar
```JS
d9c799c4-2d33-2641-a2db-116aa917078c
```

4. Comenzar a poner modulos al agente, por ejemplo el modulo que devuelve el ultimo resultado de la tarea



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

