---
title: "Formatting errors when using the backslash as the escape character"
---

# {{ page.title }}

The Visual Studio Code editor uses the backslash ``` `\` ``` as the default escape character within a string, which means that within a string, instances of a backslash followed by a single quotation mark ``` `\'` ``` are interpreted as a single quotation mark ``` `'` ``` character. 
 
Using the string ``` `'\'` ``` can result in incorrectly formatted SQL if you don't escape the ``` `\` ``` because Visual Studio Code interprets the first ``` `'` ``` as the start of the string and the ``` `\'` ``` as simply a quotation character within the string. This string can cause Visual Studio Code, and subsequently the formatter, to interpret every character that follows as part of the string until another ``` `'` ``` is matched.
 
To escape the ``` `\` ``` from ``` `'\'` ```, use ``` `\\` ```, which results in ``` `'\\'` ```.
