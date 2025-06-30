---
title: "Setting host variables for stored procedures and user-defined functions"
---

# {{ page.title }}

You can load, save, and reset host variables for stored procedures and user-defined functions (UDFs) from the catalog navigation view or directly from the file.

This feature is available only for SQL files that end with **.spsql** or **.udfsql**.

To set host variables:

1. From the **Stored procedures** object type from the catalog navigation tree, click **Run** from the overflow menu for the stored procedure you want to update host variables for. Alternatively, you can also go directly to a **.spsql** file, right-click, and select **Run**. This process also applies to UDFs.

2. The host variables panel displays with three options: **Load values**, **Save values**, and **Reset values**. Click **Load values** and select the XML file that contains host variables.

3. Click **Open** to load the data from the XML file into the host variables.

4. Click **Run**. You can view the results of the stored procedure or UDF in the **QUERY HISTORY** view.

5. To update a host variable, select a value and type in a new value.

6. Click **Save values** and select the location where you want to save the XML file containing the host variables.

7. To reset all of the values for the stored procedure or UDF, click **Reset values**.

    **Important:** Resetting values resets all parameters to an empty value.

![Setting host variables]({{site.baseurl}}/assets/images/setting-host-variables.gif)
