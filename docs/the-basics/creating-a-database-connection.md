---
title: "Creating a database connection"
---

# {{ page.title }}

Before you can run your SQL, you need to connect to the Db2 for z/OS subsystem that contains the database that you want to work with. You can use Db2 Developer Extension's integrated database connection capability to add a connection.

From the **CONNECTIONS** view, click the plus sign (**+**) to open the **Add Connection** dialog.

![Adding a database connection]({{site.baseurl}}/assets/images/getting-started-add-connection.png)

- Use the **General** tab to specify basic connection information about the Db2 subsystem and valid user credentials for connecting to that Db2 subsystem.

- If you run into problems when you define a new connection or when you run your SQL against an existing connection, and those problems are related to the data server driver, open the **Tracing** tab and turn **Enable driver trace** to **On**. See [Opening an issue and providing logs]({{site.baseurl}}/docs/troubleshooting/opening-an-issue-and-providing-logs.html) for more information about the logs that are produced when you enable tracing.

- If you want to include [additional properties](https://www.ibm.com/support/knowledgecenter/SSEPEK_12.0.0/java/src/tpc/imjcc_r0052607.html) in your database connection, open the **Optional** tab and enter the property name and assign it a value. Select the checkbox to the left of a property to include it in a database connection. Click the blue plus sign (**+**) to add a new line.

When you're done, click **Finish**. If your database connection was created successfully, it'll be added to the **CONNECTIONS** menu in the right side bar. If not, open the **Tracing** tab, enable tracing, and try again. Then, check the logs for more information about why the connection isn't being added.

## Changing a connection name

When you create a connection, a connection name is automatically generated based on the connection information. You can change this name by editing the connection and changing the **Connection name** field.

## Changing the connection that's used to run SQL

Before you can run SQL from a file, you need to associate a Db2 connection to the file. To change the connection that's associated with a file, open the file and click on the connection in the [Status Bar](https://code.visualstudio.com/docs/getstarted/userinterface). Select a different connection from the list that's displayed.

**Note:** The message "No connection" is displayed in the **Status Bar** if a connection hasn't been associated with the file.

![Changing the connection used to run SQL]({{site.baseurl}}/assets/images/tips-tricks-change-connection.gif)

This method of changing the connection also applies to running and debugging native stored procedures, but it doesn't apply to deploying native stored procedures. You select the connection that's used to deploy a native stored procedure in the [Deployment options]({{site.baseurl}}/docs/deploying-running-and-debugging-stored-procedures-basics.html#deploying-a-stored-procedure).
