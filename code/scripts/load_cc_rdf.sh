#!/bin/bash

source env.sh

dst_dir=$rsrc/$unzip_base_dir_cc

if [ ! -e $dst_dir ] ; then
 echo $dst_dir not found.
 exit 1
fi

if [ -z $location_cc ] ; then
 echo location_cc is not set.
 exit 1
fi

if [ -e $location_cc ] ; then
 echo
 echo $location_cc already exists.
 echo "Do you want to refresh the persistent cache files? (y/n [n]) ? "

 read ans

 case $ans in
  y*|Y*) ;;
  *)
   echo stopped.
   exit 1;;
 esac

 rm -rf $location_cc

fi

mkdir -p $location_cc

find $dst_dir/* -type d > cc_folder_list

while read folder ;
do

 echo $folder

 oxigraph_server --location $location_cc load --format $format --file $folder/*.rdf

done < cc_folder_list

rm -f cc_folder_list

