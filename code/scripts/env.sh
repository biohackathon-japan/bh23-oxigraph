#!/bin/bash

cur_dir=`pwd`

# locations of triple store
## PDB/RDF
location_pdb=$cur_dir/pdb
## chem_comp/RDF
location_cc=$cur_dir/cc

# destintions of backuped triple store
## PDB/RDF
backup_loc_pdb=$cur_dir/pdb_bk
## chem_comp/RDF
backup_loc_cc=$cur_dir/cc_bk

# common directory for RDF resources (retrieved or uncompressed)
rsrc=$cur_dir/rsrc

rsync_base_dir_pdb=RDF
rsync_base_dir_cc=RDF-chem_comp

unzip_base_dir_pdb=uncompressed_pdb_rdf
unzip_base_dir_cc=uncompressed_cc_rdf

# MIME type of RDF/XML format
format=application/rdf+xml

# maximum number of uncompressed RDF files in a subdirectory
# that enables Oxigraph to load RDF file in parallel
max_files_in_folder=25

# 206656 PDB entries are available as of 2023-06-28
max_pdb_rdf_files=10026

# Port number assignments
oxi_serve_port_pdb=8080
oxi_serve_port_cc=8081

