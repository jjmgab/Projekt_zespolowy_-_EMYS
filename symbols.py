# -*- coding: utf-8 -*-

symbols =   ["ą", "ć", "ę", "ł", "ń", "ó", "ś", "ź", "ż", "Ą", "Ć", "Ę", "Ł", "Ń", "Ó", "Ś", "Ź", "Ż"]
change_to = ["\\xc4\\x85", "\\xc4\\x87", "\\xc4\\x99", "\\xc5\\x82", "\\xc5\\x84", "\\xc3\\xb3", "\\xc5\\x9b", "\\xc5\\xba", "\\xc5\\xbc", "\\xc4\\x84", "\\xc4\\x86", "\\xc4\\x98", "\\xc5\\x81", "\\xc5\\x83", "\\xc3\\x93", "\\xc5\\x9a", "\\xc5\\xb9", "\\xc5\\xbb"]

out_file = open("out.txt", 'w')

with open("in.txt", 'r') as in_file:
	for line in in_file:
		for sym in line:
			if sym in symbols:
				out_file.write(change_to[symbols.index(sym)])
				print(change_to[symbols.index(sym)], sep='', end='')
			else:
				out_file.write(sym)
				print(sym, sep='', end='')

out_file.close()