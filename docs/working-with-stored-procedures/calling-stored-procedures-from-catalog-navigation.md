---
title: "Calling a stored procedure from catalog navigation"
---

# {{ page.title }}

You can call a native SQL stored procedure or an external SQL stored procedure directly from the Db2 Developer Extension catalog navigation view. Only these two types of stored procedures are supported at this time.

To call a native or external SQL stored procedure, first select the **Stored procedure** object type from the catalog navigation tree, then click **Run** from the overflow menu for the stored procedure that you want to call:  

![Calling a stored procedure from catalog navigation]({{site.baseurl}}/assets/images/call-stored-procedure-run.png)

- If the stored procedure that you're calling does not include input variables, the stored procedure runs and the results are displayed:

  ![Results of calling a stored procedure from catalog navigation]({{site.baseurl}}/assets/images/call-stored-procedure-results.png)

- If the stored procedure that you're calling does include input variables, you are prompted to specify values for the variables:

  ![Specifying variables for a stored procedure]({{site.baseurl}}/assets/images/call-stored-procedure-variables.png)

  After you specify the values and click **Run**, the results are displayed.
