---
title: "Deploying and running external Java and SQLJ stored procedures"
---

# {{ page.title }}

This article shows you how to use Db2 Developer Extension to deploy an external Java or SQLJ stored procedure with various deployment options: altering previous deployments, setting target schema, and others. It also walks you through the process of running an external Java or SQLJ stored procedure.

**Tip:** If you're new to stored procedures, make sure you're familiar with the information in [Creating external Java stored procedures]({{site.baseurl}}/docs/working-with-stored-procedures/creating-external-java-stored-procedures.html) first.

One big advantage of using Db2 Developer Extension to deploy a stored procedure, as opposed to manually executing SQL, is that you can save the various deployment options separately from the SQL itself, which means that you can push your code into a source code manager, such as GitHub, without having to remove the deployment debug options first.

Another advantage is that you don't need to specify `--#SET TERMINATOR` in the header of **.spsql** or **.javaspsql** files. Db2 Developer Extension uses the number sign character (#) as the default terminator character, but you can use any terminator character you want by setting a SQL routine option (explained later in this article).

**Note:** Currently, Db2 Developer Extension deploy and run options support only one stored procedure per **.spsql** or **.javaspsql** file. When stored procedure options are specified, only the first stored procedure in the file will be executed; additional stored procedures and SQL statements will be ignored.

We'll use the following example stored procedure throughout this article to demonstrate how to deploy and run an external Java stored procedure. This stored procedure will read the total salary, including bonuses, from the table `SYSADM.EMP` from a passed in-parameter `DEPTNUMBER`. You can paste it into a file so that you try things out for yourself.

**Note:** Although the example is a Java stored procedure, the deployment process is the essentially same for a SQLJ stored procedure. Any differences between the two formats are noted in the instructions.



**TotalSalaryJavaSP.spsql**

```
CREATE PROCEDURE MYAPPS.TotalSalaryJavaSP(IN DEPTNUMBER CHAR(3),
  OUT DEPTSALARY DECIMAL(15,2),
  OUT DEPTBONUSCNT INT)
    LANGUAGE JAVA
    EXTERNAL NAME 'MYAPPS.TotalSalaryJavaSP:TotalSalary.getDeptSalary'
    PARAMETER STYLE JAVA
    WLM ENVIRONMENT WLMJAVA
    READS SQL DATA
```
And here is the example Java code that includes the SQL SELECT statement:

**TotalSalary.java**

```
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * A sample JDBC Java stored procedure that returns a result set.
 */
public class TotalSalary {
    public static void getDeptSalary(String DEPTNUMBER, BigDecimal[] DEPTSALARY, int[] DEPTBONUSCNT) throws SQLException {
        Connection conn = null;
        Statement stmt = null;
        String query = "SELECT SALARY, BONUS FROM SYSADM.EMP WHERE WORKDEPT = '" + DEPTNUMBER + "'";
        BigDecimal totalSalary = new BigDecimal(0);
        int bonusCount = 0;
        try {
            conn = DriverManager.getConnection("jdbc:default:connection");
            stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                BigDecimal bonus = rs.getBigDecimal(2);
                totalSalary = totalSalary.add(rs.getBigDecimal(1)).add(bonus);
                if (bonus.doubleValue() > 0)
                    bonusCount++;
            }
            DEPTSALARY[0] = totalSalary;
            DEPTBONUSCNT[0] = bonusCount;
        } catch (SQLException e) {
            throw e;
        } finally {
            if (null != stmt)
                stmt.close();
            if (null != conn)
                conn.close();
        }
    }
}
```

The file extension of `.spsql` identifies it as a stored procedure. When you open a **.spsql** or **.javaspsql** file in Db2 Developer Extension, you get some additional actions in the toolbar in the upper right corner of the view:

![Deploy, Debug, Run action icons]({{site.baseurl}}/assets/images/nsp-basics-action-toolbar.png)

From left to right, these actions are **Deploy**, **Debug**, and **Run**. We'll cover deploying and running in the following sections.

## Deploying a stored procedure

Click the **Deploy** action to open the **Deployment** view. This is where you can set and customize deployment options and save the options for the **.spsql** or **.javaspsql** file. These options are used only during deployment and do not impact the DDL source code.

The **Deployment** view consists of three sections: **Deployment options**, **Java options**, and **Routine options**.

### Deployment options

![Deployment options]({{site.baseurl}}/assets/images/jsp-deployment-options.png)

