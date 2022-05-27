---
title: "Creating stored procedures"
---

# {{ page.title }}

This article covers the basics of using Db2 Developer Extension to create a simple stored procedure and then explains some of the more complex things you might need to do when you create a stored procedure, such as working with DBCS data and user-defined types.

[Stored procedures](https://www.ibm.com/support/knowledgecenter/en/SSEPEK_13.0.0/apsg/src/tpc/db2z_storedprocedure.html) are a powerful tool for increasing the performance and efficiency of distributed applications. Currently, Db2 Developer Extension supports Db2 for z/OS native stored procedures, which are stored procedures that are written entirely in SQL and are created by using the [CREATE PROCEDURE or CREATE  OR REPLACE PROCEDURE](https://www.ibm.com/support/knowledgecenter/SSEPEK_13.0.0/sqlref/src/tpc/db2z_sql_createproceduresqlnative.html) statement, which is available with Db2 12 function level 507 and later.

## Creating a basic stored procedure with code snippets

1. Open a new **.spsql** file, and start typing `CREATE PROCEDURE`. You'll only need to type a few letters before you see CREATE PROCEDURE in the list of available code snippets.

2. Select that snippet to populate your file with the basic CREATE PROCEDURE structure (in the following example, the procedure name has already been changed to MYPROCEDURE):

![CREATE PROCEDURE code snippet]({{site.baseurl}}/assets/images/nsp-basics-create-nsp.png)

The snippet includes some of the more commonly used parameters and an example SELECT statement. The SELECT statement is the part of the stored procedure that gets executed when the stored procedure is called. To see all of the options that you can define in a stored procedure, open the [link](https://www.ibm.com/support/knowledgecenter/SSEPEK_13.0.0/sqlref/src/tpc/db2z_sql_createproceduresqlnative.html) that is included at the top of the snippet.

Now this stored procedure is ready to be deployed. To learn how, see [Deploying, running, and debugging stored procedures]({{site.baseurl}}/docs/working-with-stored-procedures/deploying-running-and-debugging-stored-procedures-basics.html).

Now let's look at some more complex examples.

## Working with double-byte character set (DBCS) data

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

## Working with user-defined types: Distinct

You can create and use a custom data type that's called a [user-defined distinct type](https://www.ibm.com/support/knowledgecenter/en/SSEPEK_13.0.0/sqlref/src/tpc/db2z_distincttypessql.html) in Db2 for z/OS. For example, let's say that you keep email documents that are sent to your company in a Db2 table. The Db2 data type of an email document is a CLOB, but you define it as a distinct type so that you can control the types of operations that are performed on the email data. The distinct type is defined like this:

```
CREATE DISTINCT TYPE E_MAIL AS CLOB(5M); 
```

Now you can define and write a native stored procedure or user-defined function to search for and return the following information about an email document:

- Subject
- Sender
- Date sent
- Message content
- Indicator of whether the document contains a user-specified string.

The following example shows how to create a user-defined distinct type for a currency (US_DOLLAR), how to include it in a stored procedure, and how to do some calculations.

Note that the US_DOLLAR distinct type does not automatically inherit the functions and operators of its source type, DECIMAL. You can use **casting** functions to assign values other than host variables. Also, the DISTINCT keyword is optional.

```
CREATE DISTINCT TYPE US_DOLLAR AS DECIMAL(9,2);
CREATE TYPE EURO AS DECIMAL(9,2);
 
CREATE PROCEDURE ADMF001.SALESSUM (
   IN DOLLAR_AMOUNT US_DOLLAR,
   IN EURO_AMOUNT EURO,
   OUT TOTAL_DOLLAR US_DOLLAR,
   OUT TOTAL_EURO EURO
  )
  LANGUAGE SQL
  VERSION V1
  ISOLATION LEVEL CS 
  BEGIN
    SET TOTAL_DOLLAR = DECIMAL(DOLLAR_AMOUNT)*200;
    SET TOTAL_EURO = DECIMAL(EURO_AMOUNT)+300.07;
  END
```

Setting this input returns the following output:

```
DOLLAR_AMOUNT  IN: 34.50
EURO_AMOUNT    IN: 500
TOTAL_DOLLAR  OUT: 6900.00
TOTAL_DOLLAR  OUT: 30507.00
```

## Working with user-defined types: Arrays

An array value is a structure that contains an ordered collection of elements. Arrays make it easier to exchange long lists of values with the Db2 server. You can create a user-defined data type for an array in Db2 for z/OS.

The following example shows how to create an ordinary array user-defined type (PHONENUMBERS) that can contain a maximum of 50 elements. The elements are of the DECIMAL(10,0) data type. The array index starts with 1.

```
CREATE TYPE PHONENUMBERS AS DECIMAL(10,0) ARRAY[50];

CREATE PROCEDURE ADMF001.TESTPROC(
   IN PHONENUMBER PHONENUMBERS,
   OUT outPHONENUMBER PHONENUMBERS
  )
  LANGUAGE SQL
  VERSION V1
  ISOLATION LEVEL CS
  BEGIN
    SET outPHONENUMBER[1]= PHONENUMBER[1];
  END
```

Setting this input returns the following output:

```
PHONENUMBER      IN: [6262158888;4056789999]
outPHONENUMBER  OUT: [6262158888]
```

The following example shows how to create an ordinary arrays user-defined type for time and timestamp with time zone. The default TIMESTAMP WITH TIME ZONE length is 6.

```
CREATE TYPE TIMEARRAY AS TIME ARRAY[];
CREATE TYPE TIMESTAMPARRAY AS TIMESTAMP WITH TIME ZONE ARRAY[];

CREATE PROCEDURE ADMF001.TESTPROC (
  IN inTIME TIMEARRAY,
  IN inTIMESTAMPWITHZONE TIMESTAMPARRAY
  OUT outTIME TIME
  OUT outTIMESTAPWITHZONE TIMESTAMPARRAY
    )
  LANGUAGE SQL
  VERSION V1
  ISOLATION LEVEL CS
  BEGIN
    SET outTIME = INTIME[1];
    SET outTIMESTAMPWITHZONE[1] = inTIMESTAMPWITHZONE[1];
  END
```

Setting this input returns the following output:

```
inTIME               IN: [08:09:01;10:15:00;11:08:30]
inTIMESTAMPWITHZONE  IN: [2020-10-15 15:01:01.111213141516+4:00]
outTIME             OUT: 08:09:01
outTIMESTAPWITHZONE OUT: [2020-10-15 15:01:01.111213]
```
