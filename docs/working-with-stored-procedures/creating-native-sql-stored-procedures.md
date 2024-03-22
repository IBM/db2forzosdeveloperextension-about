---
title: "Creating native SQL stored procedures"
---

# {{ page.title }}

This article covers the basics of using Db2 Developer Extension to create a simple native SQL stored procedure and then explains some of the more complex things you might need to do when you create a stored procedure, such as working with DBCS data and user-defined types.

## Creating a basic native SQL stored procedure with code snippets

1. Open a new **.spsql** file, and start typing `CREATE PROCEDURE`. You'll only need to type a few letters before you see CREATE PROCEDURE in the list of available code snippets.

2. Select the `CREATE PROCEDURE statement (SQL - native)` snippet to populate your file with the basic CREATE PROCEDURE structure (in the following example, the procedure name has already been changed to MYPROCEDURE):

![CREATE PROCEDURE code snippet]({{site.baseurl}}/assets/images/nsp-basics-create-nsp.png)

The snippet includes some of the more commonly used parameters and an example SELECT statement. The SELECT statement is the part of the stored procedure that gets executed when the stored procedure is called. To see all of the options that you can define in a stored procedure, open the [link](https://www.ibm.com/support/knowledgecenter/SSEPEK_13.0.0/sqlref/src/tpc/db2z_sql_createproceduresqlnative.html) that is included at the top of the snippet.

## What's next

- This stored procedure is ready to be deployed. To learn how, see [Deploying, debugging, and running native SQL stored procedures]({{site.baseurl}}/docs/working-with-stored-procedures/deploying-debugging-running-native-sql-stored-procedures.html).

- You can also explore some of the more complex things you might need to do when you create a stored procedure, such as working with [double-byte character set (DBCS) data]({{site.baseurl}}/docs/working-with-stored-procedures/working-with-dbcs-data.html) and [user-defined types]({{site.baseurl}}/docs/working-with-stored-procedures/working-with-user-defined-types.html).
