---
title: "Comparing access paths (Access Path Comparison)"
---

# {{ page.title }}

The Access Path Comparison feature of Db2 Developer Extension enables you to compare two access paths and display the results of the comparison in Visual Studio Code or in a browser. A graphical representation of the access path flow is provided for each access path along with any differences in the [PLAN_TABLE](https://www.ibm.com/docs/en/db2-for-zos/13?topic=tables-plan-table) records for each access path.

From the results view, you can also display additional information about the comparison including the SQL statements associated with the access paths, any warnings that were issued, environment and explain options, and recommendations for improving the access path. 

**Note:** This feature requires a Db2 Query Workload Tuner for z/OS (QWTz) license. Make sure you have a valid license installed before you use this feature. See [Software requirements for using the SQL tuning features]({{site.baseurl}}/docs/tuning-sql-queries/sql-tuning-requirements.html) for more information.

**Before you begin:** To compare two access paths, the jobs associated with the selected access paths must meet the following criteria:

- Both jobs must be at the parent (root) level in the **TUNING HISTORY** view.
- Both jobs must have completed successfully.
- The jobs cannot be the results of a previous access path comparison.
- Both jobs must have been run on the same tuning services server.

1. Start the access path comparison process by using either of the following methods:

   - In the **TUNING HISTORY** view, click the first job that you want to include in the comparison, then right-click the second job that you want to include in the comparison. Click **Compare Selected Access Paths** in the menu that opens to start the access path comparison.

   ![Selecting access path comparison jobs by clicking them]({{site.baseurl}}/assets/images/tuning-access-path-comparison-selected.gif)

   - Copy the job ID of one of the jobs that you want to include in the comparison, then in the **TUNING HISTORY** view, click the first job that you want to include in the comparison. Click **Compare Access Paths with Job ID** in the menu that opens, paste the job ID and press Enter to start the access path comparison.

   ![Selecting access path comparison jobs by specifying a job ID]({{site.baseurl}}/assets/images/tuning-access-path-comparison-job-id.gif)

2. Click the Access Path Comparison entry in the **TUNING HISTORY** view to display the results in Visual Studio Code. 

   ![Access path comparison results]({{site.baseurl}}/assets/images/tuning-access-path-comparison-result.gif)

You can also open the results in a new browser window or tab by clicking the **Open in Browser** icon (![Open in new window icon]({{site.baseurl}}/assets/images/tuning-open-in-new-window-icon.png)) or by right-clicking the entry and selecting **Open in Browser**.
