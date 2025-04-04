---
title: "Truncated timestamp values in query results and table data"
---

# {{ page.title }}

When query results or table data in the catalog navigation view include a timestamp column, and a timestamp ends in one or more zeros (0), the zeros are not included in the output. 

To correct this issue, add the `timestampPrecisionReporting =2` JDBC property to your database connection:
 
![timestampPrecisionReporting JDBC property]({{site.baseurl}}/assets/images/timestampPrecisionReporting.png)

For more information about this property, see [Common IBM Data Server Driver for JDBC and SQLJ properties for all supported database products](https://www.ibm.com/docs/en/db2-for-zos/13?topic=pdsdjs-common-data-server-driver-jdbc-sqlj-properties-all-database-products).
