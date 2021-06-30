---
title: "Limiting the number of rows returned"
---

# {{ page.title }}

For statements that return a huge number of rows in a result set, you can limit the number of rows that are returned by using the **Max Number of Rows Returned** extension setting. The value you specify in this field takes precedence over any FETCH clauses that you might have defined in your SQL.

To limit the number of rows that get returned when you run SQL statements:

1. Open Db2 Developer Extension and click the **Manage** icon at the lower left corner of VS Code window:

   ![Manage icon]({{site.baseurl}}/assets/images/manage-icon.png)

2. Click **Settings > Extensions > IBM Db2 for z/OS Developer Extension**.

3. Specify the maximum number of rows that will be returned in a result set in the **Max Number of Rows Returned** field:

![Specifying maximum number of rows returned]({{site.baseurl}}/assets/images/runsql-max-rows-returned-field.png)

For example, without setting the **Max Number of Rows Returned** field, the following SELECT statement will return 50 rows at most, and the following CALL statement will return all available rows:

```
SELECT NAME, CREATOR, CARDF FROM SYSIBM.SYSTABLES
WHERE CREATOR = 'SYSIBM'
FETCH FIRST 50 ROWS ONLY;

CALL SYSIBM.SQLTABLES(?, ?, ?, ?, ?);
```

If you set the **Max Number of Rows Returned** field to a positive integer value, let's say 10, running that SELECT statement will return only 10 rows. The same behavior applies to CALL statements that return a result set or multiple results.

![Specifying maximum number of rows returned]({{site.baseurl}}/assets/images/runsql-max-rows-returned.gif)
