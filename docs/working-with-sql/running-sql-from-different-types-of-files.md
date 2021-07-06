---
title: "Running SQL from different types of files"
---

# {{ page.title }}

A unique and extremely useful feature of Db2 Developer Extension is the ability to run your SQL code directly from any type of file without modifying it to accommodate the syntax rules of the language that you're writing in. Whether you're writing in a traditional mainframe language such as COBOL, PL/I, JCL or C or in a modern language such as Python, Node.js, or Rust, or even playing around by using a text file, you can embed your SQL in the file, select it, run it, and view the results.

This feature is useful for validating your SQL code from directly within the host language file, without the overhead of copying and pasting it into a **.sql** or, for stored procedures, into a **.spsql** file first.

Using this feature is pretty straightforward. The only prerequisite is that you have a database connection.  You can associate a specific connection to the file that you want to run your SQL from, but if you don't, Db2 Developer Extension will try to establish a connection for you.

1. Open a file and add a SQL statement.
2. As an optional step, you can specify JDBC runtime options by right-clicking anywhere in the editor and selecting **Run SQL Options** from the context menu.

   For example, you can specify commit and rollback settings, and you can set the [CURRENT SCHEMA](https://www.ibm.com/support/knowledgecenter/SSEPEK_12.0.0/sqlref/src/tpc/db2z_currentschema.html) and [CURRENT PATH](https://www.ibm.com/support/knowledgecenter/SSEPEK_12.0.0/sqlref/src/tpc/db2z_currentpath.html) special registers. For information about the commit and rollback options, see [Committing and rolling back changes]({{site.baseurl}}/docs/the-basics/committing-and-rolling-back-changes.html).

3. Highlight the statement, right-click it, and select **Run Selected SQL** from the context menu.

That's it. Results are displayed in the **SQL Results** page that opens when the statement completes and stored in the **Query History** view.

![SQL Results view]({{site.baseurl}}/assets/images/runsql-results.png)

One other thing: if you're coding in a .sql file, you can use **Run Selected SQL** to run just the specific statements that you're working on, or you can run the entire file by selecting **Run All**.

If you're new to SQL and want more information about embedding SQL in host languages, there's a lot of information about this topic in the [Db2 for z/OS documentation](https://www.ibm.com/support/knowledgecenter/en/SSEPEK_12.0.0/apsg/src/tpc/db2z_programembeddedsql.html).

## Examples

The following examples show this feature in action with several different programming languages.

### C example

![C example]({{site.baseurl}}/assets/images/runsql-c-example.png)

### COBOL example

![COBOL example]({{site.baseurl}}/assets/images/runsql-cobol-example.png)

### Java example

![java example]({{site.baseurl}}/assets/images/runsql-java-example.png)

### JCL example

![JCL example]({{site.baseurl}}/assets/images/runsql-jcl-example.png)

### Node.js example

![Node.js example]({{site.baseurl}}/assets/images/runsql-nodejs-example.png)

### Python example

![SPython example]({{site.baseurl}}/assets/images/runsql-python-example.png)
