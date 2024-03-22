# IBM Db2 for z/OS Developer Extension

IBM® Db2® for z/OS® Developer Extension (Db2 Developer Extension) is an extension for Visual Studio Code that provides language support for developing Db2 for z/OS SQL applications. Complete documentation is contained in our [documentation repository](https://ibm.github.io/db2forzosdeveloperextension-about/).

## Licenses

Before downloading this extension, review the [Db2 Developer Extension License Agreement](https://github.com/IBM/db2forzosdeveloperextension-about/raw/main/product-licenses/LICENSE.txt) and [Third Party Notices](https://github.com/IBM/db2forzosdeveloperextension-about/raw/main/product-licenses/NOTICES.txt).

## Overview

This extension provides language support for the Structured Query Language (SQL) syntax that is used to define, manipulate, and control data in IBM Db2 for z/OS databases, including the latest SQL enhancements that were introduced with Db2 13 for z/OS. It includes basic productivity features that make it easier to write SQL, such as:

-   [Syntax checking and highlighting](https://ibm.github.io/db2forzosdeveloperextension-about/docs/the-basics/getting-started)
-   [Code completion and signature help](https://ibm.github.io/db2forzosdeveloperextension-about/docs/the-basics/getting-started)
-   [SQL formatting](https://ibm.github.io/db2forzosdeveloperextension-about/docs/working-with-sql/formatting-sql)
-   [Customizable code snippets](https://ibm.github.io/db2forzosdeveloperextension-about/docs/tips-and-tricks/creating-your-own-code-snippets)

And it includes features that enable you to easily:

-   [Run SQL](https://ibm.github.io/db2forzosdeveloperextension-about/docs/working-with-sql/preparing-to-run-an-sql-statement)
-   [Deploy, run, and debug native stored procedures](https://ibm.github.io/db2forzosdeveloperextension-about/docs/working-with-stored-procedures/deploying-running-and-debugging-stored-procedures-basics)
-   [Deploy and run external SQL stored procedures](https://ibm.github.io/db2forzosdeveloperextension-about/docs/working-with-stored-procedures/deploying-running-external-SQL-stored-procedures)
-   [Deploy and run Java stored procedures](https://ibm.github.io/db2forzosdeveloperextension-about/docs/working-with-stored-procedures/deploying-running-external-java-stored-procedures)
-   [Analyze and tune the performance of SQL](https://ibm.github.io/db2forzosdeveloperextension-about/docs/tuning-sql-queries/setting-up-a-basic-tuning-environment)
-   [Navigate the Db2 catalog](https://ibm.github.io/db2forzosdeveloperextension-about/docs/the-basics/navigating-the-db2-catalog)

For more information about the latest Db2 Developer Extension features, see [What's new in this release](https://ibm.github.io/db2forzosdeveloperextension-about/docs/the-basics/whats-new-in-this-release).

## Table of contents

-   [Privacy notice for feedback](#privacy-notice-for-feedback)
-   [Prerequisites for installing Db2 Developer Extension](#prerequisites-for-installing-db2-developer-extension)
-   [Configuring Java](#configuring-java)
-   [Setting the JDBC license and JDBC driver files](#setting-the-jdbc-license-and-jdbc-driver-files)
-   [Specifying port numbers](#specifying-port-numbers)
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
-   Performing tuning actions
-   Navigating the Db2 catalog
-   Deactivation of this VS Code extension

Each of these events is logged with the following information:

-   Event time
-   Operating system and version
-   Country or region
-   Anonymous user and session ID
-   Version numbers of Microsoft VS Code and Db2 Developer Extension

## Prerequisites for installing Db2 Developer Extension

Installing Db2 Developer Extension requires the following software:

-   An appropriate version of Visual Studio Code:

    -   For Db2 Developer Extension 1.3 and later, VS Code 1.59.0 or later is required.
    -   For Db2 Developer Extension 1.2 and earlier, VS Code 1.44.0 or later is required.

    Db2 Developer Extension is delivered as an extension to VS Code instead of a stand-alone editor, so you must install and configure VS Code first. We recommend always using the latest version of VS Code available. For information about installing and configuring VS Code, see its [documentation](https://code.visualstudio.com/docs/setup/setup-overview).

-   One of the following Java SDKs:

    -   [Oracle Java SDK](https://www.oracle.com/java/technologies/javase/javase-jdk8-downloads.html) 8 or the LTS version 11 of Oracle Java
    -   Version 8 or 11 of the [OpenJDK](https://adoptopenjdk.net/releases.html?variant=openjdk8&jvmVariant=openj9)

    Alternatively, if you are not developing Java applications, you can install a [supported JRE](https://www.oracle.com/java/technologies/javase-jre8-downloads.html).

    See [Configuring Java](#configuring-java) for information about setting the various options that control how Db2 Developer Extension uses Java.

-   IBM Data Server Driver for JDBC and SQLJ 4.32.28 (11.5.8), which is packaged with Db2 Developer Extension, and one of the following licenses, which is required to connect to Db2 for z/OS:

    -   [Db2 Connect Enterprise Edition](https://www.ibm.com/support/customer/csol/terms/?ref=L-KHAI-CARQ42-01-10-2022-zz-en) (client-side license). See [Setting the JDBC license and JDBC driver files](https://github.com/IBM/db2forzosdeveloperextension-about#setting-the-jdbc-license-and-jdbc-driver-files) for information about specifying this license in your VS Code settings.

    -   [IBM Db2 Connect Unlimited Edition for System z](https://www.ibm.com/support/customer/csol/terms/?ref=L-KHAI-CARQ6U-01-10-2022-zz-en) (server-side license). See [Activating the license certificate file for Db2 Connect Unlimited Edition](https://www.ibm.com/docs/en/db2/11.5?topic=li-activating-license-certificate-file-db2-connect-unlimited-edition) for information about obtaining and activating this license.

-   libsecret on Linux

    If you are running Db2 Developer Extension for VS Code on Linux, install libsecret by running the appropriate command for your distribution:

    -   Debian/Ubuntu: `sudo apt-get install libsecret-1-0`
    -   Red Hat-based: `sudo yum install libsecret-devel`
    -   Arch Linux: `sudo pacman -S libsecret`

-   The SQL tuning capabilities require the following additional software:

    -   If you want to use only the following base set of SQL tuning features, you need the [Database Services Expansion Pack component of Db2 Accessories Suite 4.2](https://publibfp.dhe.ibm.com/epubs/pdf/i1359292.pdf), which is a no-charge add-on to Db2 for z/OS, plus [APAR PH42944](https://www.ibm.com/support/pages/apar/PH42944):

        -   Statistics Advisor
        -   Visual Explain
        -   Capture Query Environment

    -   If you want to use the base set of SQL tuning features and the following additional SQL tuning capabilities, you need [Db2 Query Workload Tuner for z/OS 6.1](https://publibfp.dhe.ibm.com/epubs/pdf/i1355510.pdf):

        -   Access Path Advisor
        -   Access Path Comparison
        -   Index Advisor
        -   Query Rewrite Advisor
        -   SQL Annotator

        See [Installing and configuring SQL Tuning Services](https://www.ibm.com/docs/en/db2-for-zos/13?topic=services-installing-configuring-sql-tuning) for information about enabling these features.

    -   Google Chrome is required to view the results of Access Path Comparison and Visual Explain jobs from within VS Code. Otherwise, the results can be displayed in an external browser.

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

## Setting the JDBC license and JDBC driver files 

You need to specify the JDBC license file `db2jcc_license_cisuz.jar` to interact with Db2 for z/OS. Optionally, to use your own JDBC driver version, you can provide a JDBC driver file.

1. Open your VS Code settings and search for the `db2forzosdeveloperextension.db2sqlservice.dependencies` setting.
2. Specify the JDBC license file, `db2jcc_license_cisuz.jar`. You must provide the full path.
3. Optionally, specify the full path of your JDBC driver file. If you're using VS Code on Mac, separate the JDBC driver file from the JDBC license file with a colon (:). If you're using VS Code on Windows, separate them with a semicolon (;).

    The following example shows specifications for both the JDBC license file and an optional JDBC driver file on Mac:

    `/Users/myname/jccjars/db2jcc_license_cisuz.jar:/Users/myname/jccjars/db2jcc4.jar`

4. Restart VS Code for the changes to take effect.

## Specifying port numbers

You need to specify port number settings for the Db2 SQL Service and the Debugger Session Manager. You can specify a single port number, [multiple port numbers, or a range of port numbers](https://ibm.github.io/db2forzosdeveloperextension-about/docs/tips-and-tricks/setting-multiple-port-numbers).

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

## Limitations for this release

-   When you run a CALL statement that includes OUT or INOUT parameters, it will fail.

-   Debugging a native stored procedure that contains input parameters as array types is not supported.
