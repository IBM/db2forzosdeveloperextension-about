---
title: "Troubleshooting problems with SQL tuning features"
---

# {{ page.title }}

If you run into problems with any of the SQL tuning features of Db2 Developer Extension that aren't addressed in this article, use the information in the following topic to gather diagnostic information: 

[Troubleshooting problems with SQL Tuning Services](https://www.ibm.com/docs/en/db2-for-zos/12?topic=services-troubleshooting)

## Problems with creating or editing a tuning connection profile

If you receive the message `The JSON syntax is invalid. The data_server_type field is required` when you attempt to create or edit a tuning connection profile, it's likely that the most current APAR has not been applied. See the SQL Tuning Services section in [Prerequisites for installing Db2 Developer Extension](https://marketplace.visualstudio.com/items?itemName=ibm.db2forzosdeveloperextension#prerequisites-for-installing-db2-developer-extension) for the current APAR number. Apply this APAR and try to create or edit the tuning connection profile again.
