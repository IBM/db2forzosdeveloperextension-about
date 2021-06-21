---
layout: single
# classes: wide
title:  "Running SQL with multiple selection scopes"
toc: false
toc_sticky: false
---

When you're working in a file that contains a lot of SQL elements, especially in a non-SQL file (for example, Python, Java, etc.), you might want to select and run multiple individual SQL elements instead of having to run the entire statement.  Those elements might be on consecutive lines or they might be scattered throughout the file on different lines.

You can select and run individual elements by holding the Alt key and selecting the elements that you want to run. Then, right-click and select **Run Selected SQL**.

   ![Running multiple selections]({{site.baseurl}}/assets/images/runsql-multiple-selection.gif)

You can also use [column selection mode](https://code.visualstudio.com/docs/editor/codebasics#_column-box-selection) to select and run individual elements.

   ![Running multiple selections with column mode]({{site.baseurl}}/assets/images/runsql-column-selection.gif)
