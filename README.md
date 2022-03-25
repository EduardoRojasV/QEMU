# Emulación de la placa Raspberry PI 3B+ de forma nativa - QEMU

A continuación, se detallan las instrucciones para realizar la emulación de la placa Raspberry Pi 3B+ de forma nativa
con el proyecto QEMU en un sistema operativo GNU/Linux. En el repositorio encontrarás los siguientes scripts que
automatizan la compilación, instalación y ejecución de la versión de QEMU 6.2.0.

# Dependencias

Es necesario que antes de compilar una versión de QEMU se cumplan con las dependencias recomendadas por https://wiki.qemu.org/Documentation
para distribuciones Debian y sus derivadas. El script dependencies.sh automatiza esta tarea.

Nota: Se ejecuto y probó en Ubuntu 20.04 LTS.

# Compilación e Instalación

La ejecución del script install.sh realiza dos tareas, compilación e instalación. Antes de iniciar la tarea de 
compilación primero se crea la estructura de directorios en la cual se descarga, descomprime, compila e instala 
QEMU a partir de su código fuente, posterior a esto se comienza  la tarea de compilación.

Una vez concluyó con éxito la compilación de QEMU, se inicia la tarea de instalación del mismo. Es importante 
mencionar que la instalación se realizó dentro del directorio qemu-6.2.0 (este paso se realiza así por comodidad 
y buena práctica, para mantener un mejor orden de lo que compilamos e instalamos en nuestro sistema) que se
encuentra en la estructura de directorios que fueron creados antes de la compilación. En este directorio se encuentran
los binarios y demás ficheros necesarios para la ejecución de QEMU 6.2.0, pero también se encuentran tres archivos 
configure-build-qemu-6.2.0, configure-help-build-qemu-6.2.0 y installed-qemu-6.2.0 que tienen información relacionada
a la compilación e instalación del mismo.

Nota: La ruta de instalación es la asignada en la variable PATH_TO(/home/$(whoami)/QEMU)

# Ejecución
  
Para probar y ejecutar una emulación de forma nativa de la raspberry Pi 3B+, se debe ejecutar el script start.sh 
el cual requiere se cumplan dos requisitos importantes.
  
  1. La ruta a los binarios de QEMU 6.2.0 (Variable QEMU) coincida con a la ruta de instalación.

    Ejemplo: QEMU=/home/$(whoami)/QEMU/qemu-6.2.0/bin/qemu-system-aarch64

  2. Que se encuentre el disco raspios.img y el directorio bootpart en el mismo directorio donde sé está ejecutando el script.

Nota: La versión de sistema operativo instalado en el disco raspios.img es raspios buster armhf lite.

  Usuatio : pi
  Password: glintec

  Ejemplo para conexión SSH:
    ~$ ssh pi@127.0.0.1 -p 5022
