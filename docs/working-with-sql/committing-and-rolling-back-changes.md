---
title: "Committing and rolling back changes"
---

# {{ page.title }}

Db2 Developer Extension provides a lot of flexibility with committing and rolling back the results of running SQL statements. This granular level of control is especially useful when you're prototyping and testing because it allows you to identify which statements run successfully and which cause errors without potentially corrupting your test system.

For example, you can:

- Commit the changes for each SQL statement as soon as it completes successfully
- Commit the changes for all SQL statements only if all the statements run successfully
- Roll back all of the changes even if all of the statements run successfully

Depending on the commit or rollback option you select, you have the following options for what happens when an error occurs while running your SQL:

- Continue to process the remaining SQL statements that you selected to run
- Stop processing as soon as the first error occurs
- Stop processing and immediately roll back all changes

You set these options by right-clicking in your file and selecting **Run SQL Options** from the context menu to display the **JDBC runtime options** view. You use the **Action when script runs successfully** box to set commit and rollback options, and you use the **Action when an error occurs** box to control how Db2 Developer Extension responds when a SQL statement fails.

Let's start with this scenario: Our company has just formed a new Client Support department and has staffed it with some existing employees and some new employees. We need to update two tables with information about the new department and its members. We'll use a couple of Db2-supplied sample tables, [DSN8C10.DEPT](https://www.ibm.com/support/knowledgecenter/SSEPEK_13.0.0/intro/src/tpc/db2z_sampletablesdepartment.html) and [DSN8C10.EMP](https://www.ibm.com/support/knowledgecenter/SSEPEK_13.0.0/intro/src/tpc/db2z_sampletablesemployeemain.html), to demonstrate how the commit, roll back, and error-handling options work.

Here's the correct SQL for making these changes:

```
UPDATE DSN8C10.DEPT SET DEPTNAME = 'CLIENT SUPPORT' WHERE DEPTNO = 'E01';
INSERT INTO DSN8C10.DEPT VALUES ('A01', 'AI AD TEAM', '000070', 'D01', 'SVL');
SELECT * FROM DSN8C10.DEPT WHERE DEPTNO = 'A01';
UPDATE DSN8C10.EMP SET SALARY = SALARY * 1.1 WHERE WORKDEPT = 'A00';
SELECT * FROM DSN8C10.EMP WHERE WORKDEPT = 'A00';
```

To help demonstrate the available actions when an error occurs, we're going to introduce a few errors into this SQL in the following sections.

## Commit after each statement

Select **Commit after each statement** to commit each individual SQL statement after it runs successfully.

![Commit after each statement dialog]({{site.baseurl}}/assets/images/commit-rollback-commit-after-each-stmt.png)

Here's the SQL to update the DSN8C10.DEPT and DSN8C10.EMP tables. In this example, the INSERT statement and the second UPDATE and SELECT statements contain errors.

```
UPDATE DSN8C10.DEPT SET DEPTNAME = 'CLIENT SUPPORT' WHERE DEPTNO = 'E01';
INSERT INTO DSN8C10.DEPT VALUES (‘A01’, ‘AI AD TEAM’, ‘M001’, ‘D01’);
SELECT * FROM DSN8C10.DEPT WHERE DEPTNO = 'A01';
UPDATE DSN8C10.EMP SET SALARY = SALARY * 1.1 WHERE DEPT = 'A00';
SELECT * FROM DSN8C10.EMP WHERE DEPTNO = 'A00';
```

And here are the results from running that SQL, which resulted in three errors:

- If you select **Processing continues**, all of the SQL statements will continue to run after the first error (INSERT INTO DSN8C10.DEPT...) occurred, and the successful UPDATE statement will be committed. The results would look like this:

![Commit after each statement Processing continues results]({{site.baseurl}}/assets/images/commit-rollback-commit-after-each-stmt-processing-continues.png)

- If you select **Processing stops**, all of the SQL statements after the first error will not be not be run, but the successful UPDATE statement will still be committed. The results would look like this instead:

![Commit after each statement Processing stops results]({{site.baseurl}}/assets/images/commit-rollback-commit-after-each-stmt-processing-stops.png)

- If you correct the three statements that are causing errors so that all of these statements run error free, each statement will be committed as soon as it ran successfully, regardless of the error action that you selected, and the results would look like this:

![Commit on completion successful results]({{site.baseurl}}/assets/images/commit-rollback-successful-results.png)

## Commit on completion

Select **Commit on completion** to wait until all of the SQL statements that you have selected to run have completed before committing any of them.

![Commit on completion dialog]({{site.baseurl}}/assets/images/commit-rollback-commit-on-completion.png)

Here's the SQL to update the DSN8C10.DEPT and DSN8C10.EMP tables, which contains one error in the INSERT statement:

```
UPDATE DSN8C10.DEPT SET DEPTNAME = 'CLIENT SUPPORT' WHERE DEPTNO = 'E01';
INSERT INTO DSN8C10.DEPT VALUES  ('A01', 'AI AD TEAM', 'M001, 'D01');
SELECT * FROM DSN8C10.DEPT WHERE DEPTNO = 'A01';
UPDATE DSN8C10.EMP SET SALARY = SALARY * 1.1 WHERE WORKDEPT = 'A00';
SELECT * FROM DSN8C10.EMP WHERE WORKDEPT = 'A00';
```

And here are the results from running that SQL, which resulted in a single error:

- If you select **Processing continues**, all the SQL statements that you selected will continue to run after an error occurs, and both UPDATE statements will be committed when processing ends. The results would look like this:

![Commit on completion Processing continues results]({{site.baseurl}}/assets/images/commit-rollback-commit-on-completion-processing-continues.png)

- If you select **Processing stops**, all of the SQL statements after the first error will not be run. Only the first UPDATE statement will be committed when processing ends. The results would look like this:

![Commit on completion Processing stops results]({{site.baseurl}}/assets/images/commit-rollback-commit-on-completion-processing-stops.png)

- If you select **Processing stops and changes are rolled back**, all of the SQL statements after the first error will not be run. Changes from the first UPDATE statement will not be committed. The results would look like this:

![Commit on completion Roll back changes results]({{site.baseurl}}/assets/images/commit-rollback-commit-on-completion-rollback-changes.png)

- If you correct the INSERT statement so all of the SQL statements run error free, each statement would be committed after the last statement ran successfully regardless of the error action that you selected, and the results would look like this:

![Commit on completion successful results]({{site.baseurl}}/assets/images/commit-rollback-successful-results.png)

## Roll back changes on completion

Select **Roll back changes on completion** if you don't want to commit any changes that result from running your SQL, even if everything runs error free.

![Roll back changes on completion]({{site.baseurl}}/assets/images/commit-rollback-rollback-on-completion.png)

Here's the SQL to update the DSN8C10.DEPT and DSN8C10.EMP tables, which contains one error in the INSERT statement:

```
UPDATE DSN8C10.DEPT SET DEPTNAME = 'CLIENT SUPPORT' WHERE DEPTNO = 'E01';
INSERT INTO DSN8C10.DEPT VALUES  ('A01', 'AI AD TEAM', 'M001', 'D01');
SELECT * FROM DSN8C10.DEPT WHERE DEPTNO = 'A01';
UPDATE DSN8C10.EMP SET SALARY = SALARY * 1.1 WHERE WORKDEPT = 'A00';
SELECT * FROM DSN8C10.EMP WHERE WORKDEPT = 'A00'
```

And here are the results from running that SQL, which resulted in a single error:

- If you select **Processing continues**, all the SQL statements that you selected will continue to run after an error occurs. No changes will be committed. The results would look like this:

![Roll back changes on completion Processing continues results]({{site.baseurl}}/assets/images/commit-rollback-rollback-on-completion-processing-continues.png)

- If you select **Processing stops and changes are rolled back**, all of the SQL statements after the first error will not be run. Changes from the first UPDATE statement are not committed. The results would look like this:

![Roll back changes on completion Processing stops results and changes are rolled back results]({{site.baseurl}}/assets/images/commit-rollback-rollback-on-completion-processing-stops-rollback-changes.png)

- If you correct the INSERT statement so all of the SQL statements run error free, no changes will be committed regardless of the error action that was selected, and the results would look like this:

![Commit on completion successful results]({{site.baseurl}}/assets/images/commit-rollback-successful-results.png)

<!--- Add summary and links to other related articles --->
