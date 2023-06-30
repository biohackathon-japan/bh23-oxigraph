#!/bin/bash

source env.sh

find $rsrc/$rsync_base_dir_cc -name "*.rdf.gz" > cc_file_list

dst_dir=$rsrc/$unzip_base_dir_cc

if [ -e $dst_dir ] ; then

 echo
 echo $dst_dir already exists.
 echo "Do you want to refresh the uncompressed files? (y/n [n]) ? "

 read ans

 case $ans in
  y*|Y*) ;;
  *)
   echo stopped.
   exit 1;;
 esac

 rm -rf $dst_dir

fi

mkdir -p $dst_dir

file_count=0
folder_count=1

while read rdf_gz_file ;
do

 echo $rdf_gz_file

 rdf_file=`basename $rdf_gz_file .gz`

 div_dir=$dst_dir/$(printf "%06d" "${folder_count}")

 if [ ! -e $div_dir ] ; then
  mkdir $div_dir
 fi

 gunzip -c $rdf_gz_file > $div_dir/$rdf_file

 let file_count++

 if [ "$file_count" -ge "$max_files_in_folder" ] ; then
  let folder_count++
  file_count=0
 fi

done < cc_file_list

rm -f cc_file_list

