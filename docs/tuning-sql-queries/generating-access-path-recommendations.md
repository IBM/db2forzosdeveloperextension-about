---
title: "Generating access path recommendations to improve query performance (Access Path Advisor)"
---

# {{ page.title }}

You can use the Access Path Advisor feature to generate access path recommendations that can improve the performance of a single query. 

**Note:** This feature requires a Db2 Query Workload Tuner for z/OS (QWTz) license. Make sure you have a valid license installed before you use this feature. See [Software requirements for using the SQL tuning features]({{site.baseurl}}/docs/tuning-sql-queries/sql-tuning-requirements.html) for more information.

1. Open an SQL file and click on the connection in the [Status Bar](https://code.visualstudio.com/docs/getstarted/userinterface). Select a Db2 connection from the list that’s displayed. Make sure the connection that you select already has a tuning connection profile associated with it. If not, see [Associating a tuning connection profile with a Db2 connection](https://ibm.github.io/db2forzosdeveloperextension-about/docs/tuning-sql-queries/setting-up-a-basic-tuning-environment.html#associating-a-tuning-connection-profile-with-a-db2-connection).

    **Note:** The message “No connection” is displayed in the **Status Bar** if a Db2 connection hasn’t been associated with the file.

2. Right-click in the .sql file and select **SQL Tuning Options**. The **Customize Tuning Options** dialog is displayed.

3. Verify that the tuning options, such as SQL ID, schema, and current path, are correct for the environment in which you want to tune SQL queries.

4. If you changed any tuning options, click **Save**. Otherwise, close the **Customize Tuning Options** dialog. The SQL statement is redisplayed.

   ![Running tuning actions]({{site.baseurl}}/assets/images/tuning-common-actions.gif)

5. Select the entire statement, right-click, and select **Tune Selected SQL**. The **Tuning Actions** dialog opens in the right side of the editor, and the statement is displayed at the top of the dialog.

6. Select the **Access Path Advisor** checkbox and click **Tune**. The **Tuning Summary** window opens, which shows that the status for Access Path Advisor is Pending. When the job completes, the status changes to Success, and the **TUNING HISTORY** view is populated with the result.

7. Click **Access Path Advisor** in the **TUNING HISTORY** view. The summary and recommendations for improving the query's access path are displayed.

   ![Access Path Advisor recommendations]({{site.baseurl}}/assets/images/tuning-access-path-advisor-recommendations.gif)

8. Evaluate the recommendations and consider implementing them in order of severity. You might want to apply the high severity recommendations first, and then rerun the query to see if performance has improved. Continue applying additional recommendations until the query performs at an acceptable level.
