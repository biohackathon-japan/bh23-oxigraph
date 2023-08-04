#!/bin/bash

source env.sh

dst_dir=$rsrc/$rsync_base_dir_bird

if [ ! -e $dst_dir ] ; then
 echo $dst_dir not found.
 exit 1
fi

if [ -z $location_bird ] ; then
 echo location_bird is not set.
 exit 1
fi

if [ -e $location_bird ] ; then
 echo
 echo $location_bird already exists.
 echo "Do you want to refresh the persistent cache files? (y/n [n]) ? "

 read ans

 case $ans in
  y*|Y*) ;;
  *)
   echo stopped.
   exit 1;;
 esac

 rm -rf $location_bird

fi

mkdir -p $location_bird

find $dst_dir/*/* -type d > bird_folder_list

while read folder ;
do

 echo $folder

 oxigraph_server --location $location_bird load --format $format --file $folder/*.rdf.gz

done < bird_folder_list

rm -f bird_folder_list

