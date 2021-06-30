---
title: "Running SQL from within a stored procedure"
---

# {{ page.title }}

You can run SQL within a native stored procedure (NSP) body that contains SQL parameters and SQL variables. You'll be prompted to specify values for them before the SQL executes. Note that built-in data types for each input variable are detected automatically and are set to the correct data type.

Note that this feature applies to **.spsql** files only.

![Run SQL within a stored procedure]({{site.baseurl}}/assets/images/runsql-in-nsps.gif)
