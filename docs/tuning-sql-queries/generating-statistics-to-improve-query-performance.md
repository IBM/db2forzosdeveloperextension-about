---
title: "Generating statistics to improve query performance (Statistics Advisor)"
---

# {{ page.title }}

You can use the Statistics Advisor feature of Db2 Developer Extension to generate a recommended set of [RUNSTATS commands](https://www.ibm.com/docs/en/db2-for-zos/12?topic=utilities-runstats) to improve query performance. 

1. Open an SQL file and click on the connection in the [Status Bar](https://code.visualstudio.com/docs/getstarted/userinterface). Select a Db2 connection from the list that's displayed. Make sure the connection that you select already has a tuning connection profile associated with it. If not, see [Associating a tuning connection profile with a Db2 connection]({{site.baseurl}}/docs/tuning-sql-queries/setting-up-a-basic-tuning-environment.html#associating-a-tuning-connection-profile-with-a-db2-connection).

   **Note:** The message "No connection" is displayed in the **Status Bar** if a Db2 connection hasn't been associated with the file.

2. Right-click in the .sql file and select **SQL Tuning Options**. The **Customize Tuning Options** dialog is displayed. 

   a. Verify that the tuning options, such as SQL ID, schema, and current path, are correct.

   b. If this is the first time that you're running Statistics Advisor for a particular SQL statement, leave the **Re-EXPLAIN the query** checkbox selected. 

   **Tip:** If you've already run EXPLAIN on the statement (for example, by running Visual Explain), you can clear this checkbox and then copy the Job ID of the EXPLAIN job and paste it in the **Job ID** field.

   c. Optionally set the following Statistics Advisor options:

   - Set **Execute immediately** to **YES** if you want to run the recommended RUNSTATS commands immediately when the Statistics Advisor job ends.
   - Set **Set profile** to **YES** if you want to set (update) the generated RUNSTATS statements to the target table profile or profiles.

3. If you changed any tuning options, click **Save**. Otherwise, close the **Customize Tuning Options** dialog. The SQL statement is redisplayed.

   ![Running tuning actions]({{site.baseurl}}/assets/images/tuning-statistics-advisor-actions.gif) 

4. Select the entire statement, right-click, and select **Tune Selected SQL**. The **Tuning Actions** dialog opens in the right side of the editor, and the statement is displayed at the top of the dialog.

5. Select the **Statistics Advisor** checkbox and click **Tune**. The **Tuning Summary** window opens, which shows that the status for Statistics Advisor is Pending. When the Statistics Advisor action completes, the status changes to Success, and the **TUNING HISTORY** view is populated with the results.

6. Click **Statistics Advisor** in the **TUNING HISTORY** view. The recommended RUNSTATS commands are displayed, and if you selected **Run immediately** the results are also displayed.

   ![Running Statistics Advisor]({{site.baseurl}}/assets/images/tuning-statistics-advisor.gif) 
