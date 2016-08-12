#!/usr/bin/lua

local sparator = ','

function help()
	-- Show help
	print('CSV to SQL 0.1.0')
	print('Convert CSV file to SQL sentence')
	print('(c) 2016 Alfonso Saavedra "Son Link"')
	print('https://son-link.github.io')
	print('USE: '..arg[0]..' <csv file> <sql> <output file> [separator]')
	print('')
	print('Example:')
	print(arg[0]..' file.csv "UPDATE table SET name = \'%2\' WHERE id = %1" output.sql') 
	print('WHere %n is the number of column (1 is the firts column)')
	print('By default the separator of columns is ,.Ifyou use aother, like ; use the fourth parameter')
end

if #arg < 3 or #arg > 4 then
	help()
else
	if #arg == 4 then
		separator = arg[4]
	end
	local csv = require("csv")
	local f = csv.open(arg[1],{separator = separator})
	local o = io.open(arg[3], 'w')
	local s = arg[2]
	io.output(o)
	for fields in f:lines() do
		local i = 1
		local s2 = s
		while i <= #fields do
			s2 = s2:gsub('%%'..i, fields[i])
			i = i + 1
		end
		io.write(s2..'\n')
	end
	io.close(o)
end
