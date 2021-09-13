---
title: "Setting multiple port numbers"
---

# {{ page.title }}

To make it easier to open and work in multiple VS Code instances without having to manually change the port settings for each instance, you can specify multiple individual port numbers by separating them with commas, and you can specify a range of port numbers by separating them with a hyphen. For example:

```
4555, 4556, 4559-4985
```

To set the port numbers:

1. Open Db2 Developer Extension and click the **Manage** icon at the lower left corner of VS Code window:

   ![Manage icon]({{site.baseurl}}/assets/images/manage-icon.png)

2. Click **Settings > Extensions > IBM Db2 for z/OS Developer Extension**.

3. Update the **Session Manager Port** and **Port** settings fields with port numbers that are available for you to use:

   ![Specifying multiple ports]({{site.baseurl}}/assets/images/tips-tricks-multiple-ports.png)
