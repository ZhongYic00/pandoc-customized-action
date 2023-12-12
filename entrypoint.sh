#!/bin/bash
mkdir /github/workspace/gen/
cd /
repo=/github/workspace
cp .puppeteer.json $repo/docs/reports/
for i in $(ls $repo/docs/reports/*.md)
do
echo $i;
./md2docx.sh $i;
done
ls /
rm $repo/docs/reports/.puppeteer.json