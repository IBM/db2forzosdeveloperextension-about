---
title: "Usage problems related to changes in keytar support"
---

# {{ page.title }}

If you recently upgraded to VS Code 1.83.0 or later and you're now unable to use Db2 Developer Extension, the problem is likely the result of changes to keytar wrapper support, which was discontinued in VS Code 1.8.3.0.

Db2 Developer Extension 2.1.2 and earlier no longer works with VS Code 1.83.0 or later. If you're using VS Code 1.83.0 or later, you need to install Db2 Developer Extension 2.1.3 or later.

Also, if you used the following combination of Db2 Developer Extension and VS Code versions:

```
Db2 Developer Extension 0.5.0 to 1.4.0
VS Code 1.82.3 or earlier
```

And then upgraded to the following versions:

```
Db2 Developer Extension 2.1.3 or later
VS Code 1.83.0 or later
```

You'll lose credential information for Db2 for z/OS connections and SQL Tuning Services servers. After the upgrade, you'll need to edit each Db2 for z/OS connection and SQL Tuning Services server and input the credentials again.

To avoid re-inputting credentials, perform the upgrade steps in the following sequence:

1. Upgrade to Db2 Developer Extension 2.1.0, 2.1.1, or 2.1.2.
2. Edit and save each Db2 connection.
3. Upgrade to VS Code 1.83.0 or later.
