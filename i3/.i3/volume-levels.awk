#!/usr/bin/awk -f

{
	if (NR == 6) {
		gsub(/\[|\]/,"", $POS);
		print $POS;
	}
}
