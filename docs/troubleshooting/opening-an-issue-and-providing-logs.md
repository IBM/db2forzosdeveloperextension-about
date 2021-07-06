---
title: "Opening an issue and providing logs"
---

# {{ page.title }}

When the extension is not working as expected, you can check the extension's logs to see if you can resolve the issue yourself. If you can't resolve the issue yourself, you can open an issue on the [extension's GitHub Issues](https://github.com/IBM/db2forzosdeveloperextension-about/issues) and attach the logs. The following sections describe how to enable, view, and find the extension's logs.

## Enabling logging

When logging is enabled, Db2 Developer Extension collects information when you're using the extension, and it collects JDBC information when you're interacting with Db2 systems.

- To enable the extension's logging, open the **Command Palette** and select **Preferences: Open Workspace Settings**. Search for the `db2forzosdeveloperextension.debug.logLevel` setting and select a log level.

- To enable JDBC logging, edit a connection and enable the driver trace in the **Tracing** tab.

## Viewing the logs

To view the logs collected by Db2 Developer Extension directly in Visual Studio Code, go to **View > Output**. Select the `db2forzosdeveloperextension` channel from the dropdown menu. Only the general extension logs are printed here. Instructions for viewing the JDBC logs are provided in the following section.

## Locating the log files

To locate the log files that are produced by Db2 Developer Extension, open the **Command Palette** and select **Developer: Open Extension Logs Folder**. The logs for Db2 Developer Extension are located in the `IBM.db2forzosdeveloperextension` folder.

Files that start with `client` and `server` are the general Db2 Developer Extension logs.  Files that start with a connection's name are the JDBC logs for that connection.
