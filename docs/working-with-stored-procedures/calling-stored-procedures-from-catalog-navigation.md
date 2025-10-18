---
title: "Calling stored procedures and user-defined functions from catalog navigation"
---

# {{ page.title }}

You can call a stored procedure or user-defined function (UDF) for all supported languages (C, COBOL, Java, SQLJ, SQL) directly from the Db2 Developer Extension catalog navigation view.

To call a stored procedure or user-defined function, first select the **Stored procedure** or **User-defined function** object type from the catalog navigation tree, then click **Run** from the overflow menu for the stored procedure or UDF that you want to call:  

![Calling a stored procedure from catalog navigation]({{site.baseurl}}/assets/images/call-stored-procedure-run.png)

- If the stored procedure or UDF that you're calling does not include input variables, the stored procedure or UDF runs and the results are displayed:

  ![Results of calling a stored procedure from catalog navigation]({{site.baseurl}}/assets/images/call-stored-procedure-results.png)

- If the stored procedure or UDF that you're calling does include input variables, you are prompted to specify values for the variables:

  ![Specifying variables for a stored procedure]({{site.baseurl}}/assets/images/call-stored-procedure-variables.png)

  After you specify the values and click **Run**, the results are displayed.
