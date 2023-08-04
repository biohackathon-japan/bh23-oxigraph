#!/bin/bash

cur_dir=`pwd`

# locations of triple store
## PDB/RDF
location_pdb=$cur_dir/pdb
## chem_comp/RDF
location_cc=$cur_dir/cc
## BIRD/RDF
location_bird=$cur_dir/bird

# destintions of backuped triple store
## PDB/RDF
backup_loc_pdb=$cur_dir/pdb_bk
## chem_comp/RDF
backup_loc_cc=$cur_dir/cc_bk
## BIRD/RDF
backup_loc_bird=$cur_dir/bird_bk

# common directory for RDF resources (retrieved or uncompressed)
rsrc=$cur_dir/rsrc

rsync_base_dir_pdb=RDF
rsync_base_dir_cc=RDF-chem_comp
rsync_base_dir_bird=RDF-bird

# @deprecated: use load_pdb_rdf_gz.sh, instead of unzip_pdb_rdf.sh and load_pdb_rdf.sh,
unzip_base_dir_pdb=uncompressed_pdb_rdf
# @deprecated: use load_cc_rdf_gz.sh, instead of unzip_cc_rdf.sh and load_cc_rdf.sh,
unzip_base_dir_cc=uncompressed_cc_rdf

# MIME type of RDF/XML format
format=application/rdf+xml

# maximum number of uncompressed RDF files in a subdirectory
# that enables Oxigraph to load RDF file in parallel
# @deprecated:
max_files_in_folder=25

# 206656 PDB entries are available as of 2023-06-28
# @deprecated:
max_pdb_rdf_files=10026

# Port number assignments
oxi_serve_port_pdb=8080
oxi_serve_port_cc=8081
oxi_serve_port_bird=8082

