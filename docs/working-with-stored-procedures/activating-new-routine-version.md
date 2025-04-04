---
title: "Activating a new version of a routine"
---

# {{ page.title }}

You can change which version of a stored procedure or user-defined function (UDF) is active directly from the catalog navigation view. 

Only stored procedures with an origin type of **Native** and compiled scalar UDFs with an origin type of **SQL** are supported.

**Requirement:** To activate a new version, you must be the owner of the routine or have one of the privileges that are documented [here](https://www.ibm.com/docs/en/db2-for-zos/13?topic=statements-alter-procedure-statement-sql-native#db2z_sql_alterproceduresqlnative__title__3).

To activate a new version of stored procedure or UDF, display the object type in the catalog navigation view and select **Activate Version** from the overflow menu for the object that you want to activate. This option is available only for inactive objects that have more than one version. 

The following figure shows the stored procedure object type, but the process is identical for UDFs.

![Activating a new version of a routine]({{site.baseurl}}/assets/images/activate-new-routine-version.png)

When you click **Activate Version**, the status of the operation is displayed in the lower right corner of the view. When the new version is activated, the **QUERY HISTORY** is updated with the results.


