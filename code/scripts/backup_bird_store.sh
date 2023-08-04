#!/bin/bash

source env.sh

if [ -z $location_bird ] ; then
 echo location_bird is not set.
 exit 1
fi

if [ ! -e $location_bird ] ; then
 echo $location_bird does not exist.
 exit 1
fi

rm -rf $backup_loc_bird

oxigraph_server backup --location $location_bird --destination $backup_loc_bird

