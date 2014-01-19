#!/bin/bash

SRC_DIR=.
DST_DIR=../../blog/rss

declare -a list_types=(books concerts crashes exhibitions hikes movies plays trips)

for list_type in ${list_types[@]}
do
  echo "Generating $list_type RSS file..."
  saxon -s:$SRC_DIR/$list_type.xml -xsl:$SRC_DIR/xmltorss.xsl > $DST_DIR/$list_type.rss
done
