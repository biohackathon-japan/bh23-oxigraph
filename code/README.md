# Supplementary code

This directory contains configuration files, scripts, and queries to deploy and evaluate PDB/RDF, chem_comp/RDF, and BIRD/RDF triple store endpoints in your local PC using Oxigraph server. 

## Usage

- Retrieving the latest PDB/RDF, chem_comp/RDF, and BIRD/RDF archives<br />
    `./rsync_pdb_rdf.sh` which retrieves PDB/RDB archive by default (about 10B triples), If you don’t want the whole dataset, please terminate the process by manual.  
    `./rsync_cc_rdf.sh` which retrieves chem_comp/RDF archive including 8M triples in total.
    `./rsync_bird_rdf.sh` which retrieves BIRD/RDF archive including 0.4M triples in total.

- Loading RDF/XML files in parallel
```bash
    ./load_pdb_rdf_gz.sh
    ./load_cc_rdf_gz.sh
    ./load_bird_rdf_gz.sh
```
- Starting Oxigraph servers in read-only mode
```bash
    ./start_serve_pdb.sh   # localhost:8080 port
    ./start_serve_cc.sh    # localhost:8081 port
    ./start_serve_bird.sh  # localhost:8082 port
```
- Run reverse proxy server using Caddy
```bash
    caddy run --config ../configuration_files/Caddyfile --adapter caddyfile
```

Please access http://localhost/pdb, http://localhost/cc, or http://localhost/bird for endpoint GUIs. Endpoints are http://localhost/pdb/query, http://localhost/cc/query, and http://localhost/bird/query, respectively.

## Software requirements

- [**Oxigraph server**](https://github.com/oxigraph/oxigraph)
- [**Caddy**](https://caddyserver.com), for deployment of multiple endpoints.

## Release notes

- **June 30, 2023**: Release v0.0.1
	- Initial release

- **August 4, 2023**: Release v0.0.2
	- Use Oxigraph server's native file decompression capabilities instead of explicit gzip decompressions
	- Add support for BIRD/RDF
