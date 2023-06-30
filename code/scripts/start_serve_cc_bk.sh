#!/bin/bash

source env.sh

oxigraph_server serve-read-only --location $backup_loc_cc --bind 0.0.0.0:$backup_loc_cc

