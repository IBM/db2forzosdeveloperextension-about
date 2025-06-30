---
title: "JDBC driver errors"
---

# {{ page.title }}

This article provides potential solutions to common [JDBC driver errors](https://www.ibm.com/docs/en/db2-for-zos/13?topic=jsri-error-codes-issued-by-data-server-driver-jdbc-sqlj) that can occur when connecting to a Db2 for z/OS subsystem.

## -4499
> A communication error occurred during operations on the connection's underlying socket, socket input stream, or socket output stream. Error location: Reply.fill() - insufficient data (-1). **Message: xxxxxxxxxxx** ERRORCODE=-4499, SQLSTATE=08001

If the accompanying message is `Message: Connection Reset`, and Db2 is correctly configured to receive SSL connections, make sure that the SSL properties are defined in the Db2 connection profile and that the `sslConnection` parameter is set to `true`.
![Commit after each statement Processing continues results]({{site.baseurl}}/assets/images/troubleshoot-4499.png)

For more information about error code -4499, check out [this IBM Support doc](https://www.ibm.com/support/pages/faq-jdbc-errorcode-4499-connectivity).

## Problems with connecting to a database

When you attempt to connect to a Db2 for z/OS database for the first time and it's running on Db2 13 function level 100, one of the following errors might be issued:

  ![Failure to connect with -4222]({{site.baseurl}}/assets/images/jdbc-4222.png)

  ![Failure to connect with internal error]({{site.baseurl}}/assets/images/jdbc-internal-error.png)

If you fail to connect to your database the first time because of one of these errors, attempt to reconnect.

Similarly, when you attempt to connect using a profile with invalid credentials, the following error is issued:

  ![Internal error message for invalid credentials]({{site.baseurl}}/assets/images/invalid_credentials_error.png)

If you encountered this error because of invalid credentials, enter a valid user ID and password, and attempt to reconnect.
