# CVS2SQL
### (c) 2016 Alfonso Saavedra "Son Link"
### Under GPLv3 license

Make a SQL seqeunce file using a CSV file as data input

### Use:
csv2sql csv sql output \[csv separator\]

Examples:

```sh
csv2sql.lua mydata.csv "INSERT INTO mytable VALUES ('%1', '%2');
csv2sql.lua otherdata.csv "UPDATE users SET user = '%6' WHERE id = %1;" output.sql ';'
```
where *%n* is the number of the column. The last parameter is optional if you use another column separator, like *;*. Not tested with other delimeters like tabs or other final lines

Lua-CSV module by [Geoff Leyland](https://github.com/geoffleyland/lua-csv)