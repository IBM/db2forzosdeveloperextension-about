---
title: "Creating external SQL stored procedures"
---

# {{ page.title }}

This article covers the basics of using Db2 Developer Extension to create a simple external SQL stored procedure.

**Important:** The use of external SQL stored procedures is deprecated in Db2 for z/OS. If possible for your environment, consider using native SQL stored procedures or external Java stored procedures instead.

## Before you begin

Before you can run an external SQL stored procedure on Db2 for z/OS, you need to set up your environment accordingly. For instructions, see [Setting up support for external SQL procedures](https://www.ibm.com/docs/en/db2-for-zos/13?topic=db2-setting-up-support-external-sql-procedures).

## Creating a basic external SQL stored procedure with code snippets

1. Open a new **.spsql** file, and start typing `CREATE PROCEDURE`. You'll only need to type a few letters before you see CREATE PROCEDURE in the list of available code snippets.

2. Select the `CREATE PROCEDURE statement (SQL - external)` snippet to populate your file with the basic CREATE PROCEDURE structure (in the following example, the procedure name has already been changed to MYPROCEDURE):

![CREATE PROCEDURE code snippet]({{site.baseurl}}/assets/images/esp-code-snippet.png)

The snippet includes some of the more commonly used parameters and an example SELECT statement. The SELECT statement is the part of the stored procedure that gets executed when the stored procedure is called. To see all of the options that you can define in an external SQL stored procedure, open the [link](https://www.ibm.com/docs/en/db2-for-zos/13?topic=statements-create-procedure-sql-external-deprecated) that is included at the top of the snippet.

## What's next

- This stored procedure is ready to be deployed. To learn how, see [Deploying and running external SQL stored procedures]({{site.baseurl}}/docs/working-with-stored-procedures/deploying-running-external-SQL-stored-procedures.html).

- You can also explore some of the more complex things you might need to do when you create a stored procedure, such as working with [double-byte character set (DBCS) data]({{site.baseurl}}/docs/working-with-stored-procedures/working-with-dbcs-data.html) and [user-defined types]({{site.baseurl}}/docs/working-with-stored-procedures/working-with-user-defined-types.html).
