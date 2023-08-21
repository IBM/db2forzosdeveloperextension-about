---
title: "Software requirements for using the SQL tuning features"
---

# {{ page.title }}

The SQL tuning features of Db2 Developer Extension require additional software. The software that you need depends on the SQL tuning features that you want to use.

- To use only the base set of SQL tuning features, you need the [Database Services Expansion Pack](https://publibfp.dhe.ibm.com/epubs/pdf/i1359292.pdf) component of Db2 Accessories Suite 4.2, which is a no-charge add-on for Db2 for z/OS, and SQL Tuning Services [APAR PH42944](https://www.ibm.com/support/pages/apar/PH42944). The base set of SQL tuning features include:

  - Statistics Advisor
  - Visual Explain
  - Capture Query Environment

- To use all available SQL tuning features, you need [Db2 Query Workload Tuner for z/OS 6.1](https://www.ibm.com/docs/en/dqwtfz/6.1). These features include:

  - Access Path Advisor
  - Access Path Comparison
  - Index Advisor
  - Query Rewrite Advisor
  - SQL Annotator
  - Statistics Advisor
  - Visual Explain
  - Capture Query Environment

For instructions for enabling the SQL tuning features of Db2 Developer Extension, see [Installing and configuring SQL Tuning Services](https://www.ibm.com/docs/en/db2-for-zos/13?topic=services-installing-configuring-sql-tuning).
