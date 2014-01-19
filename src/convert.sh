#!/bin/bash

SRC_DIR=.
DST_DIR_MD=..
DST_DIR_RSS=../../blog/rss

declare -a list_types=(books concerts crashes exhibitions hikes movies plays trips)

for list_type in ${list_types[@]}
do
  echo "Generating $list_type MD/RSS files..."
  base_md_filename="$(tr '[:lower:]' '[:upper:]' <<< ${list_type:0:1})${list_type:1}"
  base_rss_filename="$list_type"
  saxon -s:$SRC_DIR/$list_type.xml -xsl:$SRC_DIR/xmltomd.xsl > $DST_DIR_MD/$base_md_filename.md
  saxon -s:$SRC_DIR/$list_type.xml -xsl:$SRC_DIR/xmltorss.xsl > $DST_DIR_RSS/$base_rss_filename.rss
done
