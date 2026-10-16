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

## Passing values between cells 

You can reference values returned by one cell in subsequent cells in the same notebook. This capability is especially useful when a query returns multiple values that you want to use in another SQL statement.

To reference a returned value in a subsequent cell, prefix the column name or alias with a colon (`:`). Column name and alias matching is case-insensitive, so `:table_name` and `:TABLE_NAME` reference the same value.

You can assign an alias when you need a more specific name or when multiple cells return the same column name. You must assign an alias to an expression, such as `COUNT(*)` or `MAX(COL)`, because an expression does not have a natural column name.

**Important:** Run the producing cell before running a cell that references its column name or alias. If the producing cell has not been run, the `:alias` reference is passed as-is to Db2, which returns an error.

For example, the following query returns multiple table names and assigns the alias `table_name` to the `NAME` column:

```
SELECT NAME AS table_name
FROM SYSIBM.SYSTABLES
FETCH FIRST 10 ROWS ONLY;
```

Because the producing cell returns multiple rows, use `IN (:alias)` to reference all of the returned values in a subsequent cell:

```
SELECT NAME, TBNAME
FROM SYSIBM.SYSCOLUMNS
WHERE TBNAME IN (:table_name);
```

When the producing cell returns a single row and a single column, use `= :alias` instead of `IN (:alias)`. Using `= :alias` when the producing cell returns multiple rows results in an error.

If multiple cells produce the same column name or alias, the values from the most recently executed cell are used. Re-running any producing cell makes its values current for subsequent references.
