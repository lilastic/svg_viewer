# DESCRIPTION
The SVG Viewer is a web-based application for displaying process variables (PVs) stored by the [EPICS Archiver Appliance](https://epicsarchiver.readthedocs.io/).

# USAGE
For the SVG Viewer application to work properly, it needs to connect to an EPICS Archiver Appliance instance. If an instance is running on the local machine, the SVG Viewer should work straightforwardly. However, if the instance is running remotely, requests need to be proxied through a reverse proxy. Two functionally equivalent approaches are available:

## 1. viewerProxy.py
This is a Python script that enables reverse proxying from the SVG Viewer to a remote Archiver Appliance instance. To run the script, open a terminal and execute:
```
python viewerProxy.py
```
By default, the script listens on port ```8080``` and forwards requests to the local host. If the Archiver Appliance instance is located elsewhere and/or listens on a different port, additional parameters can be provided to configure the script accordingly. For example:
```
python viewerProxy.py --retrievalURL http://remote-archiver-appliance.ess.eu:17668/retrieval --port 7878
```

## 2. nginx.conf
This is a configuration file for [NGINX](https://nginx.org/) that enables reverse proxying from the SVG Viewer to a remote Archiver Appliance instance. Before running NGINX, update the following placeholders in the configuration file as needed:

- ```<listening_port>``` with the port on which NGINX listens for incoming requests (e.g. ```listen 9999;```)
- ```<host_name>``` and ```<host_port>``` with the host name and port of the (remote) Archiver Appliance instance (e.g. ```proxy_pass http://remote-archiver-appliance.ess.eu:17668/retrieval/;```)

To start NGINX with this configuration, open a terminal and execute:
```
nginx -c nginx.conf
```

