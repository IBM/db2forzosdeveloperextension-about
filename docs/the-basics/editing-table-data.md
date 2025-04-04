---
title: "Editing table data"
---

# {{ page.title }}


Db2 Developer Extension makes it easy to update the data in a Db2 for z/OS table and to commit your changes directly to the database.


## Procedure

To edit data in a Db2 table:

1. Select a table.

2. On the **Data** tab, select **Edit actions > Enable edit mode**.

3. Update a value by typing in a new value. You can also set the value to null by selecting **Options > Null**.

4. Revert the change that you made in the previous step by selecting **Options > Revert**.

5. Select **Options > Edit new window** to open a new window and make a change. Click **Finish**.

6. Add a new row by selecting **Edit actions > Add a row**.

7. You can also delete a row by selecting it and clicking **Delete**. You can delete multiple rows.

8. To undo a deleted row, click **Edit actions > Refresh**.
    
    **Important:** **Refresh** reverts all changes made to the table that were not saved.

9. Commit your changes to the database by selecting **Edit actions > Save**.

After you commit your changes to the database, the **Execution summary** page is displayed.

![Editing table data]({{site.baseurl}}/assets/images/editing-table-data.gif)

## Considerations

- When you edit BINARY and VARBINARY data types, examples of how the input can be formatted are `BX'10'`, `BINARY(X'10')`, `BINARY(BX'10')`, or `VARBINARY(X'10')`.
- You cannot edit the value for the following data types:
    - BLOB
    - DBCLOB
    - GRAPHIC
    - VARGRAPHIC
    - ROWID

