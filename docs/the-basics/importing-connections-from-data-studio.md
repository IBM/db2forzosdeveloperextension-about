---
title: "Importing database connections from IBM Data Studio"
---

# {{ page.title }}

Db2 Developer Extension makes it easy to import your database connections from IBM Data Studio, eliminating the need to create connections that already exist.

**Requirements:**
- The file that you import must be the connection profiles that are exported from the Data Source Explorer or the Administration Explorer view of IBM Data Studio.

    <img src="{{site.baseurl}}/assets/images/data-source-explorer-export-button.png" alt="Data Source Explorer export icon" height="100px" width="400px"/>
    <img src="{{site.baseurl}}/assets/images/administration-explorer-export-button.png" alt="Administration Explorer export icon" height="100px" width="400px"/>

- The file should be a valid XML file and should not be encrypted.

To import database connections:

1. From the **DB2 FOR Z/OS CONNECTIONS** view, click the **Import Connections from IBM Data Studio** icon (![Import connections icon]({{site.baseurl}}/assets/images/import-connections-icon.png)) to open the **Import Db2 Connections** window.

    ![Import connections page]({{site.baseurl}}/assets/images/import-connections.png)

2. On the **Import connections** tab, click **Select file** and select the exported XML file.

3. Click **Next** to navigate to the **Select connections** tab. You can view the connection details, JDBC properties, and trace properties of each connection.

    ![Select connections page]({{site.baseurl}}/assets/images/select-connections.png)

4. Select the connection or connections that you want to import.

5. Click **Import**.

Your imported database connections should now be displayed in the **DB2 FOR Z/OS CONNECTIONS** view.
