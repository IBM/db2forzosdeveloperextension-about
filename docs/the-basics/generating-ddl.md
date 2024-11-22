---
title: "Generating DDL for a Db2 object"
---

# {{ page.title }}


Db2 Developer Extension provides the capability to generate DDL for a Db2 object. Data Definition Language (DDL) is a subset of SQL commands that are used to create and modify database objects. You can generate DDL to completely re-create a database or only certain parts of it. For example, by generating DDL for database objects you can:
- Keep a snapshot of the database structure
- Set up a test system where the database acts like the production system but contains no data
- Produce templates for new objects based on existing ones

You can generate DDL for the following Db2 objects:
- Databases
- Indexes
- Tables
- Table spaces
- Views

However, you cannot generate DDL for Db2 catalog objects.


**Requirements:**

To generate DDL for Db2 objects you need the SYSADM authority, or you can use the following statements to grant the required privileges:

```
GRANT MONITOR1 TO {user ID};
GRANT SELECT ON SYSIBM.SYSTABLES TO {user ID};
GRANT SELECT ON SYSIBM.SYSTABLESPACE TO {user ID};
GRANT SELECT ON SYSIBM.SYSDATABASE TO {user ID};
GRANT SELECT ON SYSIBM.SYSSTOGROUP TO {user ID};
GRANT SELECT ON SYSIBM.SYSVOLUMES TO {user ID};
GRANT SELECT ON SYSIBM.SYSTABLEPART TO {user ID};
GRANT SELECT ON SYSIBM.SYSDATATYPES TO {user ID};
GRANT SELECT ON SYSIBM.SYSCOLUMNS TO {user ID};
GRANT SELECT ON SYSIBM.SYSSEQUENCES TO {user ID};
GRANT SELECT ON SYSIBM.SYSSEQUENCESDEP TO {user ID};
GRANT SELECT ON SYSIBM.SYSFIELDS TO {user ID};
GRANT SELECT ON SYSIBM.SYSINDEXES TO {user ID};
GRANT SELECT ON SYSIBM.SYSKEYS TO {user ID};
GRANT SELECT ON SYSIBM.SYSCHECKS TO {user ID};
GRANT SELECT ON SYSIBM.SYSKEYTARGETS TO {user ID};
GRANT SELECT ON SYSIBM.SYSINDEXPART TO {user ID};
GRANT SELECT ON SYSIBM.SYSRELS TO {user ID};
GRANT SELECT ON SYSIBM.SYSFOREIGNKEYS TO {user ID};
GRANT SELECT ON SYSIBM.SYSVIEWDEP TO {user ID};
GRANT SELECT ON SYSIBM.SYSDEPENDENCIES TO {user ID};
GRANT SELECT ON SYSIBM.SYSSYNONYMS TO {user ID};
GRANT SELECT ON SYSIBM.SYSVIEWS TO {user ID};
GRANT SELECT ON SYSIBM.SYSENVIRONMENT TO {user ID};
GRANT SELECT ON SYSIBM.DSN_PROFILE_TABLE TO {user ID};
GRANT SELECT ON SYSIBM.DSN_PROFILE_ATTRIBUTES TO {user ID};
```


This article shows you how to generate DDL for a Db2 table. To generate DDL for a Db2 table:

1. Select a database connection and select the **Tables** object.

2. Select a table and click the overflow menu. Click **Generate DDL**.
<!-- Instead of overflow menu, include picture of the icon in parenthesis -->

3. In the **Options and Objects** tab, select at least one option from the **Options** section, and at least one object from the **Objects** section.

4. Click **Next** to navigate to the **Preview** tab. You can preview the generated DDL.

5. Click **Finish**.

The result is a new window that displays the generated DDL. The generated DDL must be saved as a SQL file with the **.sql** file extension.

Follow the same process for other Db2 objects, but instead of a **Table** object, select another Db2 object.
