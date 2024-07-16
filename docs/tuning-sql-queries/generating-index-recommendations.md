---
title: "Generating index recommendations to improve query performance (Index Advisor)"
---

# {{ page.title }}

You can use the Index Advisor feature to generate recommendations for creating, altering, or dropping indexes that can improve the performance of the query. This feature provides the DDL scripts that you can run and information about the existing indexes from the query that you're tuning. 

**Note:** This feature requires a Db2 Query Workload Tuner for z/OS (QWTz) license. Make sure you have a valid license installed before you use this feature. See [Software requirements for using the SQL tuning features]({{site.baseurl}}/docs/tuning-sql-queries/sql-tuning-requirements.html) for more information.

1. Open an SQL file and click on the connection in the [Status Bar](https://code.visualstudio.com/docs/getstarted/userinterface). Select a Db2 connection from the list that’s displayed. If you are using a tuning profile, make sure the connection that you select already has a tuning profile associated with it. If not, see [Creating a tuning profile]({{site.baseurl}}/docs/tuning-sql-queries/setting-up-a-tuning-environment.html#optional-creating-a-tuning-profile).

   **Note:** The message "No connection" is displayed in the **Status Bar** if a Db2 connection hasn't been associated with the profile.

2. Right-click in the .sql file and select **SQL Tuning Options**. The **Customize Tuning Options** dialog is displayed.

3. Verify that the tuning options, such as SQL ID, schema, and current path, are correct for the environment in which you want to tune SQL queries.

4. If you changed any tuning options, click **Save**. Otherwise, close the **Customize Tuning Options** dialog. The SQL statement is redisplayed.

   ![Running tuning actions]({{site.baseurl}}/assets/images/tuning-common-actions.gif)

5. Select the entire statement, right-click, and select **Tune Selected SQL**. The **Tuning Actions** dialog opens in the right side of the editor, and the statement is displayed at the top of the dialog.

6. Select the **Index Advisor** checkbox and click **Tune**. The **Tuning Summary** window opens, which shows that the status for Index Advisor is Pending. When the job completes, the status changes to Success, and the **TUNING HISTORY** view is populated with the result.

7. Click **Index Advisor** in the **TUNING HISTORY** view. The recommended candidate indexes and existing indexes are displayed.
  
   ![Index Advisor recommendations]({{site.baseurl}}/assets/images/tuning-index-advisor-recommendations.gif)

8. Evaluate the recommendations that are generated and use the DDL that is provided to implement them.
