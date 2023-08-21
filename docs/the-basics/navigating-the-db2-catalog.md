---
title: "Navigating the Db2 catalog"
---

# {{ page.title }}

As you're writing code to interact with Db2 for z/OS data, you often need to explore the various objects that are associated with the databases that contain that data. Db2 Developer Extension makes it easy to explore the Db2 catalog through its catalog navigation support. 

## Enabling catalog navigation

Using the catalog navigation feature requires read access to several Db2 system catalog tables. If you're already working with another tool that provides you with access to the Db2 catalog, it's likely that these privileges have already been granted. If not, the following statements can be used to grant these privileges:

```
GRANT SELECT ON SYSIBM.SYSCHECKDEP TO {user ID};
GRANT SELECT ON SYSIBM.SYSCOLUMNS TO {user ID};
GRANT SELECT ON SYSIBM.SYSCONTROLS TO {user ID};
GRANT SELECT ON SYSIBM.SYSDATABASE TO {user ID};
GRANT SELECT ON SYSIBM.SYSDATATYPES TO {user ID};
GRANT SELECT ON SYSIBM.SYSFOREIGNKEYS TO {user ID};
GRANT SELECT ON SYSIBM.SYSINDEXES TO {user ID};
GRANT SELECT ON SYSIBM.SYSJAROBJECTS TO {user ID};
GRANT SELECT ON SYSIBM.SYSKEYCOLUSE TO {user ID};
GRANT SELECT ON SYSIBM.SYSKEYS TO {user ID};
GRANT SELECT ON SYSIBM.SYSPACKAGE TO {user ID};
GRANT SELECT ON SYSIBM.SYSPACKDEP TO {user ID};
GRANT SELECT ON SYSIBM.SYSPACKLIST TO {user ID};
GRANT SELECT ON SYSIBM.SYSPACKSTMT TO {user ID};
GRANT SELECT ON SYSIBM.SYSPARMS TO {user ID};
GRANT SELECT ON SYSIBM.SYSPLAN TO {user ID};
GRANT SELECT ON SYSIBM.SYSROUTINES TO {user ID};
GRANT SELECT ON SYSIBM.SYSSEQUENCES TO {user ID};
GRANT SELECT ON SYSIBM.SYSSTOGROUP TO {user ID};
GRANT SELECT ON SYSIBM.SYSTABCONST TO {user ID};
GRANT SELECT ON SYSIBM.SYSTABLES TO {user ID};
GRANT SELECT ON SYSIBM.SYSTABLESPACE TO {user ID};
GRANT SELECT ON SYSIBM.SYSTRIGGERS TO {user ID};
GRANT SELECT ON SYSIBM.SYSVARIABLES TO {user ID};
GRANT SELECT ON SYSIBM.SYSVIEWDEP TO {user ID};
GRANT SELECT ON SYSIBM.SYSVIEWS TO {user ID};
GRANT SELECT ON SYSIBM.SYSVOLUMES TO {user ID};
```

where {user ID} is the authorization ID or role that you want to grant read access to.

## Exploring Db2 objects

After catalog navigation has been enabled by granting read access to Db2 system catalog tables, when you create a database connection, the following object types that are associated with that connection are listed under the connection name:
- Databases
- Indexes
- Packages
- Plans
- Schemas
- Storage groups
- Stored procedures
- Tables
- Views

You can expand an object to see detailed information about that object (columns, constraints, indexes, and so on).

When browsing a list of objects, you can use the the toolbar to change the rows returned and get numerical information about the objects.

![Catalog navigation toolbar]({{site.baseurl}}/assets/images/catalog-navigation-toolbar.png)

- Click the search icon (![Search the catalog]({{site.baseurl}}/assets/images/catalog-navigation-search.svg)) to search within the displayed rows.

- Click the filter icon (![Filter the catalog]({{site.baseurl}}/assets/images/catalog-navigation-filter.png)) to filter the rows by object name. Specify a valid pattern expression based on the [LIKE predicate](https://www.ibm.com/docs/en/db2-for-zos/13?topic=predicates-like-predicate).

- **Display _n_ rows** shows the number of rows fetched.

- Click **Max rows: _n_** to change the maximum number of rows that can be fetched.

- Click **Total rows: _n_** to get the total number of objects for the object type in the Db2 catalog.

For an individual storage group, database, and schema, you can view objects within the object in the **Objects** tab.

![Objects tab]({{site.baseurl}}/assets/images/catalog-navigation-objects.png)

For an individual table, you can view a table's columns, contraints, indexes, and data.

![Table objects]({{site.baseurl}}/assets/images/catalog-navigation-table.png)

## Catalog object reference

The following list shows which characteristics are provided for each object type:

- Databases
    - Properties
    - Objects
- Indexes
    - Properties
    - Columns
- Packages
    - Properties
    - Statements
    - Dependencies
- Plans
    - Properties
    - Packages
- Schemas
    - Properties
    - Objects
- Storage groups
    - Properties
    - Objects
- Stored procedures
    - Properties (differs depending on the type of procedure)
    - Options (differs depending on the type of procedure)
    - Parameters
    - DDL
    - Packages
- Tables
    - Properties
    - Columns
    - Constraints
    - Indexes
    - Data
- Views
    - Properties
    - Columns
    - DDL
    - Data
    - Dependencies
