---
title: "Running a stored procedure with single quotation marks as the escape character"
---

# {{ page.title }}

When you run a stored procedure from the SQL editor that uses an argument that contains two consecutive single quotation marks `''`, you might get the following error:

![Canceling running SQL statement button]({{site.baseurl}}/assets/images/destructure-error.png)

To work around this issue, use a parameter marker `?` as the argument and in the host variables panel provide the argument in the **Value** field.

![Parameter marker workaround]({{site.baseurl}}/assets/images/parameter-marker-workaround.png)
