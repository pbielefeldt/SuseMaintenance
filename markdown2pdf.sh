#!/usr/bin/env bash
# transfer markdown files to pdf files using pandoc and XETEX
 
# get base name (including path)
fn_0="$1"
fn=${fn_0%.*}
 
pandoc "$1"  --standalone --from=markdown+emoji --pdf-engine=xelatex \
  -V geometry:a4paper \
  -V colorlinks \
  -V urlcolor=NavyBlue \
  -V geometry:"top=2.5cm, bottom=1.5cm, left=3cm, right=2cm" \
  -V mainfont="Liberation Serif" \
  -V sansfont="Liberation Sans" \
  --highlight-style=tango \
  -o ${fn}.pdf;
 
echo "written ${fn}.pdf"
