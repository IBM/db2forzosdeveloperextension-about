# IBM Db2 for z/OS Developer Extension

IBM® Db2® for z/OS® Developer Extension (Db2 Developer Extension) is an extension for Visual Studio Code that provides language support for developing Db2 for z/OS SQL applications. Complete documentation is contained in our [documentation repository](https://ibm.github.io/db2forzosdeveloperextension-about/).

## Licenses

Before downloading this extension, review the [Db2 Developer Extension License Agreement](https://github.com/IBM/db2forzosdeveloperextension-about/raw/master/product-licenses/LICENSE.txt), [Third Party Notices](https://github.com/IBM/db2forzosdeveloperextension-about/raw/master/product-licenses/NOTICES.txt), and the license for [Separately Licensed Code](https://github.com/IBM/db2forzosdeveloperextension-about/raw/master/product-licenses/NON_IBM_LICENSE.txt).

## Overview

This extension provides language support for the Structured Query Language (SQL) syntax that is used to define, manipulate, and control data in IBM Db2 for z/OS databases. It includes basic productivity features that make it easier to write SQL, such as:

-   SQL formatting - **New**
-   Syntax checking and highlighting
-   Code completion and signature help
-   Customizable code snippets

It includes a robust set of capabilities for running SQL that include the ability to:

-   Display consolidated results from running multiple SQL statements - **New**
-   Run SQL that includes parameters and variables from within a native stored procedure (.spsql file) - **New**
-   Sort query history by the timestamp of the execution - **New**
-   Select multiple SQL elements on different lines and run those elements as a complete statement - **New**
-   Restrict the number of rows in SQL result sets - **New**
-   Quickly identify and display failing SQL statements - **New**
-   Use null values and retain input values - **New**
-   Validate XML for host variable parameters input - **New**
-   Run selected SQL statements from any type of file
-   Run SQL with or without parameter markers and host variables and to save SQL execution results
-   Commit or rollback the results of SQL executions based on customizable success/failure settings

It also includes support for working with native stored procedures by providing the ability to:

-   Deploy, run, and debug native stored procedures
-   Set conditional breakpoints when debugging stored procedures - **New**

See the [Key features](#Key-features) section for more details and examples.

## Table of contents

-   [Privacy notice for feedback](#privacy-notice-for-feedback)
-   [Prerequisites for installing Db2 Developer Extension](#prerequisites-for-installing-db2-developer-extension)
-   [Configuring Java](#configuring-java)
-   [Specifying port numbers](#specifying-port-numbers)
-   [Key features](#Key-features)
-   [Additional information](#Additional-information)
-   [Limitations for this release](#limitations-for-this-release)

## Privacy notice for feedback

Db2 Developer Extension is provided free of charge, but we ask you to provide us feedback via the various means available, such as submitting an [issue in our GitHub repository](https://github.com/IBM/db2forzosdeveloperextension-about/issues), submitting review comments in the [VS Code Marketplace](https://marketplace.visualstudio.com/items?itemName=ibm.db2forzosdeveloperextension#review-details), and keeping the built-in telemetry and crash reports enabled.

This extension uses [Microsoft VS Code's Telemetry](https://code.visualstudio.com/docs/getstarted/telemetry) solution, which collects telemetry data that is used to help understand how to improve the product. While we appreciate the insights this data provides, we also know that not everyone wants to send usage data. You can disable telemetry as described in [Disable Telemetry Reporting](https://code.visualstudio.com/docs/getstarted/telemetry#_disable-telemetry-reporting). You can also read [IBM's General Privacy Statement](https://www.ibm.com/privacy/us/en/) to learn more about our policies.

This current release of Db2 Developer Extension will collect anonymous data for the following events:

-   Activation of this VS Code extension
-   Opening supported file types (See the **Feature Contributions** tab for a list of supported file types.)
-   Syntax parsing
-   Connecting to Db2
-   SQL execution
-   Deploying, running, or debugging native stored procedures
-   Deactivation of this VS Code extension

Each of these events is logged with the following information:

-   Event time
-   Operating system and version
-   Country or region
-   Anonymous user and session ID
-   Version numbers of Microsoft VS Code and Db2 Developer Extension

## Prerequisites for installing Db2 Developer Extension

Installing Db2 Developer Extension requires the following software:

-   One of the following IBM Data Server Driver for JDBC and SQLJ license files. Db2 Developer Extension requires an appropriately licensed JDBC driver. Using a JDBC driver from another tool or product not listed below is not permitted.

    -   **The Db2 Connect Unlimited Edition for System z® server license**

    This license must be activated on the Db2 for z/OS subsystems that you want to connect to. For more information, see the following topic: https://www.ibm.com/support/knowledgecenter/SSEPGG_11.5.0/com.ibm.db2.luw.licensing.doc/doc/t0057375.html

    -   **The IBM Data Server Driver for JDBC and SQLJ client license file**

    For information about locating and and enabling the client license file, see the following topic:
    https://www.ibm.com/support/pages/db2-jdbc-driver-not-licensed-connectivity-file-db2jcclicensecisuzjar-errorcode-4472-sqlstate42968

    When you specify the location of the `db2jcc_license_cisuz.jar` license file in your VS Code settings (`db2forzosdeveloperextension.db2sqlservice.dependencies`), you must provide the full path.

-   One of the following 64-bit Java SDKs:

    -   [Oracle Java SDK](https://www.oracle.com/java/technologies/javase/javase-jdk8-downloads.html) 8 or the LTS version 11 of Oracle Java
    -   Version 8 or 11 of the [OpenJDK](https://adoptopenjdk.net/releases.html?variant=openjdk8&jvmVariant=openj9)

    Alternatively, if you are not developing Java applications, you can install a [supported JRE](https://www.oracle.com/java/technologies/javase-jre8-downloads.html).

    See [Configuring Java](#configuring-java) for information about setting the various options that control how Db2 Developer Extension uses Java.

-   libsecret on Linux

    If you are running Db2 Developer Extension for VS Code on Linux, install libsecret by running the appropriate command for your distribution:

    -   Debian/Ubuntu: `sudo apt-get install libsecret-1-0`
    -   Red Hat-based: `sudo yum install libsecret-devel`
    -   Arch Linux: `sudo pacman -S libsecret`

## Configuring Java

Because part of the SQL language server in IBM Db2 for z/OS Developer Extension is implemented using Java, a Java runtime must be defined in the program path to start Db2 Developer Extension in VS Code. You can specify the specific Java runtime that you want to use and you can set additional Java configuration parameters, such as how much memory the extension can use, in the [VS Code User or Workspace Settings](https://code.visualstudio.com/docs/getstarted/settings). You can also specify a Java runtime and set configuration parameters by editing the `settings.json` file directly.

### Specifying the Java runtime for the Db2 Developer Extension language server

The language server client that is running in the Db2 Dev Extension checks the following places to find a matching Java runtime:

1. First, it checks your current VS Code User Settings or Workspace Settings. These settings take precedence over all other locations, which allows you to specify a different Java runtime for Db2 Developer Extension than you do for other programs on your computer.
2. If a Java runtime was not specified in your VS Code User Settings or Workspace Settings, it checks your `JAVA_HOME` environment variable.
3. If a Java runtime was not specified in your `JAVA_HOME` environment variable, it checks your `PATH` environment variable.

If a Java runtime is not found in any of these locations, an error message is issued. To resolve the problem, specify a Java runtime in one of these locations.

**Tip:** Alternatively, you can specify a path to a Java SDK on the `JAVA_HOME` environment variable; for example:

-   On Mac:
    ```
    "db2forzosdeveloperextension.java.home": "/Library/Java/JavaVirtualMachines/jdk1.8.0_181.jdk/Contents/Home"
    ```
-   On Windows:
    ```
    "db2forzosdeveloperextension.java.home": "C:\Program Files\Java\jdk1.8.0_181"
    ```

## Specifying port numbers

You need to specify port number settings for the Db2 SQL Service and the Debugger Session Manager. You can specify a single port number, [multiple port numbers, or a range of port numbers](https://ibm.github.io/db2forzosdeveloperextension-about/2021/06/16/Setting-multiple-port-numbers.html).

### Db2 SQL Service

The Db2 SQL Service (DSS) provides support for parsing Db2 SQL syntax and for communicating with Db2. Complete the following steps to specify the port number or numbers that the DSS server will run on.

1. Open VS Code settings and search for the `db2forzosdeveloperextension.db2sqlservice.port` setting.
2. Specify the port number or numbers that you want to assign to the DSS server.
3. Restart VS Code.

### Debugger Session Manager

The Debugger Session Manager (DSM) provides support for debugging native stored procedures. Complete the following steps to specify the port number or numbers that the DSM will run on.

1. Open VS Code settings and search for the `db2forzosdeveloperextension.db2sqlservice.debugger.sessionManagerPort` setting.
2. Specify the port number or numbers that you want to assign to the DSM.
3. Restart VS Code.

## Key features

### Working with stored procedures

Db2 Developer Extension provides end-to-end support for working with Db2 for z/OS native stored procedures, from [creating them](https://ibm.github.io/db2forzosdeveloperextension-about/2021/03/16/Creating-stored-procedures.html) through [deploying, running, and debugging them](https://ibm.github.io/db2forzosdeveloperextension-about/2021/03/12/Deploying-running-and-debugging-stored-procedures-basics.html).

#### Deploying a native stored procedure

To deploy a native stored procedure, open a `.spsql` file that contains a `CREATE PROCEDURE` statement, then right-click the file and select **Deploy Stored Procedure**. You can specify deployment options and routine options before deploying the native stored procedure. For this release, only the first native stored procedure in the file will be deployed.

![ ](https://github.com/IBM/db2forzosdeveloperextension-about/raw/master/readme/deploy-nsp.gif)

#### Debugging a native stored procedure

To debug a native stored procedure, open a `.spsql` file that contains a `CREATE PROCEDURE` statement, then right-click the file and select **Debug Stored Procedure**. You will need to specify input values before debugging the native stored procedure. For this release, only the first native stored procedure in the file will be run.

Db2 Developer Extension supports conditional hit-count breakpoints, which means that when the breakpoint is reached, instead of pausing, execution continues until the hit count that you specified is reached. This feature is useful for debugging stored procedures that contain loops.

![ ](https://github.com/IBM/db2forzosdeveloperextension-about/raw/master/readme/debug-hitcount.gif)

### SQL execution

You can run individual SQL statements that are embedded in any type of source code file by highlighting those statements, right-clicking, and selecting **Run Selected SQL.** This feature eliminates the need for copying and pasting the statements into a `.sql` file or modifying your SQL (for example, removing host variables or INTO clauses) before you run it.

Within a SQL file, you can run individual statements and even SQL elements that are on different lines by using the **Run Selected SQL** option, or you can run the entire file by right-clicking and selecting **Run All**. If your SQL contains host variables, you'll be prompted to provide a value and data type, or you can specify a null value. When the SQL finishes running, you can export the results in a `.csv` file.

![ ](https://github.com/IBM/db2forzosdeveloperextension-about/raw/master/readme/run-sql-multiple-selection.gif)

Db2 Developer Extension supports XML host variables and will validate the syntax if you specify an XML host variable. When you run multiple SQL statements, the results are displayed in in the **Execution Summary** page. From this page, you can drill down into individual statements, quickly identify, display, and cycle through failing SQL statements, and sort results by their timestamp.

![ ](https://github.com/IBM/db2forzosdeveloperextension-about/raw/master/readme/sql-execution.gif)

Complete instructions for using the Db2 Developer Extension features for running SQL are in the WORKING WITH SQL category in our [documentation repository](https://ibm.github.io/db2forzosdeveloperextension-about/).

### SQL formatting

Db2 Developer Extension takes advantage of [VS Code’s Format Document and Format Selection](https://code.visualstudio.com/docs/editor/codebasics#_formatting) capabilities by allowing you to format SQL within all SQL file types, including `.ddl`, `.spsql`, `.sql`, `.javaspsql`, and `.udfsql` files.

The ability to format your SQL makes it much easier to parse large blocks of code and to understand the relationship between different blocks of SQL elements and clauses.

The formatting actions are available from the editor context menu, as keyboard shortcuts, and from the Command Palette.

![ ](https://github.com/IBM/db2forzosdeveloperextension-about/raw/master/readme/sql-formatter.gif)

## Additional information

You can find additional information in the Db2 for z/OS Developer Extension documentation repository, including instructions for:

-   [Getting started](https://ibm.github.io/db2forzosdeveloperextension-about/2021/03/12/Getting-started.html), which contains information about the syntax checking and highlighting, code completion and signature help, and code snippets features.
-   [Creating a database connection](https://ibm.github.io/db2forzosdeveloperextension-about/2021/06/15/Creating-a-database-connection.html)
-   [Committing and rolling back changes](https://ibm.github.io/db2forzosdeveloperextension-about/2021/03/16/Committing-and-rolling-back-changes.html)

Also, see our [blog site](https://ibm.github.io/db2forzosdeveloperextension-about/blogs/) to keep up with latest developments.

## Limitations for this release

- When you run a CALL statement that includes OUT or INOUT parameters, it will fail.

- Debugging a native stored procedure that contains input parameters as array types is not supported.
