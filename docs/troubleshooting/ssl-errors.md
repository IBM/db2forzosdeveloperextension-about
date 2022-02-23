---
title: "SSL errors"
---

# {{ page.title }}

If you're using SSL to connect to Db2 for z/OS, you might receive an error if the TLS version on the z/OS system is at a lower level than the TLS version on your client.

z/OS supports TLS 1.0 and 1.1, which have been deprecated in favor of 1.2 or 1.3 by many clients. To correct this situation, you must take one of the following actions:

- **Upgrade TLS on z/OS**

  Contact your security administrator who is responsible for administering SSL connectivity and ask them to upgrade the TLS version on the z/OS system to 1.2 or 1.3. If this isn't feasible, reconfigure your client to accept TLS 1.0 or 1.1 connections as described below.

- **Reconfigure your workstation to accept TLS 1.0 or 1.1 connections**

  If the TLS version on z/OS can't be upgraded, you'll need to enable Java on your workstation to accept TLS 1.0 or 1.1 connections.

  **Important:** The following process will affect all applications that use the version of Java that you are modifying. Consider this impact before you complete these steps.

  1. Edit the `java.security` JDK file on your workstation. The location of this file depends on the version of Java that you're using.
     - If you're using Java 8, it's located at `$JAVA_HOME/jre/lib/security/java.security`
     - If you're using Java 11 or later, it's located at `$JAVA_HOME/conf/security/java.security`
  2. Locate the `jdk.tls.disabledAlgorithms` property within the `java.security` file and delete the `TLSv1` and `TLSv1.1` entries.
  3. Save and close the file.