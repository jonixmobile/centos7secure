#! /bin/bash

echo "Configura tu Docker: "
echo "Indica el nombre del container:"
read nombre
echo "Uso maximo de CPU: (desde 1 a 1024)"
read cpu
echo "Cantidad de memoria asignada: (indicada en mb, mínimo 4mb)"
read mem
echo "Puerto SSH:"
read port

docker run -d --cpu-shares $cpu -m $mem"m" -p $port:22 --name $nombre centos7secure

echo "Have a nice docker!"
