---
title: "Creating a database connection"
---

# {{ page.title }}

Before you can run your SQL, you need to connect to the Db2 for z/OS subsystem that contains the database that you want to work with. You can use Db2 Developer Extension's integrated database connection capability to add a connection.

From the **CONNECTIONS** view, click the plus sign (**+**) to the right of the **Db2 for z/OS connections** menu item to open the **Add Db2 Connection** dialog.

![Adding a database connection]({{site.baseurl}}/assets/images/db2-connection-add-connection.png)

- Use the **General** tab to specify basic connection information about the Db2 subsystem and valid user credentials for connecting to that Db2 subsystem.

- If you run into problems when you define a new connection or when you run your SQL against an existing connection, and those problems are related to the data server driver, open the **Tracing** tab and turn **Enable driver trace** to **On**. See [Opening an issue and providing logs]({{site.baseurl}}/docs/troubleshooting/opening-an-issue-and-providing-logs.html) for more information about the logs that are produced when you enable tracing.

- If you want to include [additional properties](https://www.ibm.com/support/knowledgecenter/SSEPEK_12.0.0/java/src/tpc/imjcc_r0052607.html) in your database connection, open the **Optional** tab and enter the property name and assign it a value. Select the checkbox to the left of a property to include it in a database connection. Click the blue plus sign (**+**) to add a new line.

- Use the **Tuning** tab to specify a SQL Tuning Services server and to associate a tuning connection profile with a Db2 connection. See [Setting up a basic SQL tuning environment]({{site.baseurl}}/docs/tuning-sql-queries/setting-up-a-basic-tuning-environment.html) for more information.

When you're done, click **Finish**. If your database connection was created successfully, it'll be added to the **CONNECTIONS** menu in the side bar under the **Db2 for z/OS connections** entry. 

If your database connection fails to establish a connection, open the **Tracing** tab, enable tracing, and try to connect again. Then, check the logs for more information about why the connection failed to connect.

## Changing a connection name

When you create a connection, a connection name is automatically generated based on the connection information. You can change this name by editing the connection and changing the **Connection name** field.

## Changing the connection that's used to run SQL

Before you can run SQL from a file, you need to associate a Db2 connection to the file. To change the connection that's associated with a file, open the file and click on the connection in the [Status Bar](https://code.visualstudio.com/docs/getstarted/userinterface). Select a different connection from the list that's displayed.

**Note:** The message "No connection" is displayed in the **Status Bar** if a connection hasn't been associated with the file.

![Changing the connection used to run SQL]({{site.baseurl}}/assets/images/db2-connection-change-connection.gif)

This method of changing the connection also applies to running and debugging native stored procedures, but it doesn't apply to deploying native stored procedures. You select the connection that's used to deploy a native stored procedure in the [Deployment options]({{site.baseurl}}/docs/working-with-stored-procedures/deploying-running-and-debugging-stored-procedures-basics.html#deploying-a-stored-procedure).

## Connecting with SSL/TLS

Before you can use SSL/TLS to connect to a Db2 server, the [Db2 server must be configured for SSL/TLS](https://www.ibm.com/docs/en/db2-for-zos/12?topic=pdter-encrypting-your-data-secure-socket-layer-ssl-support). If you're not sure if the Db2 server has been configured for SSL/TLS, check with your network administrator.

1. Add or edit a Db2 connection.
2. In the **General** tab, specify the secure port in the **Port** field.
3. In the **Optional** tab, specify the JDBC properties for a secure connection.

   At a minimum, you'll need the following properties:

   - `sslConnection` to `true`
   - One of the following set of properties to specify the Db2 server certificate location:
     - `sslCertLocation`
     - `sslTrustStoreLocation` and `sslTrustStorePassword`
     - `sslTrustStoreLocation`, `sslTrustStorePassword` (optional), and `sslTrustStoreType`

   If you're using the Java KeyStore to store the client certificate, you'll need to add the following properties:

   - `securityMechanism` set to `18`
   - One of the following set of properties to specify the client certificate location:
     - `sslKeyStoreLocation` and `sslKeyStorePassword`
     - `sslKeyStoreLocation` and `sslKeyStorePassword` (optional), and `sslKeyStoreType`

The following example shows the properties for using the Java truststore and Java KeyStore.

![Java truststore and Java KeyStore properties]({{site.baseurl}}/assets/images/db2-connection-ssl-tls.png)

   For more information, see [Configuring connections under the IBM Data Server Driver for JDBC and SQLJ to use SSL](https://www.ibm.com/docs/en/db2-for-zos/12?topic=dsdjsss-configuring-connections-under-data-server-driver-jdbc-sqlj-use-ssl).

4. Click **Finish** to establish an SSL connection to the Db2 server.
