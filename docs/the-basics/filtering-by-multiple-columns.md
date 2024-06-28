---
title: "Filtering by multiple columns"
---

# {{ page.title }}

When you're navigating the catalog, you can apply a complex set of filtering criteria to display the objects that you want to work with.

For example, when you're looking at the databases in the catalog, click the **Filter by fields** icon (![Filter icon]({{site.baseurl}}/assets/images/catalog-navigation-filter.png)) in the toolbar at the top of the page to display a menu of the attributes that you can filter on. By default, the **Select column** field is populated with **Name** and the **Select operator** field is populated with **Contains**.

In the following example, we enter **DD** in the **Value** field for the **Name** column (note that the filter feature is case-sensitive). Then we click the **Add filter** icon to display a new set of input fields, and we select **Encoding scheme** of **EBCDIC**. When we click **Apply**, only the databases that contain the characters `DD` and that have an encoding scheme of `EBCDIC` are displayed.

We click the **Filter by fields** icon again to specify an additional criteria: buffer pools that start with `BP0`.

![Filtering by multiple columns]({{site.baseurl}}/assets/images/multi-column-filter.gif)

When all of these criteria are applied, we're presented with only those databases that:

- Contain the characters `DD`
- Have an encoding scheme equal to `EBCDIC`
- Have a buffer pool that starts with `BP0`

The operators and values vary depending on the characteristics of each column.

To remove a filter, click the **Remove filter** icon on the right side of the **Filter settings** dialog, and to remove all filters click **Clear all**.
