---
title: "Db2 SQL Service errors"
---

# {{ page.title }}

This article documents some of the common problems associated with Db2 SQL Service.

## Error when Db2 SQL Service cannot be started

When you restart VS Code after installing Db2 Developer Extension, the following error might be issued, even if you are not in the process of connecting to a Db2 for z/OS subsystem:

![Commit after each statement Processing continues results]({{site.baseurl}}/assets/images/troubleshoot-dss-errors.png)

In addition to being required to connect to Db2, Db2 SQL Service (DSS) is also required to use many other features of Db2 Developer Extension. Therefore, if DSS is not enabled, you might experience unexpected behavior when you use Db2 Developer Extension. However, the following features do not rely on DSS and can be used without restrictions when DSS is not started:

- Syntax highlighting
- Code snippets
- Code completion and signature help
- SQL formatting

## Error related to 32-bit JRE support

If you're using Db2 Developer Extension 2.1.4 or earlier, a 64-bit JRE is required. The following error is issued if you attempt to use a 32-bit JRE:

![64-bit-JRE-required]({{site.baseurl}}/assets/images/troubleshoot-32-bit-error.png)

Starting with Db2 Developer Extension 2.1.5, a 64-bit JRE is no longer required. Although the requirement has been removed, using Db2 Developer Extension with a 32-bit JRE has not been tested extensively, so results might be unpredictable.
