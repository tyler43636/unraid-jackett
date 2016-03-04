# Application
[Jackett](https://github.com/Jackett/Jackett)

# Description
Jackett works as a proxy server: it translates queries from apps (Sonarr, SickRage, CouchPotato, Mylar, etc) into tracker-site-specific http queries, parses the html response, then sends results back to the requesting software. This allows for getting recent uploads (like RSS) and performing searches. Jackett is a single repository of maintained indexer scraping & translation logic - removing the burden from other apps.

# Access application
`http://<host ip>:9117`

# Run the application
The ```PUID``` and ```PGID``` values are not necessary for unRAID 6.
## Usage
Please replace all user variables in the below command defined by ```<>``` with the correct values.
```
docker run -d \
  --name=<container name> \  
  -v <path for config files>:/config \
  -v /etc/localtime:/etc/localtime:ro \
  -p <port>:9117 \
  -e PUID=<uid for user> \
  -e PGID=<gid for user> \
  tyler43636/unraid-jackett
```

## Example
```
docker run -d \
  --name=jackett \
  -v /config:/config \
  -v /etc/localtime:/etc/localtime:ro \
  -p 9117:9117 \
  -e PUID=99 \
  -e PGID=100 \
  tyler43636/unraid-jackett
```

# Notes
User ID (PUID) and Group ID (PGID) can be found by issuing the following command for the user you want to run the container as:
```
id <username>
```
