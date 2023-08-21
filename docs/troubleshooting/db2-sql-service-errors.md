---
title: "Db2 SQL Service errors"
---

# {{ page.title }}

When you restart VS Code after installing Db2 Developer Extension, the following error might be issued, even if you are not in the process of connecting to a Db2 for z/OS subsystem:

![Commit after each statement Processing continues results]({{site.baseurl}}/assets/images/troubleshoot-dss-errors.png)

In addition to being required to connect to Db2, Db2 SQL Service (DSS) is also required to use many other features of Db2 Developer Extension. Therefore, if DSS is not enabled, you might experience unexpected behavior when you use Db2 Developer Extension. However, the following features do not rely on DSS and can be used without restrictions when DSS is not started:

- Syntax highlighting
- Code snippets
- Code completion and signature help
- SQL formatting
