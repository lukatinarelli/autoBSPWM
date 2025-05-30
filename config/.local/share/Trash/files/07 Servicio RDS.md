# Introducción: 
- #### Servicio de Base de Datos **Relacional**
- #### Servicio para que las BBDD utilicen **SQL** como lenguaje de consulta
- #### BBDD permitidas:
	- ##### Postres
	- ##### MySQL
	- ##### MariaDB
	- ##### Microsoft SQL Server
	- ##### Aurora (base de datos propia AWS)
# RDS vs EC2
- #### El RDS es un servicio **gestionado**
	- ##### Aprovisionamiento automatizado, parcheo del SO
	- ##### **Copias de seguridad** continuas y restauración a una fecha determinada (**Point in Time Restore**)
	- ##### Dashnoards de **monitorización**
	- ##### Réplicas de lectura para **mejorar el rendimiento de lectura**
	- ##### Configuración **multi AZ** para DR (Disaster Recovery)
	- ##### **Ventanas de mantenimiento** para actualizaciones
	- ##### Capacidad de **escalado** (vertical y horizontal)
	- ##### **Almacenamiento espadado** por EBS (gp2 o io 1)
- #### NO podemos acceder por SSH
# Arquitectura RDS
- #### Cualquiera de las instancias con permisos puede acceder a la BBDD y hacer lecturas y escrituras
# Amazon Aurora
- #### Permite ejecutar tanto PostgreSQL y MySQL
- #### **NO es de código abierto**
- #### **Mejora el rendimiento** de 3 a 5 veces respectivamente
- #### Almacenamiento en incrementos de **10GB hasta 128TB**
- #### **Más caro** que RDS (20% +)
- #### **NO es gratuita**
# Opciones despliegue RDS
## 1. Replicas de lectura
- #### Escala la **carga de trabajo** de lectura
- #### Hasta **15 replicas**
- #### **Solo** se escribirá en la **BBDD principal**
- #### Las replicas de lectura solo serán de lectura, si se quiere escribir tendrá que ser a la BBDD principal
## 2. Multi AZ
- #### **Recuperación** en caso de caída  de la AZ
- #### Los datos sólo se leen/escriben en la **DB principal**
- #### Sólo se puede tener **otra AZ como conmutación por error**
## 3. Multi-Región
- #### **Recuperación de desastres** en caso de problema de región
- #### **Rendimiento local** para lecturas globales
- #### Coste de replicación