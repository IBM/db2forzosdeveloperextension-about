---
layout: single
# classes: wide
title:  "Getting started"
toc: true
toc_sticky: true
---

Db2 for z/OS Developer Extension provides a number of features that make it easy for you to write well-formed SQL, including code snippets, syntax highlighting, code completion, and signature help.  It also also provides built-in capability for connecting to Db2 for z/OS databases and running your SQL. This article provides an introduction to using these basic features.

## Creating a simple SQL statement

1. Open the Db2 Developer Extension view in Visual Studio Code either by clicking **View > Extensions** and selecting it from the list of extensions or by clicking the following icon in the **Activity Bar**: ![Db2 Developer Extension icon]({{site.baseurl}}/assets/images/getting-started-dde-icon.png)

2. Now, create a new file by clicking **File > New File**. Save your file as *anyname*.sql. The **.sql** suffix identifies the file to Db2 Developer Extension as an SQL file, so as soon as you save it you can start using Db2 Developer Extension's editing features.

    **Note:** Although our examples use a **.sql** file, you can embed SQL in any type of file and run that SQL directly from Db2 Developer Extension. See [Running SQL from different types of files]({{site.baseurl}}/2021/03/12/Running-SQL-from-different-types-of-files.html) for more information.

3. Type the first letters of the SELECT statement. You'll only need to type a few letters before `SELECT statement` shows up in the list of available SQL elements. 

    ![SELECT statement code snippet]({{site.baseurl}}/assets/images/getting-started-select-snippet.png)

4. Click `SELECT statement` to insert a code snippet that provides the basic structure of this statement, including required and commonly used parameters.

    ![SELECT statement code snippet]({{site.baseurl}}/assets/images/getting-started-select-snippet-structure.png)

    Notice a few things about the code that was added:

    - The snippet contains just the basic parameters. Many SQL statements have a ton of parameters, too many for even the most experienced developer to remember, so a link to the complete syntax is provided at the top of the snippet.

    - The syntax elements are color coded based on element type. For example, keywords are one color and variables are a different color. Syntax highlighting makes it easier to parse your code and to pick out the elements that you're looking for. Also, if you prefer to use a different color scheme, you can [customize the highlighting theme](https://community.ibm.com/community/user/ibmz-and-linuxone/blogs/kendrick-ren1/2020/08/18/customizing-themes-for-sql-syntax-in-vsc) to suit your preferences.

    - Hover over one of the elements that's underlined with a squiggly line, such as `search-condition`,  and notice that a message is displayed that indicates a syntax error. Whenever possible, these messages include potential fixes for the syntax error. To display all of the syntax errors in a file, you can click **View problems** in one of these pop-up messages or you can open the **PROBLEMS** by clicking **View > Problems**. 

5. Let's get back to that SELECT statement. Highlight `column-name` after the `SELECT` keyword, type `LOC` and press **Ctrl + Space**. The `LOCATE_IN_STRING` clause shows up in a list of available syntax elements. Select it to insert it, then type an open parenthesis to display a description of the `LOCATE_IN_STRING` syntax and a link to detailed reference information about it. 

![Code completion for LOCATE_IN_STRING]({{site.baseurl}}/assets/images/getting-started-code-completion.png)

These features are useful when you know which syntax element you want to insert, but maybe you don't know the precise syntax that you need to enter. They also save you time and reduce the chance that you enter something incorrectly.

## Creating a database connection

Before you can run your SQL, you need to connect to the Db2 for z/OS subsystem that contains the database that you want to work with. You can use Db2 Developer Extension's integrated database connection capability to add a connection.

From the **CONNECTIONS** menu in the right side bar, click the plus sign (**+**) to open the **Add Connection** dialog.

![Adding a database connection]({{site.baseurl}}/assets/images/getting-started-add-connection.png)

- Use the **General** tab to specify basic connection information about the Db2 subsystem and valid user credentials for connecting to that Db2 subsystem.

- If you run into problems when you define a new connection or when you run your SQL against an existing connection, and those problems are related to the data server driver, open the **Tracing** tab and turn **Enable driver trace** to **On**. The Troubleshooting section of [Tips and tricks]({{site.baseurl}}/2021/03/13/Tips-and-tricks.html) provides more information about the logs that are produced when you enable tracing.

- If you want to include [additional properties](https://www.ibm.com/support/knowledgecenter/SSEPEK_12.0.0/java/src/tpc/imjcc_r0052607.html) in your database connection, open the **Optional** tab and enter the property name and assign it a value. Select the checkbox to the left of a property to include it in a database connection. Click the blue plus sign (**+**) to add a new line.

When you're done, click **Finish**. If your database connection was created successfully, it'll be added to the **CONNECTIONS** menu in the right side bar. If not, open the **Tracing** tab, enable tracing, and try again. Then, check the logs for more information about why the connection isn't being added.

## Running an SQL statement

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

    The results are displayed in the **SQL Results** page that opens when the statement completes and stored in the **Query History** list. You can also save the results in a **.csv** file or in a spreadsheet. 

When you're comfortable with using the basic features of Db2 Developer Extension, check out [Tips and tricks]({{site.baseurl}}/2021/03/13/Tips-and-tricks.html) and  [Creating stored procedures]({{site.baseurl}}/2021/03/16/Creating-stored-procedures.html) to learn more about Db2 Developer Extension's capabilities.
