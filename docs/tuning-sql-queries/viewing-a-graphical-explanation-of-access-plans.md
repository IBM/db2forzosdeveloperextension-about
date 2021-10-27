---
title: "Viewing a graphical explanation of access plans (Visual Explain)"
---

# {{ page.title }}

You can use the Visual Explain feature of Db2 Developer Extension to generate a graphical representation of the access paths for an SQL statement. This information is useful for tuning queries for better performance.

1. Open an SQL file and click on the connection in the [Status Bar](https://code.visualstudio.com/docs/getstarted/userinterface). Select a Db2 connection from the list that's displayed. Make sure the connection that you select already has a tuning connection profile associated with it. If not, see [Associating a tuning connection profile with a Db2 connection]({{site.baseurl}}/docs/tuning-sql-queries/setting-up-a-basic-tuning-environment.html#associating-a-tuning-connection-profile-with-a-db2-connection).

   **Note:** The message "No connection" is displayed in the **Status Bar** if a Db2 connection hasn't been associated with the file.

2. Right-click in the .sql file and select **SQL Tuning Options**. The **Customize Tuning Options** dialog is displayed. 

3. Verify that the tuning options, such as SQL ID, schema, and current path, are correct.

4. If you changed any tuning options, click **Save**.  Otherwise, close the **Customize Tuning Options** dialog. The SQL statement is redisplayed.

    ![Running tuning actions]({{site.baseurl}}/assets/images/tuning-common-actions.gif)

5. Select the entire statement, right-click, and select **Tune Selected SQL**. The **Tuning Actions** dialog opens in the right side of the editor, and the statement is displayed at the top of the dialog.

6. Select the **Visual Explain** checkbox and click **Tune**. The **Tuning Summary** window opens, which shows that the status for Visual Explain is Pending. When the Visual Explain action completes, the status changes to Success, and the **TUNING HISTORY** view is populated with the results.

7. Select the results from the **TUNING HISTORY** view to open the diagram in the extension.

    ![Running Visual Explain]({{site.baseurl}}/assets/images/tuning-visual-explain.gif)

   You can also open the diagram in a new browser window or tab by clicking the **Open diagram in a new window** icon (![Open in new window icon]({{site.baseurl}}/assets/images/tuning-open-in-new-window-icon.png)).

    
