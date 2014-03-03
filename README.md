saam-lod
========

This repository contains the Karma mapping files that define the mapping of the Smithsonian American Art Museum (SAAM) collection metadata to CIDOC CRM.

The repository contains the following information:
- crm-models: the Karma mapping files used to map the SAAM database tables to CRM. The mapping files are used in the Karma software to generate the RDF files.
- datasets: sample data files from the SAAM database that can be used to test the mapping files in Karma without access to the SAAM database.
- preloaded-ontologies-crm: the ontologies used in the mapping process, including the CRM ontology and additional ontologies used for the mapping.
- scripts: batch scripts that produce the complete set of RDF files (requires a connection to SQL Server hosting the SAAM data)
- n3: directory containing the links from SAAM URIs to DBPedia, Wikipedia and NYTimes.

The [Wiki](https://github.com/InformationIntegrationGroup/saam-lod/wiki) contains full documentation of the mappings. Each page describes how each field in the SAAM database tables is mapped to CRM, a graphical representation of each mapping and sample RDF.


