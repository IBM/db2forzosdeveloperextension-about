# IBM Db2 for z/OS Developer Extension

IBM® Db2® for z/OS® Developer Extension (Db2 Developer Extension) is an extension for Visual Studio Code that provides language support for developing Db2 for z/OS SQL applications.

## Licenses

Before downloading this extension, review the [Db2 Developer Extension License Agreement](https://github.com/IBM/db2forzosdeveloperextension-about/raw/master/product-licenses/LICENSE.txt), [Third Party Notices](https://github.com/IBM/db2forzosdeveloperextension-about/raw/master/product-licenses/NOTICES.txt), and the license for [Separately Licensed Code](https://github.com/IBM/db2forzosdeveloperextension-about/raw/master/product-licenses/NON_IBM_LICENSE.txt).

## Overview

This extension provides language support for the Structured Query Language (SQL) syntax that is used to define, manipulate, and control data in IBM Db2 for z/OS databases.

The features provided in this extension simplify the task of developing applications that interact with data in Db2 for z/OS databases by providing:

-   The ability to deploy, run, and debug native stored procedures
-   The ability to commit or rollback the results of SQL transactions
-   The ability to run selected SQL statements from any type of file
-   Code completion and signature help
-   The ability to run SQL with or without parameter markers and host variables and to save SQL execution results
-   Integrated support for connecting to Db2 databases
-   Syntax checking
-   Syntax highlighting
-   Customizable code snippet support

See the [Features](#features) section for more details and examples.

## Table of contents

-   [Privacy notice for feedback](#privacy-notice-for-feedback)
-   [Prerequisites for installing Db2 Developer Extension](#prerequisites-for-installing-db2-developer-extension)
-   [Configuring Java](#configuring-java)
-   [Specifying port numbers](#specifying-port-numbers)
-   [Features](#features)
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

-   One of the following IBM Data Server Driver JDBC license files:

    -   **The Db2 Connect Unlimited Edition for System z® server license**

    This license must be activated on the Db2 for z/OS subsystems that you want to connect to. For more information, see the following topic: https://www.ibm.com/support/knowledgecenter/SSEPGG_11.5.0/com.ibm.db2.luw.licensing.doc/doc/t0057375.html

    -   **The IBM Data Server Driver for JDBC client license file**

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

### Db2 SQL Service

The Db2 SQL Service (DSS) provides support for parsing Db2 SQL syntax and for communicating with Db2. Complete the following steps to specify the port that the DSS server will run on.

1. Open VS Code settings and search for the `db2forzosdeveloperextension.db2sqlservice.port` setting.
2. Specify the port number that you want to assign to the DSS server.
3. Restart VS Code.

### Debugger Session Manager

The Debugger Session Manager (DSM) provides support for debugging native stored procedures. Complete the following steps to specify the port that the DSM will run on.

1. Open VS Code settings and search for the `db2forzosdeveloperextension.db2sqlservice.debugger.sessionManagerPort` setting.
2. Specify the port number that you want to assign to the DSM.
3. Restart VS Code.

## Features

### Working with stored procedures

Db2 Developer Extension provides end-to-end support for working with Db2 for z/OS native stored procedures.
#### Deploying a native stored procedure

To deploy a native stored procedure, open a `.spsql` file that contains a `CREATE PROCEDURE` statement, then right-click the file and select **Deploy Stored Procedure**. You can specify deployment options and routine options before deploying the native stored procedure. For this release, only the first native stored procedure in the file will be deployed.

![ ](https://github.com/IBM/db2forzosdeveloperextension-about/raw/master/readme/deploy-nsp.gif)

#### Running a native stored procedure

To run a native stored procedure, open a `.spsql` file that contains a `CREATE PROCEDURE` statement, then right-click the file and select **Run Stored Procedure**. You will need to specify input values before running the native stored procedure. For this release, only the first native stored procedure in the file will be run.

#### Debugging a native stored procedure

To debug a native stored procedure, open a `.spsql` file that contains a `CREATE PROCEDURE` statement, then right-click the file and select **Debug Stored Procedure**. You will need to specify input values before debugging the native stored procedure. For this release, only the first native stored procedure in the file will be run.

![ ](https://github.com/IBM/db2forzosdeveloperextension-about/raw/master/readme/debug-nsp.gif)

### Code completion and signature help

Code completion simplifies the process of writing SQL statements by suggesting valid completions as you type. Signature help provides information about the parameters that are required by a function or procedure. For this release, these features are provided for Db2 built-in functions and stored procedures only.

![ ](https://github.com/IBM/db2forzosdeveloperextension-about/raw/master/readme/code-completion-signature-help.gif)

### SQL execution

You can run individual SQL statements that are embedded in any type of source code file by highlighting those statements, right-clicking, and selecting **Run Selected SQL.** This feature eliminates the need for copying and pasting the statements into a `.sql` file or modifying your SQL (for example, removing host variables or INTO clauses) before you run it. Within a SQL file, you can also run individual statements by using the **Run Selected SQL** option, or you can run the entire file by right-clicking and selecting **Run All**.

You can also specify run options to control how your SQL is parsed and run. The commit and rollback behavior in the run options applies to a single transaction. Refer to the [COMMIT](https://www.ibm.com/support/knowledgecenter/en/SSEPEK_12.0.0/sqlref/src/tpc/db2z_sql_commit.html) and [ROLLBACK](https://www.ibm.com/support/knowledgecenter/SSEPEK_12.0.0/sqlref/src/tpc/db2z_sql_rollback.html) SQL documentation on the affected statements.

![ ](https://github.com/IBM/db2forzosdeveloperextension-about/raw/master/readme/sql-execution.gif)

### Adding a database connection

To create connections to Db2 databases, launch the **Add Connection** wizard by clicking the plus sign (+) in the Db2 Developer Extension **CONNECTIONS** view.

![ ](https://github.com/IBM/db2forzosdeveloperextension-about/raw/master/readme/add-connection.gif)

### Syntax checking

Syntax checking automatically recognizes when an SQL element has been specified incorrectly and provides the valid expected replacement either by hovering over an incorrectly specified element or by displaying it in the **PROBLEMS** view.

![ ](https://github.com/IBM/db2forzosdeveloperextension-about/raw/master/readme/syntax-checking.gif)

### Syntax highlighting

Syntax highlighting makes it easier to visually parse your code and to identify particular syntax elements based solely on their appearance. Db2 Developer Extension classifies all elements of a particular type into a group and applies a highlighting theme at the group level so that it's easy to customize highlighting themes.

The following example shows the default highlighting theme:

![ ](https://github.com/IBM/db2forzosdeveloperextension-about/raw/master/readme/syntax-highlighting.png)

### Code snippets

Db2 Developer Extension provides code snippets for the most commonly used SQL syntax, complete with required parameters and options. These snippets provide you with a starting point that you can quickly build upon to create the SQL statements that you need and to customize snippets for your particular needs.

The following example shows how to select and insert various SQL DDL statements:

![ ](https://github.com/IBM/db2forzosdeveloperextension-about/raw/master/readme/snippets.gif)

## Limitations for this release

-   When you run an SQL statement that contains host variables (for example, a statement that was copied from the SQL in a native stored procedure), you must prefix the host variables with a colon (:). For example, `:ind_db2_member`

-   When you run an SQL statement that contains a CALL statement for a stored procedure, you can include parameters of type IN only. Stored procedure CALL statements that include OUT or INOUT parameters will fail.

- Debugging a native stored procedure that contains input parameters as array types is not supported.
