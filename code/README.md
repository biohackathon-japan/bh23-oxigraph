# Supplementary code

This directory contains configuration files, scripts, and queries to deploy and evaluate PDB/RDF and chem_comp/RDF triple store endpoints in your local PC using Oxigraph server. 

## Usage

- Retrieving the latest PDB/RDF and chem_comp/RDF archives<br />
    `./rsync_pdb_rdf.sh` which retrieves the whole PDB/RDB archive by default (about 10B triples), If you don’t want complete data set, please terminate the process by manual.  
    `./rsync_cc_rdf.sh` which retrieves chem_comp/RDF archive including 8M triples in total.

- Uncompressing all gzip files and prepare bulk uploads
```bash
    ./unzip_pdb_rdf.sh
    ./unzip_cc_rdf.sh
```
- Loading RDF/XML files in parallel
```bash
    ./load_pdb_rdf.sh
    ./load_cc_rdf.sh
```
- Starting Oxigraph servers in read-only mode
```bash
    ./start_serve_pdb.sh # localhost:8080 port
    ./start_serve_cc.sh  # localhost:8081 port
```
- Run reverse proxy server using Caddy
```bash
    caddy run --config ../configuration_files/Caddyfile --adapter caddyfile
```

- Access localhost/pdb and localhost/cc via your browser for each endpoint

## Software requirements

- [**Oxigraph server**](https://github.com/oxigraph/oxigraph)
- [**Caddy**](https://caddyserver.com), for deployment of multiple endpoints.

## Release notes

- **June 30, 2023**: Release v0.0.1
    - Initial release
