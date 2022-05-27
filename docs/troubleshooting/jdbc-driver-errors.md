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
