#!/bin/bash

source env.sh

dst_dir=$rsrc/$unzip_base_dir_pdb

if [ ! -e $dst_dir ] ; then
 echo $dst_dir not found.
 exit 1
fi

if [ -z $location_pdb ] ; then
 echo location_pdb is not set.
 exit 1
fi

if [ -e $location_pdb ] ; then
 echo
 echo $location_pdb already exists.
 echo "Do you want to refresh the persistent cache files? (y/n [n]) ? "

 read ans

 case $ans in
  y*|Y*) ;;
  *)
   echo stopped.
   exit 1;;
 esac

 rm -rf $location_pdb

fi

mkdir -p $location_pdb

find $dst_dir/* -type d > pdb_folder_list

while read folder ;
do

 echo $folder

 oxigraph_server --location $location_pdb load --format $format --file $folder/*.rdf

done < pdb_folder_list

rm -f pdb_folder_list

