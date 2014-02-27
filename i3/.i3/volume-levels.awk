#!/usr/bin/gawk -f

{
	if (NR == 6) {
		gsub(/\[|\]/,"", $POS);
		print $POS;
	}
}
