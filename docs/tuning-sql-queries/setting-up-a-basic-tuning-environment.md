---
title: "Setting up a basic SQL tuning environment"
---

# {{ page.title }}

This article describes the minimum required steps for setting up an SQL Tuning Services environment in Db2 for z/OS Developer Extension. Additional information about optional configuration settings and features are described in [Advanced options for setting up an SQL tuning environment]({{site.baseurl}}/docs/tuning-sql-queries/advanced-tuning-environment-options.html).

**Important:** The SQL tuning features of Db2 Developer Extension require the [Database Services Expansion Pack](http://publibfp.dhe.ibm.com/epubs/pdf/i1359290.pdf) component of Db2 Accessories Suite 4.2. Make sure that this component is installed on your system before you start to set up your SQL tuning environment.

## Adding an SQL Tuning Services server
The first step in setting up an SQL tuning environment is adding an SQL Tuning Services server.

1. In the **CONNECTIONS** view, click the plus sign (**+**) to the right of the **SQL Tuning Services servers** menu item to open the **Add SQL Tuning Services Server** dialog.

2. Specify the hostname or IP address and port of the system where the SQL Tuning Services server is installed and a valid user ID and password for connecting to that server.

3. Click **Finish**. 

    The server you just created is displayed in the **SQL Tuning Services servers** section of the **CONNECTIONS** view.

    ![Adding an SQL Tuning Services server]({{site.baseurl}}/assets/images/tuning-add-server.gif)

## Associating a tuning connection profile with a Db2 connection 
To use Db2 Developer Extension to tune your SQL, you need a tuning connection profile that's associated with a Db2 connection.

The following steps assume that a tuning connection profile has already been created. If not, see [Creating a tuning connection profile]({{site.baseurl}}/docs/tuning-sql-queries/advanced-tuning-environment-options.html#creating-a-tuning-connection-profile).

1. Either create a new Db2 connection or edit an existing Db2 connection.

2. Go to the **Tuning** tab and select a **Tuning Services server** and **Tuning connection profile**.

3. Save the Db2 connection. 

    ![Associating a tuning connection profile]({{site.baseurl}}/assets/images/tuning-associate-profile.png)

Now you can start using the [Visual Explain]({{site.baseurl}}/docs/tuning-sql-queries/viewing-a-graphical-explanation-of-access-plans.html), [Statistics Advisor]({{site.baseurl}}/docs/tuning-sql-queries/generating-statistics-to-improve-query-performance.html), and [Capture Query Environment]({{site.baseurl}}/docs/tuning-sql-queries/capturing-your-query-environment.html) tuning features of Db2 Developer Extension.