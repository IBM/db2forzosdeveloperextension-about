---
title: "Supported types of stored procedures"
---

# {{ page.title }}

[Stored procedures](https://www.ibm.com/support/knowledgecenter/en/SSEPEK_13.0.0/apsg/src/tpc/db2z_storedprocedure.html) are a powerful tool for increasing the performance and efficiency of distributed applications. Db2 Developer Extension supports the following types of stored procedures:

- [Db2 for z/OS native SQL stored procedures]({{site.baseurl}}/docs/working-with-stored-procedures/creating-native-sql-stored-procedures.html), which are stored procedures that are written entirely in SQL and are created by using the [CREATE PROCEDURE or CREATE  OR REPLACE PROCEDURE](https://www.ibm.com/support/knowledgecenter/SSEPEK_13.0.0/sqlref/src/tpc/db2z_sql_createproceduresqlnative.html) statement, which is available with Db2 12 function level 507 and later.

- [External Java stored procedures]({{site.baseurl}}/docs/working-with-stored-procedures/creating-external-java-stored-procedures.html), which are stored procedures that are written in Java but that contain SQL statements. Currently, Db2 for z/OS Developer Extension supports the ability to create, deploy, and run external Java stored procedures, but it does not support the ability to debug external Java stored procedures.

- [External SQL stored procedures]({{site.baseurl}}/docs/working-with-stored-procedures/creating-external-SQL-stored-procedures.html), which are stored procedures that are written entirely in SQL and that contain the EXTERNAL option, the FENCED option or both. A C program and an associated package are generated for external SQL stored procedures. Note that external SQL stored procedures are deprecated in Db2 for z/OS.

Information is also provided for working with [double-byte character set (DBCS) data]({{site.baseurl}}/docs/working-with-stored-procedures/working-with-dbcs-data.html) and [user-defined types]({{site.baseurl}}/docs/working-with-stored-procedures/working-with-user-defined-types.html).

