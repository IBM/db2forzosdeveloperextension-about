---
title: "Committing or rolling back changes based on impact analysis"
---

# {{ page.title }}

Db2 Developer Extension provides the ability to generate an SQL execution impact report before you decide to commit or roll back the changes. Use this feature to analyze the impact of the SQL changes before you commit the changes to the database.

**Important:** When you use **Run SQL Impact** on an SQL file that contains a **COMMIT** or **ROLLBACK** statement, the SQL will be committed or rolled back automatically based on the values of those statements, and you will not be able to evaluate the impact report before deciding for yourself whether to commit or roll back the changes. Therefore, do not use **Run SQL Impact** on SQL that contains a **COMMIT** or **ROLLBACK** statement.

Note that the **Run SQL Impact** option is available only with the **Run All** option.

To run an SQL execution impact report:

1. Select a file, right-click, and select **Run SQL Impact**.
   
   **Run SQL Impact** executes all of the SQL statements within the file using the **Rollback changes on completion** and **Processing continues** options enabled. Upon completion, the **Execution summary** page is displayed.

   For more information about commit and rollback behavior, see [Committing and rolling back changes]({{site.baseurl}}/docs/working-with-sql/committing-and-rolling-back-changes).

2. Click **Yes** to re-execute the SQL statements and commit the changes to the database, or click **Cancel** to preserve rollback execution and not commit any changes.

  ![Execution summary with user prompt]({{site.baseurl}}/assets/images/execution-summary-with-prompt.png)

If you committed the changes to the database, the committed entry replaces the previous rollback entry in the **QUERY HISTORY** view. If you canceled and did not commit any changes, the impact report is shown as a rollback entry in the **QUERY HISTORY** view.

  ![Query History view showing rollback entry]({{site.baseurl}}/assets/images/rollback-entry-query-history.png)
