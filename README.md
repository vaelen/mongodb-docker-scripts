# mongodb-docker-scripts
Scripts for starting mongodb instances in Docker.

These are very basic scripts, nothing fancy here.
The purpose of these scripts is for testing out sharded clusters locally.
Honestly, you might be better served with the mlaunch script from mtools, depending on what you need to do.

The nodes that these scripts create communciate over a shared docker network. 
This gives you DNS for the nodes. 
You will need to create this network before running the scripts by running:

```bash
docker network create mongo-network
```
