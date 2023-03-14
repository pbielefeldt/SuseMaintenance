#!/usr/bin/env bash
# transfer markdown files to docx files using pandoc and XETEX
# (see https://github.com/pbielefeldt/LaTeX-Stuff/blob/master/markdown2pdf.sh)
 
# get base name (including path)
fn_0="$1"
fn=${fn_0%.*}
 
pandoc "$1"  --standalone --from=markdown+emoji --to=docx \
  -o ${fn}.docx;
 
echo "written ${fn}.docx"
