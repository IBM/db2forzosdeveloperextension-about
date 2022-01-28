---
title: "Sharing connection definitions"
---

# {{ page.title }}

To make it easier for multiple users to connect to the same Db2 for z/OS subsystems and SQL Tuning Services servers, you can share the connection information (host, port, etc.) that's associated with the connections that you want to share. 

**Important:** Credentials are not included with the shared connections, so the recipient will need to add their credentials before they can use the connection.

To share a connection definition with other users:

1. Locate the extension's global storage folder that contains the connection information.
- If you are using Db2 Developer Extension on Windows, this information is stored in `%APPDATA%\Code\User\globalStorage\ibm.db2forzosdeveloperextension`.
- If you are using Db2 Developer Extension on MacOS, this information is stored in `$HOME/Library/Application Support/Code/User/globalStorage/ibm.db2forzosdeveloperextension`.

2. Locate the connection definition files that you want to share:
- Db2 for z/OS connection information is stored in `connections.json`.
- SQL Tuning Services information is stored in `tuning_services/tuning_services_servers.json`.

3. Share the connection definition files with the recipient.

4. As the recipient, place the connection definition files in the extension's global storage path as specified in the first step.

5. As the recipient, use VS Code to edit each connection and fill in any missing credentials before you attempt to use that connection.
