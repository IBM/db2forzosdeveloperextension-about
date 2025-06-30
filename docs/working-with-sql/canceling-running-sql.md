---
title: "Canceling running SQL statements"
---

# {{ page.title }}

Db2 Developer Extension provides support for canceling SQL statements while they are running. This feature is useful when you need to cancel long-running or unresponsive SQL statements.

Note: Currently, only SQL statements executed from files that end with **.sql** can be canceled.


Currently, only SQL statements that are executed from the SQL editor using the **Run All** or **Run Selected SQL** options can be canceled.


When an SQL script is running, a notification with the the **Cancel** button is displayed in the lower right corner of the window.

![Canceling running SQL statement button]({{site.baseurl}}/assets/images/cancel-running-sql-button.png)

The commit and rollback options that you selected before running your SQL statements determine which SQL statements are committed.

- If you selected the **Commit after each statement** option, each individual SQL statement prior to cancelation is committed.

- If you selected the **Commit on completion** option and the **Processing stops** option, only the successfully completed SQL statements are retained and committed.

- If you selected the **Commit on completion** option and the **Processing stops and changes are rolled back** option, the entire transaction is rolled back and all of the SQL statements are not retained.

For more information about commit and rollback behavior, see [Committing and rolling back changes]({{site.baseurl}}/docs/working-with-sql/committing-and-rolling-back-changes).

After you cancel a running SQL statement, you can view the status of the canceled SQL statement in the **QUERY HISTORY** view.
