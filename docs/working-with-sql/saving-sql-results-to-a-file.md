---
title: "Saving SQL results to a file"
---

# {{ page.title }}

Any SQL results that generate a result set can be saved to a file. To save the results, open a SQL result, go to the **Result** tab, and click the **Save** icon. Specify a location in your file explorer for the results and click **Save File**.

![Saving SQL results]({{site.baseurl}}/assets/images/runsql-save-results.gif)

## Customizing SQL results options

You can customize certain characteristics of your SQL results, such as column delimiters, quote mark characters, and whether blanks are trimmed, by defining Db2 for z/OS Developer Extension settings. 

To customize these characteristics:

1. Open Db2 Developer Extension and click the **Manage** icon at the lower left corner of VS Code window:

   ![Manage icon]({{site.baseurl}}/assets/images/manage-icon.png)

2. Click **Settings > Extensions > IBM Db2 for z/OS Developer Extension**.

3. Locate and update the **Export Options** settings:

   ![Export options]({{site.baseurl}}/assets/images/runsql-export-settings.png)
