#!/bin/bash

if [ -n "$1" ];then
	IP3=$1
else
	IP3=77
fi

function pingx(){
    echo $1
    for i in {2..254}
    do
    	{
    		ping -c 1 192.168.$1.$i > /dev/null
    		if [ $? -eq 0 ];then
    			echo 192.168.$1.$i
    		fi
    	}&
    done
    wait
}

if [ ${IP3} -eq 0 ];then
    for j in {2..254}
    do
        {
            pingx $j
        }&
    done
    wait
else
    pingx $IP3
fi

echo finish...
