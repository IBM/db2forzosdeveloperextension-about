---
title: "Working with user-defined types"
---

# {{ page.title }}

You can use Db2 Developer Extension to create [user-defined types](https://www.ibm.com/docs/en/db2-for-zos/13?topic=concepts-user-defined-types). This article describes how to create the two types of user-defined types: distinct types and array types.

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
