---
title: "Column names being interpreted as variables"
---

# {{ page.title }}

The ability to [run selected SQL within a stored procedure]({{site.baseurl}}/docs/working-with-sql/running-sql-from-within-a-stored-procedure) contains an extended feature that detects declared variables within the stored procedure as input variables and prompts you to provide values that could be used for convenience. 

However, Db2 Developer Extension cannot distinguish between an input variable and a column name. For example, in the following SELECT statement, SALARY is a column name:

```
SELECT EMPNO, WORKDEPT FROM DSN8D10.EMP WHERE (BONUS + COMM) < SALARY;
```

But because Db2 Developer Extension has no way to determine that SALARY is a column name, it interprets it as an input variable and prompts you to assign a value before running the statement. 

To get around this limitation, follow these best practices:

- Explicitly qualify table columns:

```
SELECT EMPNO, WORKDEPT FROM DSN8D10.EMP WHERE (BONUS + COMM) < DSN8D10.EMP.SALARY;
```

- Use a variable name that doesn't match a column name:

 ```
 DECLARE VSALARY DECIMAL(9,2);
 ```

For more information, see [References to SQL parameters and variables](https://www.ibm.com/docs/en/db2-for-zos/13?topic=pl-references-sql-parameters-variables).

