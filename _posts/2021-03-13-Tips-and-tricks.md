---
layout: single
# classes: wide
title: "Tips and tricks"
toc: true
toc_sticky: true
---

Visual Studio Code and Db2 Developer Extension provide a modern IDE experience for Db2 for z/OS application developers. With this transition, are you taking full advantage of the editor and extension's features? Read along to learn how you can work more efficiently in this new development environment.

## Visual Studio Code tips

Visual Studio Code has many [useful features](https://code.visualstudio.com/docs/getstarted/tips-and-tricks) to increase your productivity. You can apply the following tips to many different extensions, but this article presents them from the perspective of Db2 Developer Extension.

### Running commands from the Command Palette

Visual Studio Code's [Command Palette](https://code.visualstudio.com/docs/getstarted/userinterface#_command-palette) allows you to execute commands quickly without navigating through the user interface. Visual Studio Code provides built-in commands, and Db2 Developer Extension provides its own commands.

To run a Db2 Dev Extension command, open the **Command Palette** and start typing "Db2 Developer Extension." You'll be presented with a list of all the extension-related commands that you can execute.

![VS Code command palette]({{site.baseurl}}/assets/images/tips-tricks-command-palette.gif)

### Creating your own code snippets

Visual Studio Code has built-in snippets and Db2 Dev Extension has its own snippets. If you want to create your own set of code snippets, read [Create your own snippets](https://code.visualstudio.com/docs/editor/userdefinedsnippets#_create-your-own-snippets) in the Visual Studio Code documentation.

Here's an example of how to create your own `CREATE TABLESPACE` snippet for files associated with the SQL language.
1. Open the **Command Palette** and select **Preferences: Configure User Snippets**.
2. Select **sql (SQL)** from the list.
3. In the snippet file, paste the following content and save it.
```
{
  "CREATE TABLESPACE statement": {
    "prefix": "CREATE TABLESPACE statement",
    "body": [
      "CREATE TABLESPACE ${1:tablespace-name}",
      "\tIN ${2:database-name}",
      "\tUSING STOGROUP ${3:stogroup-name};",
    ],
    "description": "Sample CREATE TABLESPACE statement"
  }
}
```
4. Now start typing `CREATE TABLESPACE` in any SQL file to use the snippet.

![Creating a custom code snippet]({{site.baseurl}}/assets/images/tips-tricks-custom-snippet.gif)

## Db2 Developer Extension tips

Db2 Developer Extension provides syntax highlighting, code snippets, SQL execution support, and native stored procedure support. The following tips are useful when you're working with the extension.

### Changing a connection name

When you create a connection, a connection name is automatically generated based on the connection information. You can change this name by editing the connection and changing the **Connection name** field.

### Changing the connection that's used to run SQL

Before you can run SQL from a file, you need to associate a Db2 connection to the file. To change the connection that's associated with a file, open the file and click on the connection in the [Status Bar](code.visualstudio.com/docs/getstarted/userinterface.html). Select a different connection from the list that's displayed.

**Note:** The message "No connection" is displayed in the **Status Bar** if a connection hasn't been associated with the file.

![Changing the connection used to run SQL]({{site.baseurl}}/assets/images/tips-tricks-change-connection.gif)

This method of changing the connection also applies to running and debugging native stored procedures, but it doesn't apply to deploying native stored procedures. You select the connection that's used to deploy a native stored procedure in the [Deployment options](https://github.com/IBM/db2forzosdeveloperextension-about#deploying-a-native-stored-procedure).

### Comparing SQL results

When you open SQL results for a completed execution, the results are displayed in the active [editor group](https://code.visualstudio.com/docs/getstarted/userinterface#_editor-groups). To compare two SQL results side-by-side, open each set of SQL results in different editor groups.

![Comparing SQL results]({{site.baseurl}}/assets/images/tips-tricks-comparing-SQL-results.gif)

### Saving SQL results to a file

Any SQL results that generate a result set can be saved to a file. To save the results to a file, open a SQL result, go to the **Result** tab, and click the **Save** icon. When prompted, enter the location and name of the file. Press **Enter** to save the results to the specified file.

![Saving SQL results]({{site.baseurl}}/assets/images/tips-tricks-saving-SQL-results.gif)

## Troubleshooting

When the extension is not working as expected, you can check the extension's logs to see if you can resolve the issue yourself. If you can't resolve the issue yourself, you can open an issue on the [extension's GitHub Issues](https://github.com/IBM/db2forzosdeveloperextension-about/issues) and attach the logs. The following sections describe how to enable, view, and find the extension's logs.

### Enabling logging

When logging is enabled, Db2 Developer Extension collects information when you're using the extension, and it collects JDBC information when you're interacting with Db2 systems.

- To enable the extension's logging, open the **Command Palette** and select **Preferences: Open Workspace Settings**. Search for the `db2forzosdeveloperextension.debug.logLevel` setting and select a log level.

- To enable JDBC logging, edit a connection and enable the driver trace in the **Tracing** tab.

### Viewing the logs

To view the logs collected by Db2 Developer Extension directly in Visual Studio Code, go to **View > Output**. Select the `db2forzosdeveloperextension` channel from the dropdown menu. Only the general extension logs are printed here. Instructions for viewing the JDBC logs are provided in the following section.

### Locating the log files

To locate the log files that are produced by Db2 Developer Extension, open the **Command Palette** and select **Developer: Open Extension Logs Folder**. The logs for Db2 Developer Extension are located in the `IBM.db2forzosdeveloperextension` folder.

Files that start with `client` and `server` are the general Db2 Developer Extension logs.  Files that start with a connection's name are the JDBC logs for that connection.

