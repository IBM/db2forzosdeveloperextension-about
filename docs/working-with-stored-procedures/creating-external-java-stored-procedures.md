---
title: "Creating external Java stored procedures"
---

# {{ page.title }}

This article covers the basics of using Db2 Developer Extension to create a simple external Java stored procedure.

Currently, Db2 Developer Extension supports JDBC stored procedures (SQLJ stored procedures are not supported).

## Before you begin

Before you can run an external Java stored procedure on Db2 for z/OS, you need to set up a WLM environment and set Java environment variables.  For instructions, see [Setting up the environment for Java routines](https://www.ibm.com/docs/en/db2-for-zos/13?topic=functions-setting-up-environment-java-routines).


You also need SYSADM authority or EXECUTE privilege on the following procedures:

- [SQLJ.DB2_INSTALL_JAR](https://www.ibm.com/docs/en/db2-for-zos/13?topic=db2-sqljdb2-install-jar)
- [SQLJ.REMOVE_JAR](https://www.ibm.com/docs/en/db2-for-zos/13?topic=db2-sqljremove-jar)
- [SQLJ.DB2_REPLACE_JAR](https://www.ibm.com/docs/en/db2-for-zos/13?topic=db2-sqljdb2-replace-jar)
- [SQLJ.ALTER_JAVA_PATH](https://www.ibm.com/docs/en/db2-for-zos/13?topic=db2-sqljalter-java-path)
- SQLJ.DB2_UPDATEJARINFO (Required only if you want to upload the Java source along with the stored procedure)
- [WLM_REFRESH](https://www.ibm.com/docs/en/db2-for-zos/13?topic=db2-wlm-refresh) (Required only if you want to refresh the WLM environment)


If you do need to refresh the WLM environment, you'll also need to set up the WLM_REFRESH stored procedure. See [WLM_REFRESH stored procedure](https://www.ibm.com/docs/en/db2-for-zos/13?topic=db2-wlm-refresh) for details.

## Creating a basic external Java stored procedure with code snippets

1. Open a new **.spsql** or **.javaspsql** file, and start typing `CREATE PROCEDURE`. You'll only need to type a few letters before you see CREATE PROCEDURE in the list of available code snippets.

2. Select the `CREATE PROCEDURE statement (Java - IN/OUT parameters)` snippet to populate your file with the basic CREATE PROCEDURE structure:

![CREATE PROCEDURE code snippet]({{site.baseurl}}/assets/images/jsp-code-snippet.png)

The snippet includes some of the more commonly used parameters and the required EXTERNAL NAME clause. The EXTERNAL NAME clause must contain a valid external-java-routine-name that is specified in the following format: 
```
jar-name:package-id...class-id.method-id(method-signature)
```
The `package-id` must match the package declare statement in the Java source. The `class-id` must match the Java class name. The `method-id` must match the Java method name. The `method-signature` is optional.

To see all of the options that you can define in an external Java stored procedure, open the [link](https://www.ibm.com/docs/en/db2-for-zos/13?topic=statements-create-procedure-external) that is included at the top of the snippet.

## What's next

- After you specify an external Java routine name, the stored procedure is ready to be deployed. To learn how, see [Deploying and running external Java stored procedures]({{site.baseurl}}/docs/working-with-stored-procedures/deploying-running-external-java-stored-procedures.html).

- You can also explore how to work with [double-byte character set (DBCS) data]({{site.baseurl}}/docs/working-with-stored-procedures/working-with-dbcs-data.html) in a stored procedure.

