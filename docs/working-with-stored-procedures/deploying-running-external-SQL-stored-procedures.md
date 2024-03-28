---
title: "Deploying and running external SQL stored procedures"
---

# {{ page.title }}

This article shows you how to use Db2 Developer Extension to deploy an external SQL stored procedure with various deployment options: altering previous deployments, setting target schema, and others. It also walks you through the process of running an external SQL stored procedure.

**Tip:** If you're new to stored procedures, make sure you're familiar with the information in [Creating external SQL stored procedures]({{site.baseurl}}/docs/working-with-stored-procedures/creating-external-SQL-stored-procedures.html) first.

One big advantage of using Db2 Developer Extension to deploy a stored procedure, as opposed to manually executing SQL, is that you can save the various deployment options separately from the SQL itself, which means that you can push your code into a source code manager, such as GitHub, without having to remove the deployment debug options first.

Another advantage is that you don't need to specify `--#SET TERMINATOR` in the header of **.spsql** files. Db2 Developer Extension uses the number sign character (#) as the default terminator character, but you can use any terminator character you want by setting a SQL routine option (explained later in this article).

**Note:** Currently, Db2 Developer Extension deploy and run options support only one stored procedure per **.spsql** file. When stored procedure options are specified, only the first stored procedure in the file will be executed; additional stored procedures and SQL statements will be ignored.

We'll use the following example external SQL stored procedure throughout this article to demonstrate how to deploy and run an external SQL stored procedure. This stored procedure will read the total salary, including bonuses, from the table `DSN8D10.EMP` from a passed in-parameter `DEPTNUMBER`. You can paste it into a file so that you try things out for yourself.

**RETURNDEPTSALARY.spsql**

```
CREATE PROCEDURE ADMF001.RETURNDEPTSALARY
 (IN DEPTNUMBER CHAR(3),
  OUT DEPTSALARY DECIMAL(15,2),
  OUT DEPTBONUSCNT INT)
 LANGUAGE SQL
 READS SQL DATA
 EXTERNAL NAME 'RSALARY'
 FENCED
 P1: BEGIN
     DECLARE EMPLOYEE_SALARY DECIMAL(9,2);
     DECLARE EMPLOYEE_BONUS DECIMAL(9,2);
     DECLARE TOTAL_SALARY DECIMAL(15,2) DEFAULT 0;
     DECLARE BONUS_CNT INT DEFAULT 0;
     DECLARE END_TABLE INT DEFAULT 0;
     DECLARE C1 CURSOR FOR
      SELECT SALARY, BONUS FROM DSN8D10.EMP
       WHERE WORKDEPT = DEPTNUMBER;
     DECLARE CONTINUE HANDLER FOR NOT FOUND
      SET END_TABLE = 1;
     DECLARE EXIT HANDLER FOR SQLEXCEPTION
      SET DEPTSALARY = NULL;
     OPEN C1;
     FETCH C1 INTO EMPLOYEE_SALARY, EMPLOYEE_BONUS;
     WHILE END_TABLE = 0 DO
      SET TOTAL_SALARY = TOTAL_SALARY + EMPLOYEE_SALARY + EMPLOYEE_BONUS;
      IF EMPLOYEE_BONUS > 0 THEN
       SET BONUS_CNT = BONUS_CNT + 1;
      END IF;
      FETCH C1 INTO EMPLOYEE_SALARY, EMPLOYEE_BONUS;
     END WHILE;
     CLOSE C1;
     SET DEPTSALARY = TOTAL_SALARY;
     SET DEPTBONUSCNT = BONUS_CNT;
 END P1
```

The file extension of `.spsql` identifies it as a stored procedure, and the `EXTERNAL NAME` and `FENCED` claues identify it as an external SQL stored procedure. When you open a **.spsql** file in Db2 Developer Extension, you get some additional actions in the toolbar in the upper right corner of the view:

![Deploy and Run action icons]({{site.baseurl}}/assets/images/sp-toolbar-deploy-run.png)

From left to right, these actions are **Deploy** and **Run**. We'll cover each one in the following sections. 

**Note:** Db2 Developer Extension does not currently support debugging external SQL stored procedures.

## Deploying a stored procedure

Click the **Deploy** action to open the **Deployment** view. This is where you can set and customize deployment options and save the options for the **.spsql** file. These options are used only during deployment and do not impact the DDL source code.

The **Deployment** view consists of three sections: **Deployment options**, **Routine options**, and **External options**.

### Deployment options

![Deployment options]({{site.baseurl}}/assets/images/esp-deployment-options.png)

- Use the **Database connection** option to select a connection from the list of defined connections. See [Creating a database connection]({{site.baseurl}}/docs/the-basics/creating-a-database-connection.html) for more information.

- Use the **Target schema** option for unqualified stored procedures. This field is enabled only for unqualified stored procedures. If the stored procedure is qualified (lsuch as the one in our example CREATE PROCEDURE statement, which is qualified to ADMF001), the field is disabled. If you leave this field empty, the JDBC property `currentSchema` will be used. If `currentSchema` is not set, the JDBC connection username will be used.

- Use the **Build owner** option to specify the owner of the stored procedure. If this field is left empty, the JDBC property `currentSQLID` will be used. If `currentSQLID` is not set, the JDBC connection username will be used.

- Use the **Default path** option for resolving an unqualified data type, function, or procedure referenced by the procedure that's being deployed. You can specify multiple schemas, each one separated by a comma. For example:

```
    "ADMF002","ADMF003","ADMF004"
```

