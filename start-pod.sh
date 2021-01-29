docker run -d -v gvmd-pgdb:/var/lib/postgresql/data -v pgrun:/run/postgresql --name pg immauss/gvm-pg:alpine12
docker run -d -v openvas:/data -v gvmd-pgdb:/var/lib/postgresql/data  -v pgrun:/run/postgresql -v gvmd-pgdb:/var/lib/postgresql/12/main -p 9392:9392 --name openvas --link pg immauss/openvas:20.08.04 && docker logs -f openvas
