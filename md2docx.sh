#!/bin/bash
prefix=
targetprefix=/github/workspace/gen
refdoc=$prefix/custom-reference-whucs.docx
echo $1
dir=$(dirname $1)
basename=$(basename $1)
fname="${basename%.*}"
echo dir=$dir fname=$fname target=$targetprefix/$fname.docx
cd $dir
pandoc1 --verbose -t docx+native_numbering -F mermaid-filter -f markdown+table_captions --resource-path=$dir --reference-doc $refdoc -o $targetprefix/$fname.docx $1