- Use the **Duplicate handling** option to specify the behavior of the deployment if the procedure already exists:

  - **Drop duplicates** calls DROP PROCEDURE before running the CREATE PROCEDURE DDL if the procedure already exists and creates the procedure.

  - **Treat duplicate deployments as errors** returns an error if the procedure already exists. If other versions of the procedure do not already exist, the procedure is created.

**Note:** Not all options mentioned above are displayed due to screen size limit.

If you're new to SQL and want more information about embedding SQL in host languages, there's a lot of information about this topic in the [Db2 for z/OS documentation](https://www.ibm.com/support/knowledgecenter/en/SSEPEK_13.0.0/apsg/src/tpc/db2z_programembeddedsql.html).

### Routine options

![Routine options]({{site.baseurl}}/assets/images/esp-routine-options.png)

- The **Enable debugging** option is currently not available for external SQL stored procedures.

- Use the **WLM environment** option to specify which Workload Manager environment will be used to debug the procedure. If you enable debugging but leave this field empty, the default WLM environment will used.

- Use the **ASU time limit** option to set the ASUTIME, which is the number of CPU seconds permitted for each SQL statement. The default value of 0 means NO LIMIT and is not recommended.

- Use the **Additional routine options** field to specify any additional options that you want to include. Separate each option with a semicolon. For example:

```
   QUALIFIER ADMF002; ISOLATION LEVEL RS
```

### External options

![External SQL options]({{site.baseurl}}/assets/images/esp-sql-options.png)

- The **Build utility** field identifies the Db2 SQL procedure processor, [SYSPROC.DSNTPSMP](https://www.ibm.com/docs/en/db2-for-zos/13?topic=deprecated-creating-external-sql-procedure-by-using-dsntpsmp), which is used to create an external SQL stored procedure.

- Use the **Precompile options** option to specify options for precompiling the C language program that Db2 generates for the external SQL procedure. Do not specify the HOST option. For a list of these options see [SQL processing options](https://www.ibm.com/docs/en/db2-for-zos/13?topic=processing-descriptions-sql-options).

- Use the **Compile options** option to specify options for compiling the C language program that Db2 generates for the external SQL procedure.

- Use the **Prelink options** option to specify options for prelinking the C language program that Db2 generates for the external SQL procedure.

- Use the **Link options** option to specify options for linking the C language program that Db2 generates for the external SQL procedure.

- Use the **Bind options** option to specify options for binding the external SQL procedure package. Do not specify the MEMBER or LIBRARY option for the Db2 BIND PACKAGE command. For a list of these options, see [BIND and REBIND options](https://www.ibm.com/docs/en/db2-for-zos/13?topic=commands-bind-rebind-options-packages-plans-services).

Click **Deploy** to finish the configuration and begin the deployment process for the procedure.

## Running a stored procedure

Click the **Run** action to start execution process. If your stored procedure contains input variables, you'll be prompted to specify values for them before the stored procedure executes, as shown in the following figure. Note that built-in data types for each input variable are detected automatically and are set to the correct data type.

If you have an input type that's an array, you'd specify the values like this:

```
numeric:   [1; 2; 3]
character: [hello; world]
```

![Input parameters for running]({{site.baseurl}}/assets/images/nsp-basics-run-parameters.png)

After your stored procedure is executed, the following output is displayed in these tabs:

- The **Status** tab contains overall execution status. If an error occurred, the status will contain **SQL code**, **SQL state**, and **Message text**.

![Status tab]({{site.baseurl}}/assets/images/nsp-basics-status-tab.png)

- The **Parameters** tab contains variable information for passed-in parameters.

![Parameters tab]({{site.baseurl}}/assets/images/nsp-basics-parameters-tab.png)

- The **SQL Results** view contains data if a result set is expected (in our example, a result set isn't expected so the **Result** tab isn't shown).

<!--
## Specifying additional options

You can specify and save additional run options by right-clicking inside the editor and selecting **Run SQL Options**.

![Run SQL Options]({{site.baseurl}}/assets/images/esp-run-sql-options.png)

...which opens the **JDBC runtime options** view:

![JDBC runtime options]({{site.baseurl}}/assets/images/nsp-basics-jdbc-runtime-options.png)

This article covers only the following options that you can set in this view:

- Use the **Statement terminator character** option to set the statement terminator for the file.

- Use the **Current schema** option for resolving regular object types such as tables, views, and indexes.

- Use the **Current path** option for resolving an unqualified data type, function, or procedure referenced by the procedure that is being deployed.  You can specify multiple schemas by separating each one with a comma. For example:

```
    "ADMF002","ADMF003","ADMF004"
```

**About commit and rollback options:** The commit and rollback options behave a little differently with stored procedures. First, by default, all stored procedures run with COMMIT ON RETURN NO. You can change this behavior by including the COMMIT ON RETURN YES clause in your stored procedure DDL. If you need more control over the SQL statements in a stored procedure at the unit of work level, see [COMMIT and ROLLBACK statements in a stored procedure](https://www.ibm.com/support/knowledgecenter/SSEPEK_13.0.0/apsg/src/tpc/db2z_commitrollbacksp.html).

Second, Db2 Developer Extension runs only the first stored procedure in a file and ignores any other SQL statements that you might have selected to run. If you select **Commit on completion** or **Rollback changes on completion**, processing will end after the first stored procedure is processed, even if you intended to run additional SQL statements in that same file. See [Committing and rolling back changes]({{site.baseurl}}/docs/the-basics/committing-and-rolling-back-changes.html) for more information.
--> 

