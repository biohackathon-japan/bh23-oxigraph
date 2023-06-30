#!/bin/bash

source env.sh

if [ ! -e $rsrc ] ; then
 mkdir -p $rsrc
fi

dst_dir=$rsrc/$rsync_base_dir_pdb

if [ ! -e $dst_dir ] ; then
 mkdir -p $dst_dir
fi

rsync -av --delete rsync://bmrbpub.pdbj.org/rdf-pdb/$rsync_base_dir_pdb/* $dst_dir

