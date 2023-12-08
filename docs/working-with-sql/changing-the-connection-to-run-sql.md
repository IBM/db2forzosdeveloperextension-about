---
title: "Changing the connection that's used to run SQL"
---

# {{ page.title }}

Before you can run SQL from a file, you need to associate a Db2 connection to the file. To change the connection that's associated with a file, open the file and click on the connection in the [Status Bar](https://code.visualstudio.com/docs/getstarted/userinterface). Select a different connection from the list that's displayed.

**Note:** The message "No connection" is displayed in the **Status Bar** if a connection hasn't been associated with the file.

![Changing the connection used to run SQL]({{site.baseurl}}/assets/images/db2-connection-change-connection.gif)

This method of changing the connection also applies to running and debugging native stored procedures, but it doesn't apply to deploying native stored procedures. You select the connection that's used to deploy a native stored procedure in the [Deployment options]({{site.baseurl}}/docs/working-with-stored-procedures/deploying-running-and-debugging-stored-procedures-basics.html#deploying-a-stored-procedure).