- Use the **Db2 connection** option to select a connection from the list of defined connections. See [Creating a database connection]({{site.baseurl}}/docs/the-basics/creating-a-database-connection.html) for more information.

- Use the **Target schema** option for unqualified stored procedures. This field is enabled only for unqualified stored procedures. If the stored procedure is qualified (like the one in our example CREATE PROCEDURE statement, which is qualified to MYAPPS), the field is disabled. If you leave this field empty, the JDBC property `currentSchema` will be used. If `currentSchema` is not set, the JDBC connection username will be used.

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

### Java options

![Java options]({{site.baseurl}}/assets/images/jsp-java-options.png)

- Use the **Java file path** option to specify the Java or SQLJ source file. It must have a public static void method, which works as an entry point for the stored procedure. The class name, declared package, and method name should match the external name defined in the CREATE PROCEDURE statement. If the Java class declares a package path, its location must match the package path to be able to compile properly.

- Use the **Java dependencies** option to specify any compilation and runtime dependencies that are required by the Java class. Dependent JARs are defined to Db2 if you select **Upload**; otherwise, dependent JARs are used only for compilation. Dependent JARs must be defined in the Java path on the server unless they've been defined already to Db2 by other Java stored procedures.

**Requirement:** If a dependent JAR file has its own dependent JAR files, save this JAR file and all its dependent JAR files on the server and add them to your JAVA path on the server. When you deploy this stored procedure, uncheck the **Upload** option for this JAR file and its dependent JAR files.

- Use the **Compatible JRE version** option to specify a JRE that is at the same level or lower than the JRE version that is on Db2 for z/OS database. If the specified JRE version is higher than the version on the database, the stored procedure will not run. 

- Select **Upload source to the database** field to include the associated Java source file when you deploy the stored procedure. If this option is not selected, you can run the stored procedure, but you will not be able to view the source for the stored procedure.

- Click **Refresh Java WLM environment** to ensure that the most current version of the stored procedure is run.

### Routine options

![Routine options]({{site.baseurl}}/assets/images/jsp-routine-options.png)

- Use the **Enable debugging** option to specify whether this procedure is available to be debugged.

- Use the **WLM environment** option to specify which Workload Manager environment will be used to debug the procedure. If you enable debugging but leave this field empty, the default WLM environment will used.

- Use the **Additional routine options** field to specify any additional options that you want to include. Separate each option with a semicolon. For example:

```
   QUALIFIER ADMF002; ISOLATION LEVEL RS
```

- For SQLJ stored procedures only, use the **Bind options** field to specify options for binding the external SQLJ procedure package. Do not specify the MEMBER or LIBRARY option for the Db2 BIND PACKAGE command. For a list of these options, see [BIND and REBIND options](https://www.ibm.com/docs/en/db2-for-zos/13?topic=commands-bind-rebind-options-packages-plans-services).

## Running a stored procedure

You can run a stored procedure by using any of the following methods:

- From within the catalog navigation view by clicking **Run** from the overflow menu
- From within a **.spsql** file by clicking **Run stored procedure** from the context menu or the **Run stored procedure** icon
- From the SQL editor either by clicking **Run All** or highlighting part of the file and clicking **Run Selected SQL**

If your stored procedure contains input variables, you’ll be prompted to specify values for them before the stored procedure executes, as shown in the following figure. Note that built-in data types for each input variable are detected automatically and are set to the correct data type.

If you have an input type that's an array, you'd specify the values like this:

```
numeric:   [1; 2; 3]
character: [hello; world]
```

**Note**: Arrays are not supported when you run a stored procedure from the SQL editor.

If your statement contains host variables or positional parameters, you'll be prompted to specify values for input variables and parameters.

![Input parameters for running]({{site.baseurl}}/assets/images/jsp-run-parameters.png)

After your stored procedure is executed, the following output is displayed in these tabs:

- The **Status** tab contains overall execution status. If an error occurred, the status will contain **SQL code**, **SQL state**, and **Message text**.

![Status tab]({{site.baseurl}}/assets/images/jsp-status-tab.png)

- The **Parameters** tab contains variable information for passed-in parameters.

![Parameters tab]({{site.baseurl}}/assets/images/jsp-parameters-tab.png)

- The **SQL Results** view contains data if a result set is expected (in our example, a result set isn't expected so the **Result** tab isn't shown).

<!-- 
## Specifying additional options

You can specify and save additional run options by right-clicking inside the editor and selecting **Run SQL Options**.

![Run SQL Options]({{site.baseurl}}/assets/images/nsp-basics-run-sql-options.png)

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
