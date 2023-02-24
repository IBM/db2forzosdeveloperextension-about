---
title: "Sharing and revoking privileges to tuning connection profiles"
---

# {{ page.title }}

The same tuning connection profile can be used by multiple users by explicitly sharing the privileges for that profile with them. When access to that tuning connection profile is no longer needed by a particular user or set of users, privileges can easily be revoked.

1. To share a tuning connection profile, from the **SQL TUNING SERVICES SERVERS** view, right-click an SQL Tuning Services server and click **Show Tuning Connection Profiles** to display a list of available profiles.

2. Locate the profile that you want to share, click the three vertical dots at the end of that profile, and select **Share privileges**. 

3. Specify the user or users that you want to share the tuning connection profile with. Separate multiple user IDs with a comma. Press **Enter**.
    
    ![Sharing privileges for a tuning connection profile]({{site.baseurl}}/assets/images/tuning-share-revoke-privileges.gif)

Follow the same process to revoke privileges for a tuning connection profile, but select **Revoke privileges** instead.
