---
layout: single
# classes: wide
title:  "Running multiple SQL statements"
toc: false
toc_sticky: false
---

When you run multiple SQL statements simultaneously by using the **Run Selected SQL** option or all of the SQL statements in a file by using the **Run All** option, when the statements finish executing, the results are displayed in the **Execution summary** page:

   ![Execution summary page]({{site.baseurl}}/assets/images/runsql-execution-summary.gif)

The **Execution summary** page indicates the total number of statements that ran, the execution status of each statement (success, failure, warning), and the total amount of time that it took to run the statements.

**Note:** A value of N/A in the **Total elapsed time** field indicates that the execution results were generated prior to upgrading to Db2 Developer Extension 1.2.

Db2 Developer Extension maintains the execution history so that you can compare SQL execution results over time. Statements are grouped together in an expandable section in the **QUERY HISTORY** view. Click an individual statement to display details about just that statement.

The query history is sorted in descending order by default. To sort the query history in ascending order, hover on the **QUERY HISTORY** view and click the **Sort Query History** icon (![Sort query history icon]({{site.baseurl}}/assets/images/runsql-sort-query-history-icon.png)).

   ![Sort Query History]({{site.baseurl}}/assets/images/runsql-sort-query-history.png)

Warning and failure icons indicate which statements might need some debugging.  To cycle through all of the statements that failed, click the **Next Failure** icon  (![Next Failure]({{site.baseurl}}/assets/images/runsql-next-failure-icon.png)) and the next failing SQL statement is displayed.

   ![Failures and warnings]({{site.baseurl}}/assets/images/runsql-next-failure.png)
