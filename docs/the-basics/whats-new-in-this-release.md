---
title: "What's new in this release"
---

# {{ page.title }}

Db2 for z/OS Developer Extension 2.1 provides the following significant enhancements:

## An expanded set of SQL analysis and tuning features

By leveraging the functionality provided by Db2 Query Workload Tuner for z/OS 6.1, you can now run the following SQL analysis and tuning tools from within Db2 Developer Extension:

- [Access Path Advisor]({{site.baseurl}}/docs/tuning-sql-queries/generating-access-path-recommendations.html)
- [Access Path Comparison]({{site.baseurl}}/docs/tuning-sql-queries/comparing-access-paths.html)
- [Index Advisor]({{site.baseurl}}/docs/tuning-sql-queries/generating-index-recommendations.html)
- [Query Rewrite Advisor]({{site.baseurl}}/docs/tuning-sql-queries/generating-query-recommendations.html)
- [SQL Annotator]({{site.baseurl}}/docs/tuning-sql-queries/gathering-statistics-about-transformed-query.html)

See [Software requirements for using the SQL tuning features]({{site.baseurl}}/docs/tuning-sql-queries/sql-tuning-requirements.html) for information about the prerequisites for using SQL tuning features.

## Support for exploring objects in Db2 for z/OS databases

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

## Support for VS Code Remote Development

You can now take advantage of VS Code Remote Development support to create a remote Db2 Developer Extension development environment. See [Support for VS Code Remote Development]({{site.baseurl}}/docs/tips-and-tricks/support-for-remote-development.html) for more information.

