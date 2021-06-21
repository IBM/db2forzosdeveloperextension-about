---
layout: single
# classes: wide
title:  "Running SQL"
toc: true
toc_sticky: true
---

Db2 for z/OS Developer Extension provides a lot of flexibility for running SQL and working with the results.

## Preparing to run an SQL statement

When you have some valid SQL and you have a valid database connection, you're just about ready to run it. There's a little bit of optional set up you might want to do first.

1. Create and save a simple SQL statement. For example, the following statement selects the entire contents (a single row) of the Db2 sample table SYSIBM.SYSDUMMY1:
```
SELECT * FROM
SYSIBM.SYSDUMMY1
```

2. Right-click anywhere in your .sql file and select **Run SQL Options** from the context menu to open the following view:

    ![Run SQL Options]({{site.baseurl}}/assets/images/getting-started-run-sql-options.png)

    Use this view to set the following options for running your SQL:

    - Whether to always use an existing database connection to run this script or open a new database connection every time you run this script.
    - The circumstances under which changes are [committed or rolled back]({{site.baseurl}}/2021/03/16/Committing-and-rolling-back-changes.html).
    - The statement termination character to use if you don't want to use the default semicolon (;) character.
    - Values for the [CURRENT SCHEMA](https://www.ibm.com/support/knowledgecenter/SSEPEK_12.0.0/sqlref/src/tpc/db2z_currentschema.html) and [CURRENT PATH](https://www.ibm.com/support/knowledgecenter/SSEPEK_12.0.0/sqlref/src/tpc/db2z_currentpath.html) special registers and whether these values are always converted to uppercase letters.

3. Now, you can run your SQL by using any of the following methods: 

    - Right-click anywhere in your SQL file and click **Run All**.

    - Highlight your SELECT statement, right-click anywhere in your SQL file and click **Run Selected SQL**. This option is useful for testing and debugging individual SQL statements.

    - Use the Visual Studio Code [Command Palette]({{site.baseurl}}/2021/03/13/Tips-and-tricks.html#running-commands-from-the-command-palette).

    The results are displayed in the **SQL Results** page that opens when the statement completes and stored in the **QUERY HISTORY** menu in ther right sidebar. You can also save the results in a **.csv** file or in a spreadsheet. 

<!-- When you're comfortable with using the basic features of Db2 Developer Extension, check out [Tips and tricks]({{site.baseurl}}/2021/03/13/Tips-and-tricks.html) and  [Creating stored procedures]({{site.baseurl}}/2021/03/16/Creating-stored-procedures.html) to learn more about Db2 Developer Extension's capabilities.
-->

## Running multiple SQL statements

When you run multiple SQL statements simultaneously by using the **Run Selected SQL** option or all of the SQL statements in a file by using the **Run All** option, when the statements finish executing, the results are displayed in the **Execution Summary** page:

**INSERT SCREEN SHOT OF EXECUTION SUMMARY PAGE HERE**

The **Execution Summary** page indicates the total number of statements that ran, the execution status of each statement (success, failure, warning), and the total amount of time that it took to run the statements.

Db2 Developer Extension maintains the execution history so that you can compare SQL execution results over time. Statements are grouped together in an expandable section in the **Query History** view. Click an individual statement to display details about just that statement.

The query history is sorted in descending order by default. To sort the query history in ascending order, hover on the **Query History** view and click the **Sort Query History** icon.

   ![Sort Query History]({{site.baseurl}}/assets/images/runsql-sort-query-history.png)

Warning and failure icons indicate which statements might need some debugging.  To cycle through all of the statements that failed, click the ??? icon and the next failing SQL statement is displayed.


## Running SQL within a stored procedure

You can run SQL within a native stored procedure (NSP) body that contains SQL parameters and SQL variables. You'll be prompted to specify values for them before the SQL executes. Note that built-in data types for each input variable are detected automatically and are set to the correct data type.

   ![Run SQL within a stored procedure]({{site.baseurl}}/assets/images/running-sql-in-nsps.gif)
