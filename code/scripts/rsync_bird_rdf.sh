#!/bin/bash

source env.sh

if [ ! -e $rsrc ] ; then
 mkdir -p $rsrc
fi

dst_dir=$rsrc/$rsync_base_dir_bird

if [ ! -e $dst_dir ] ; then
 mkdir -p $dst_dir
fi

rsync -av --delete rsync://bmrbpub.pdbj.org/rdf-bird/$rsync_base_dir_bird/* $dst_dir

