#!/bin/bash

source env.sh

if [ -z $location_cc ] ; then
 echo location_cc is not set.
 exit 1
fi

if [ ! -e $location_cc ] ; then
 echo $location_cc does not exist.
 exit 1
fi

rm -rf $backup_loc_cc

oxigraph_server backup --location $location_cc --destination $backup_loc_cc

