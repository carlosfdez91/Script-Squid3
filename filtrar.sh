# -*- coding: utf-8 -*-
import sys

# Opcion: Añadir con (-a), borrar (-d).
# Tipo: -url o -dom.
# Añadimos el tipo de dato, en este caso url o dominio.

opcion = sys.argv[1]
tipo = sys.argv[2]
dato = sys.argv[3]

if opcion == "-a":
	if tipo == "-url":
		fichero = open("/etc/squid3/urlnegro.acl","a")
		fichero.write(dato+"\n")
		fichero.close
		print "La url se ha añadido"
	elif tipo == "-dom":
		fichero = open("/etc/squid3/dominionegro.acl","a")
		fichero.write(dato+"\n")
		fichero.close
		print "El dominio se ha añadido"
elif opcion == "-d":
	if tipo == "-url":
		fichero = open("/etc/squid3/urlnegro.acl","r")
		lineas = fichero.readlines()
		fichero.close
		for linea in lineas:
			if linea == dato+"\n":
				fichero = open("/etc/squid3/urlnegro.acl","w")
				lineas.remove(dato+"\n")
				for linea in lineas:
					fichero.write(linea)
				fichero.close
				print "La url se ha borrado"
	elif tipo == "-dom":
		fichero = open("/etc/squid3/dominionegro.acl","r")
		lineas = fichero.readlines()
		fichero.close
		for linea in lineas:
			if linea == dato+"\n":
				lineas.remove(dato+"\n")
				fichero = open("/etc/squid3/dominionegro.acl","w")
				for linea in lineas:
					fichero.write(linea)
				fichero.close
				print "El dominio se ha borrado"
	else:
		print "Introduce un tipo correcto."
else:
	print "Introduce una opcion correcta."
