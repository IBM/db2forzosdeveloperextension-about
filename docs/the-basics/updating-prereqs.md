---
title: "Updating prerequisites"
---

# {{ page.title }}

Db2 for z/OS Developer Extension 2.2.6 requires Java version 21 and the new JCC license file `db2jcc_license_consvZS.jar`. The license file name has changed starting with version 4.34 of the IBM Data Server Driver for JDBC and SQLJ.

## Updating the Java version

Before you install or upgrade to version 2.2.6, you must have Java version 21 installed on your system. However, you can continue to use earlier supported versions of Java with your existing projects.

To use a different Java version for existing projects, configure the Java version 21 path in the Db2 for z/OS Developer Extension settings. This configuration allows the extension to use the required Java version 21 runtime independently of the project-specific Java version.

To update this configuration, Click **Settings > Extensions > IBM Db2 for z/OS Developer Extension**, and configure the **Db2forzosdeveloperextension › Java: Home** field.

##  Updating the license JAR file from IBM Data Server Driver for JDBC and SQLJ

The required license file name has changed starting with version 4.34 of the IBM Data Server Driver for JDBC and SQLJ. The new JCC license file is `db2jcc_license_consvZS.jar`. 

To update the JCC license:

1. Click **Settings > Extensions > IBM Db2 for z/OS Developer Extension**, and locate the **Db2forzosdeveloperextension › Db2sqlservice: Dependencies** field.

2. Specify the JCC license file, `db2jcc_license_consvZS.jar`. You must provide the full path.

Alternatively, to continue using the previous version of the JCC license, you need to provide the path for the JCC license and IBM Data Server Driver for JDBC and SQLJ. If you're using VS Code on Mac, separate the new file name from the existing file name with a colon (:). If you're using VS Code on Windows, separate them with a semicolon (;). Additionally, you can have both of the files in a folder and that path can be used to refrerence both of the files (for example: `/Users/myname/workspace/lib/*`).
