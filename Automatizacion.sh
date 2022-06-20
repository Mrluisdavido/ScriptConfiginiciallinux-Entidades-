#!/bin/bash
#programa diseñado para hacer la configuracion inicial de un sistema operativo linux en empresas con configuraciones especificas.
#Este escript lleva las configuraciones iniciales tales como, asignacion de ip, agregacion de certificados, agregacion de proxys, añadidura de el equipo al directorio activo.
#Autor: Luis Oviedo

opcion=0
Proxy=10.23.224.75

while :
do 
	#limipiar la pantalla
	clear
	#Despliegue de menu de opciones
	echo "
	~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	~  Programa de configuracion del sistema ~
	~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	~           Menu Principal               ~
	~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	1. Asignación de IP.
	2. Configuración de Certificados.
	3. Configurar proxy para paqueteria apt.
	4. Revision de red
	5. Configurar Variables de Entorno
	6. Informacion de Paquetes (instalados)
	7. Estado de un programa
	8. Backup informacion
	9. Añadir equipo al dominio.

	#leer los datos del usuario -capturar informacion
	echo "\n"
	read -p "        Ingrese una opción [1-8]: " opcion

	#validar la opción ingresada
	case $opcion in 
		1)
			echo  "        Asignacion de IP para el equipo ...."
			sleep 3
			read -p "ingrese la IP a asignar: "ip
			echo 
			top
			sleep 10
			;;
		2)
			echo "         Mostrando Memoria Disponible...."
			sleep 3
			free -h 
			sleep 10
			;;
		3)
			echo "         Mostrando Espacio en el Disco...."
			sleep 3
			df -h
			sleep 10
			;;
		4)
			echo "         Mostrando Información de Red...."
			sleep 3
			ifconfig -a
			sleep 10
			;;
		5)
			echo "         Mostrando Variables de Entorno Configuradas...."
			sleep 2
			clear
			env -u VAR
			sleep 10
			;;
		6)
			echo "         Mostrando paquetes instalados...."
			sleep 2
			dpkg -l
			sleep 20
			;;
		7)
			read -p "      Que programa desea comprobar?: " programa
			systemctl status $programa 
			sleep 5
			;;
		8)
			echo "         Haciendo backup de Información...."
			sleep 2
			sudo tar -zvcf backuphome.tar.gz /home/
			sleep 10
			echo "         Backup Realizado con Exito!, guardado en la carpeta tal."
			sleep 5
			;;
		9)
			echo "         Capturando Información...."
			sleep 2
			echo "         La Opcion anterior fue: $opcion"
			exit
			;;
	esac
done
