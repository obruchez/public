#!/bin/bash

SRC_DIR=.
DST_DIR=..

declare -a list_types=(books concerts crashes exhibitions movies plays trips)

#for list_type in ${list_types[@]}
#do
#  echo "Generating $list_type MD file..."
#  saxon -s:$SRC_DIR/$list_type.xml -xsl:$SRC_DIR/xmltomd.xsl > $DST_DIR/$list_type.md
#done

saxon -s:books.xml -xsl:xmltomd.xsl > $DST_DIR/Books.md
