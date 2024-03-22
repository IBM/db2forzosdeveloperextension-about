---
title: "Working with double-byte character set (DBCS) data"
---

# {{ page.title }}

Languages such as Chinese and Japanese contain double-byte characters, which are characters that are too large to represent with a single byte.  If you write SQL applications that support double-byte character languages, you need to know a bit about how Db2 for z/OS supports DBCS data and how character translation is handled.  This section describes how to code DBCS data in a Db2 for z/OS native stored procedure.

Db2 for z/OS provides DBCS support for the following data types:

- **GRAPHIC:** A fixed-length data type that's used to store a graphic string.

- **VARGRAPHIC:** A varying-length data type used to store a variable-length graphic string.

- **CHAR or CLOB defined with “FOR MIXED DATA”:** Data types that are used to store character data or mixed data (that is, a combination of single-byte character set (SBCS) characters and multi-byte character set (MBCS) characters)."

- **DBCLOB:** A double-byte character large object.

**Tip:** Db2 translates all Db2 character data between the internal Db2 table Code Character Set Identifier (CCSID) and the external application CCSID.

The following example shows a user-defined type stored procedure that includes a double-byte DBCLOB variable. When you create a stored procedure that includes DBCLOB parameters, you need to specify `PARAMETER CCSID UNICODE`, and if the stored procedure includes DBCLOBs in the body, you need to specify `APPLICATION ENCODING SCHEMA UNICODE`.

```
CREATE PROCEDURE ADMF001.TEST_DBCLOB (
  IN VAR1 DBCLOB,
  INOUT VAR2 DBCLOB,
  OUT VAR3 DBCLOB
  )
  APPLICATION ENCODING SCHEME UNICODE
  PARAMETER CCSID UNICODE
  VERSION V1
  ISOLATION LEVEL CS
  LANGUAGE SQL
  BEGIN
    SET VAR2 = '你好';
    SET VAR3 = VAR1;
  END
```

Setting this input returns the following output:

```
VAR1  IN: HELLOWORLD
VAR2 OUT: 你好
VAR3 OUT: HELLOWORLD
```

