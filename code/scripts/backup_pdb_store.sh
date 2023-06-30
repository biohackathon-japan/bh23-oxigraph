#!/bin/bash

source env.sh

if [ -z $location_pdb ] ; then
 echo location_pdb is not set.
 exit 1
fi

if [ ! -e $location_pdb ] ; then
 echo $location_pdb does not exist.
 exit 1
fi

rm -rf $backup_loc_pdb

oxigraph_server backup --location $location_pdb --destination $backup_loc_pdb

