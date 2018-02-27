
# Rupaya Docker

The [Rupaya](https://github.com/rupaya-project/rupaya) Daemon and CLI in easy to use Docker Images

## Quick start

Requires that [Docker be installed](https://docs.docker.com/engine/installation/) on the host machine.

The Daemon and CLI have been seperated into 2 images allowing you to more easily run the daemon as a Masternode and the CLI to interact with it.

### To Run the Daemon
```
# Create a folder where your Rupaya Data will reside. This is important since the wallet will be stored here.
$ mkdir /home/youruser/rupaya_data


# Create an .env file and add an RPC user and Password.
$ PASSWORD=$(date +%s | sha256sum | base64 | head -c 60)
$ cat > rupaya.env <<EOF
RPCUSER=rupxrpcuser
|PASSWORD|
EOF

# Run the Daemon with the .env file
$ docker container run -d --name rupayad --env-file rupaya.env \  
    -p 9020:9020
    -v /home/youruser/rupaya_data:/rupaya
    palobo/rupaya:rupayad-4.0

# Alternatively, you can pass the environment variables in the run command
$ docker container run -d --name rupayad \
   --env 'RPCUSER=foo' \
   --env 'RPCPASSWORD=password' \
   -p 9020:9020 \
   -v /home/youruser/rupaya_data:/rupaya \
   palobo/rupaya/rupayad-4.0

# Check the logs
$ docker logs -f rupayad
[ ... ]
```

### To Run the CLI
```
# Use the .env file created earlier
$ docker container run -it --rm --link rupayad --env-file rupaya.env \  
    palobo/rupaya:rupaya-cli-4.0 [RUPAYA-CLI COMMANDS]

# Example
$ docker container run -it --rm --link rupayad --env-file rupaya.env \  
    palobo/rupaya:rupaya-cli-4.0 getinfo

# Alternatively, you can pass the environment variables in the run command
$ docker container run -d --name rupayad \
   --env 'RPCUSER=foo' \
   --env 'RPCPASSWORD=password' \
   palobo/rupaya:rupaya-cli-4.0 [RUPAYA-CLI COMMANDS]
```


## Configuration

A custom `rupaya.conf` file can be placed in the mounted data directory.
Otherwise, a default `rupaya.conf` file will be automatically generated based
on environment variables passed to the container or sane defaults:

| name | default |
| ---- | ------- |
|RPCUSER|rupayarpc|
|RPCPASSWORD|ChangeTHISrupayaPASSWORD|
|RPCPORT|7020|
|RPCALLOWIP|::/0|
|PRINTTOCONSOLE|1|