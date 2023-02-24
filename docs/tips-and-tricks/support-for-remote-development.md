---
title: "Support for VS Code Remote Development"
---

# {{ page.title }}

You can take advantage of [VS Code Remote Development](https://code.visualstudio.com/docs/remote/remote-overview) support to create a remote Db2 Developer Extension development environment. 
 
**Notes:**
- The initial support for creating a remote Db2 Developer Extension development environment is not comprehensive and some features might not work as expected. For example, currently only the use of containers and ssh have been tested and validated. You might be able to set up a remote Db2 Developer Extension in other environments by using Windows Subsystem for Linux (WSL) or GitHub Codespaces, but these environments have not yet been tested.

- Remote development using Db2 Developer Extension requires the [prerequisites](https://github.com/IBM/db2forzosdeveloperextension-about#prerequisites-for-installing-db2-developer-extension) for Db2 Developer Extension to be installed on the remote development environment rather than on the local environment (except libsecret if you are running Db2 Developer Extension on Linux).

- To debug a stored procedure in a remote development environment that uses containers, you must complete the following additional configuration steps to establish communication between the Db2 subsystem that you're connected to and the Db2 debugger session manager:
  1. Edit the `devcontainer.json` file and add the following arguments:
     ```
     "runArgs": [
         "--net=host",
         "--add-host=docker:<host_ip_address>",
         "--hostname=docker"
     ]
     ```     
     where:
    - `--net=host` allows processes that run inside the container to share the host's network namespace.
    - `--add-host=docker:<host_ip_address>` adds a hostname mapping to the IP address inside the container.
    - `--hostname=docker` indicates to the container what the hostname is.
  
  2. Start the remote container session, then open your Visual Studio Code settings and change the **Remote local port host** setting to **allInterfaces**:

     ![Remote local port host setting]({{site.baseurl}}/assets/images/tips-tricks-remote-development-settings-for-debugger.png)
