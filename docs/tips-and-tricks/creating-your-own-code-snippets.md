---
title: "Creating your own code snippets"
---

# {{ page.title }}

Visual Studio Code has built-in snippets and Db2 Dev Extension has its own snippets. If you want to create your own set of code snippets, read [Create your own snippets](https://code.visualstudio.com/docs/editor/userdefinedsnippets#_create-your-own-snippets) in the Visual Studio Code documentation.

Here's an example of how to create your own `CREATE TABLESPACE` snippet for files associated with the SQL language.

1. Open the **Command Palette** and select **Preferences: Configure User Snippets**.
2. Select **sql (SQL)** from the list.
3. In the snippet file, paste the following content and save it.

```
{
  "CREATE TABLESPACE statement": {
    "prefix": "CREATE TABLESPACE statement",
    "body": [
      "CREATE TABLESPACE ${1:tablespace-name}",
      "\tIN ${2:database-name}",
      "\tUSING STOGROUP ${3:stogroup-name};",
    ],
    "description": "Sample CREATE TABLESPACE statement"
  }
}
```

4. Now start typing `CREATE TABLESPACE` in any SQL file to use the snippet.

![Creating a custom code snippet]({{site.baseurl}}/assets/images/tips-tricks-custom-snippet.gif)
