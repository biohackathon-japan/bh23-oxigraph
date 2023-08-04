#!/bin/bash

source env.sh

oxigraph_server serve-read-only --location $location_bird --bind 0.0.0.0:$oxi_serve_port_bird

