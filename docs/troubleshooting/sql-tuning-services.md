---
title: "Troubleshooting problems with SQL tuning features"
---

# {{ page.title }}

If you run into problems with any of the SQL tuning features of Db2 Developer Extension that aren't addressed in this article, use the information in the following topic to gather diagnostic information: 

[Troubleshooting problems with SQL Tuning Services](https://www.ibm.com/docs/en/db2-for-zos/13?topic=services-troubleshooting)

## Problems with creating or editing a tuning profile

If you receive the message `The JSON syntax is invalid. The data_server_type field is required` when you attempt to create or edit a tuning profile, it's likely that the most current APAR has not been applied. See the SQL Tuning Services section in [Prerequisites for installing Db2 Developer Extension](https://marketplace.visualstudio.com/items?itemName=ibm.db2forzosdeveloperextension#prerequisites-for-installing-db2-developer-extension) for the current APAR number. Apply this APAR and try to create or edit the tuning profile again.

## Problems with selecting a tuning profile

- If you click **Select a tuning profile** after attempting to run a tuning action when no tuning profile is associated with your database connection, the **Edit connection** page is displayed, but the list of tuning profilesis empty. Click the **Tuning** tab to populate the list of tuning profiles.

  ![Tuning tab]({{site.baseurl}}/assets/images/troubleshooting-tuning-tab.png)

- A similar situation occurs when you create a new profile by clicking **Create profile** on the **Edit connection** page. After you save your changes, the **Create a tuning connection profile** page closes but your profile is not included in the list of tuning profiles. As with the previous situation, click the **Tuning** tab to display your new tuning profile.

## Problems with opening subsequent Tuning Summary pages

If you display summary results from the TUNING HISTORY, and the first set of results that you select were generated without using a tuning profile, when you select additional summary results, the results will be added to the current view. To prevent this unexpected behavior, close the opened tuning summary result view first before opening other summary results.
