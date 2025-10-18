---
title: "Working with DDL in a Db2 CI/CD Expert environment"
---

# {{ page.title }}

Db2 Developer Extension integrates with IBM Db2 CI/CD Expert for z/OS to enable you to make changes to existing DDL, validate those changes by using the existing site rules, and run a change impact report to analyze and verify the changes before submitting a pull request from your UMS environment.

## Before you begin

You must have a valid connection to an existing Db2 CI/CD Expert for z/OS server.

## Associating an application and making changes to DDL

To make changes to an existing DDL file, associate the DDL file with an application in a Db2 CI/CD Expert server:

1. Select a **.ddl** file.

2.  In the VS Code **Status Bar**, click **No Db2 CI/CD Expert server**.

    ![VS code status bar indicating no server connection]({{site.baseurl}}/assets/images/cicde-no-server-connection.png)

3. Select the server that contains the application that needs to be associated with the DDL file.

    Application discovery starts. If the DDL file is found in any of the applications in the server, the DDL file is associated with that server and the **No Db2 CI/CD Expert server** indicator updates to **ServerName > Application > ApplicationName**.

    ![VS code status bar indicating server connection with application]({{site.baseurl}}/assets/images/cicde-with-server-connection.png)

4. Edit the DDL file with any changes that you need to make for the application.

5. Save your changes.

If any site rule violations are reported when you save your changes, you should fix them before continuing. However, if these site rule violations occurred while you were editing the DDL they can be ignored. For more information, see [Managing site rules](https://www.ibm.com/docs/en/dcefz/1.1.0?topic=features-managing-site-rules).

## Running a change impact report

After you've made changes to the DDL file, you can run an impact report to see how the changes will affect the objects that the application depends on.

To run a change impact report, select the **.ddl** file that you modified, then right-click and select **Run CI/CD Expert Impact Report** or click the **CI/CD Expert Impact Report** icon.

   ![Impact report icon]({{site.baseurl}}/assets/images/impact-report-icon.png)

This action submits a job to the Db2 CI/CD Expert server with the modified DDL and the associated application ID. Note that it can take a while for the job to run. By default, Db2 Developer Extension will attempt to fetch the impact report every 2 seconds for a maximum of 100 attempts. To change these default settings:

1. Click the **Manage** icon at the lower left corner of the VS Code window.

2. Click **Settings** > **Extensions** > **IBM Db2 for z/OS Developer Extension**, and locate the **Fetch Interval** and **Max Number of Fetch Attempts** fields:


  ![Fetch configuration settings]({{site.baseurl}}/assets/images/fetch-config-settings.png)

  - Use the **Fetch Interval** option to specify a number in seconds to indicate how often a call is sent to the Db2 CI/CD Expert server to fetch the impact report until the job is complete. Depending on the size of your application you can increase the number to your preferred value. Increasing the interval between fetch attempts is helpful for larger applications where you might not want to make fetch requests as often.

  - Use the **Max Number of Fetch Attempts** option to specify a number to indicate the maximum number of attempts to fetch the impact report. When the maximum number of attempts is reached, no more attempts will be made to fetch the impact report.


After the job is completed, the **Changes impact report** view is displayed. The changes made to the DDL are displayed in these tabs:

   - The **Critical changes** tab shows changes that altered the existing structure of an object in the application such as dropping and re-creating an existing table.

   - The **All changes** tab shows all of the changes made to any of the objects in the DDL.

   - The **Full report** tab shows all of the objects in the DDL including objects with critical changes, non-critical changes, and objects with no changes.

   ![Changes impact report view]({{site.baseurl}}/assets/images/changes-impact-report.png)

After you've finished making changes to the DDL and verified the changes in the impact report, you can submit a pull request from UMS.
