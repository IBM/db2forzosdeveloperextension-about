---
title: "Working with SQL in a notebook editor"
---

# {{ page.title }}

As an alternative to the standard SQL editor interface, Db2 Developer Extension supports the use of a notebook style SQL editor, which provides more flexibility than the standard SQL editor.

For example, with a notebook editor you can:

- Create, edit, and run multiple SQL statements either one at a time or collectively from a single window.
- View the results of running multiple SQL statements within a single window.
- Easily insert markdown comments into  your code for easier readability.  

To use the notebook editor:

1. Create a new file that has an extension of **.isql**. The notebook editor is invoked automatically for **.isql** files.

2. Click **+ Code** to open a new cell, and type a SQL statement into that cell, for example:

   ```
   SELECT * FROM SYSIBM.SYSTABLES;
   ```
   Notice that the statement is labeled as `Plain Text` in the lower right side of the cell. 

3. To get the editor to recognize your input as SQL, connect to Db2 either by clicking the connection mechanism in the bottom-left corner of the window or by clicking **Select Kernel** in the upper-right corner of the editor and selecting a connection. As soon as you connect to Db2, your statement is recognized as SQL and syntax highlighting is applied.

4. Run your statement by clicking the **Run** button at the left side of the cell. The results are displayed directly below the cell.

   ![Using the notebook editor]({{site.baseurl}}/assets/images/sql-notebook.gif)

5. Now let's run another SQL statement. You have a couple of options:

   - You can type the new SQL statement into the same cell as your first SQL statement and click **Run**.  This approach displays the results in the same cell; however, both statements are run; not just the new statement.
   - You can type the new SQL statement into a new cell and work with it independently.

6. Explore some of the other features of the notebook editor on your own:

   - Create a new markdown cell instead of a code cell by clicking **+ Markdown**. Your text will be saved as markdown in the file.
   - Rearrange the order of the cells by clicking and dragging them.


   
