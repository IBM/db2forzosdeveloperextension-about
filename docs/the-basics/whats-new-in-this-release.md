---
title: "What's new in this release"
---

# {{ page.title }}

## 2.1.6 (June 2024)

Db2 for z/OS Developer Extension 2.1.6 provides the following significant enhancements:

### Support for debugging external stored procedures

You can now debug external SQL stored procedures. For more information, see [Debugging native and external SQL stored procedures]({{site.baseurl}}/docs/working-with-stored-procedures/debugging-native-external-stored-procedures.html).

### Support for tuning SQL statements without using a tuning profile

You can now run SQL tuning features without using a tuning profile. For more information, see [Setting up an SQL Tuning Environment]({{site.baseurl}}/docs/tuning-sql-queries/setting-up-a-tuning-environment.html).

### Support for importing existing database connections from IBM Data Studio

You can now import database connections from IBM Data Studio. For more information, see [Importing database connections from IBM Data Studio]({{site.baseurl}}/docs/the-basics/importing-connections-from-data-studio.html).

### Complete support for filtering multiple columns

You can now apply complex filtering criteria to all of the Db2 for z/OS catalog objects. For more information, see [Filtering by multiple columns]({{site.baseurl}}/docs/the-basics/filtering-by-multiple-columns.html).


## 2.1.5 (March 2024)

Db2 for z/OS Developer Extension 2.1.5 provides the following significant enhancements:

### Initial support for external stored procedures

You can now deploy and run external SQL stored procedures and external Java stored procedures. See the following articles to get started:

- [Creating external SQL stored procedures]({{site.baseurl}}/docs/working-with-stored-procedures/creating-external-sql-stored-procedures.html)
- [Creating external Java stored procedures]({{site.baseurl}}/docs/working-with-stored-procedures/creating-external-java-stored-procedures.html)

### Support for using a notebook interface

You can now edit and run SQL in a notebook interface. For more information, see [Working with SQL in a notebook editor]({{site.baseurl}}/docs/working-with-sql/working-with-sql-in-notebook-editor.html).

### Support for multi-column filtering of database objects

You can now apply complex filtering criteria to a subset of Db2 for z/OS catalog objects, including:

- Databases
- Indexes
- Storage groups
- Stored procedures
- Tables

For more information, see [Filtering by multiple columns]({{site.baseurl}}/docs/the-basics/filtering-by-multiple-columns.html).

### Support for VS Code light mode theme

You can now customize the appearance of the Db2 Developer Extension interface by selecting from the available color themes. For more information, see [Changing the color theme]({{site.baseurl}}/docs/tips-and-tricks/changing-the-color-theme.html).

### Support for 32-bit JRE

Starting with Db2 Developer Extension 2.1.5, a 64-bit JRE is no longer required. Note that although the requirement has been removed, using Db2 Developer Extension with a 32-bit JRE has not been tested extensively, so results might be unpredictable.


## 2.1.4 (December 2023)

Db2 for z/OS Developer Extension 2.1.4 provides the following significant enhancements:

### An expanded set of SQL analysis and tuning features

By leveraging the functionality provided by Db2 Query Workload Tuner for z/OS 6.1, you can now run the following SQL analysis and tuning tools from within Db2 Developer Extension:

- [Access Path Advisor]({{site.baseurl}}/docs/tuning-sql-queries/generating-access-path-recommendations.html)
- [Access Path Comparison]({{site.baseurl}}/docs/tuning-sql-queries/comparing-access-paths.html)
- [Index Advisor]({{site.baseurl}}/docs/tuning-sql-queries/generating-index-recommendations.html)
- [Query Rewrite Advisor]({{site.baseurl}}/docs/tuning-sql-queries/generating-query-recommendations.html)
- [SQL Annotator]({{site.baseurl}}/docs/tuning-sql-queries/gathering-statistics-about-transformed-query.html)

See [Software requirements for using the SQL tuning features]({{site.baseurl}}/docs/tuning-sql-queries/sql-tuning-requirements.html) for information about the prerequisites for using SQL tuning features.

### Support for exploring objects in Db2 for z/OS databases

You can now locate and explore the following Db2 for z/OS database objects from within Db2 Developer Extension:

- Databases
- Global variables<sup>3</sup>
- Indexes<sup>1</sup>
- Packages<sup>1</sup>
- Plans<sup>1</sup>
- REST services<sup>3</sup>
- Schemas
- Sequences<sup>2</sup>
- Storage groups
- Stored procedures<sup>1</sup>
- Tables
- Table spaces<sup>2</sup>
- Triggers<sup>2</sup>
- User-defined functions<sup>2</sup>
- User-defined types<sup>2</sup>
- Views<sup>1</sup>

**Note:** The privileges that are required to navigate the catalog increased since the initial 2.1 release. See [Navigating the Db2 catalog]({{site.baseurl}}/docs/the-basics/navigating-the-db2-catalog.html) for the updated list of catalog tables that you need read access to.

You can now view and hide implicit objects by using the view icon (![View icon]({{site.baseurl}}/assets/images/catalog-navigation-view.png)).<sup>2</sup>

<sup>1</sup> Delivered in Db2 for z/OS Developer Extension 2.1.1.<br>
<sup>2</sup> Delivered in Db2 for z/OS Developer Extension 2.1.2.<br>
<sup>3</sup> Delivered in Db2 for z/OS Developer Extension 2.1.3.

### Support for VS Code Remote Development

You can now take advantage of VS Code Remote Development support to create a remote Db2 Developer Extension development environment. See [Support for VS Code Remote Development]({{site.baseurl}}/docs/tips-and-tricks/support-for-remote-development.html) for more information.


